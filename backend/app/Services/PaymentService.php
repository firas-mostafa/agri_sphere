<?php

namespace App\Services;

use App\Http\Requests\payment\StorePaymentRequest;
use App\Models\Order;
use App\Models\Payment;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;

class PaymentService
{
    // Define allowed payment status in a constant
    private static $allowedPaymentStatus = [
        'pending',
        'completed',
        'failed',
        'refunded',
    ];

    // This method will show all payments
    public static function showAllPayments() {
        $payments = Payment::orderBy('created_at')->get();

        return $payments;
    }

    // This method will store a single payment in DB
    public static function storePayment($request) {
        $data = $request->validated();

        $payment = PaymentService::savePayment($request, new Payment());

        return $payment;
    }

    // This method will update a single payment with specific ID
    public static function updatePaymentById(StorePaymentRequest $request, string $id) {
        $payment = Payment::find($id);

        if ( $payment == null ) return null;

        $payment = PaymentService::savePayment($request, $payment);

        return $payment;
    }
    
    // This method will delete a single payment with specific ID
    public static function deletePaymentById(string $id) {
        $payment = Payment::find($id);

        if ( $payment == null ) return null;

        $payment->delete();

        return $payment;
    }

    public static function validateStorePayment($request) {
        $paymentRules = [
            'payment_method' => 'required',
            'payment_status' => 'required|in:'.implode(',', PaymentService::$allowedPaymentStatus),
            'amount' => 'required|numeric',
            'transaction_id' => 'required|string|unique:payments,transaction_id',
            'paid_at' => 'nullable|string'
        ];

        $validator = Validator::make($request->all(), $paymentRules);

        return $validator;
    }

    // ========================= Private Static Methods =========================

    private static function savePayment($request, $payment) {

        $payment->order_id = Order::latest('order_id')->first()->order_id;
        $payment->payment_method = $request->payment_method;
        $payment->payment_status = $request->payment_status;
        $payment->amount = $request->amount;
        $payment->transaction_id = $request->transaction_id;

        $request->payment_method != "cod" 
        ? 
            $payment->paid_at = Carbon::now()
        : 
            $payment->paid_at;

        return $payment;
    }
}
