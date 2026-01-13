<?php

namespace App\Http\Controllers\farmer;

use App\Http\Controllers\Controller;
use App\Http\Requests\order\purchasedOrder\StorePurchasedOrderRequest;
use App\Http\Requests\order\rentalOrder\StoreRentalOrderRequest;
use App\Http\Requests\order\StoreOrderRequest;
use App\Models\PurchasedOrderItem;
use App\Services\AddressService;
use App\Services\OrderService;
use App\Services\PaymentService;
use App\Services\ResponseService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    // Define address types for purchased order
    private $allowedPurchasedAddressTypes = [
        'shipping',
        'billing',
    ];

    // Define address types for rental order
    private $allowedRentalAddressTypes = [
        'pickup',
        'dropoff',
    ];

    public function savePurchasedOrder(StorePurchasedOrderRequest $request) {

        if ( !empty( $request->cart ) ) {
            $purchasedOrder = OrderService::storePurchasedOrder($request);

            $validator = AddressService::validateStoreAddress($request, $this->allowedPurchasedAddressTypes);

            if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

            $validator = OrderService::validateStoreOrder($request);

            if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

            $validator = PaymentService::validateStorePayment($request);

            if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

            $address = AddressService::storeAddress($request);

            $payment = PaymentService::storePayment($request);

            $payment->order_id = $purchasedOrder->purchased_order_id;
            $payment->save();

            $purchasedOrder->shipping_address_id = $address->address_id;

            $purchasedOrder->save();

            // Save Purchased Order Items
            foreach ( $request->cart as $item ) {
                $purchasedOrderItem = new PurchasedOrderItem();

                $purchasedOrderItem->purchased_order_id = $purchasedOrder->purchased_order_id;
                $purchasedOrderItem->purchased_product_id = $item["purchased_order_id"];
                $purchasedOrderItem->name = $item["purchased_order_id"];
                $purchasedOrderItem->quantity = $item["quantity"];
                $purchasedOrderItem->price = $item["qauntity"] * $item["price"];
                $purchasedOrderItem->price_per_unit = $item["price"];
                
                $purchasedOrderItem->save();
            }

            return response()->json([
                'status' => 200,
                'id' => $purchasedOrder->purchased_order_id,
                'message' => 'You have successfully placed your order',
            ], 200);

        } 
        else {
            return response()->json([
                'status' => 400,
                'message' => 'Your cart is empty',
            ], 400);
        }
    }

    public function saveRentalOrder(StoreRentalOrderRequest $request) {

        $rentalOrder = OrderService::storeRentalOrder($request, $request->rental_product_id);

        $validator = AddressService::validateStoreAddress($request, $this->allowedRentalAddressTypes);

        if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

        $validator = OrderService::validateStoreOrder($request);

        if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

        $validator = PaymentService::validateStorePayment($request);

        if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

        $address = AddressService::storeAddress($request);

        $rentalOrder->pickup_location_id = $address->address_id;

        $rentalOrder->save();

        $payment = PaymentService::storePayment($request);

        $payment->save();

        return response()->json([
            'status' => 200,
            'id' => $rentalOrder->rental_order_id,
            'message' => 'You have successfully placed your order',
        ], 200);
    }

    public function createPaymentIntent(Request $request) {

    }

    // This
}
