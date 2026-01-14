<?php

namespace App\Http\Requests\payment;

use Illuminate\Foundation\Http\FormRequest;

class StorePaymentRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        // Define allowed payment status in a constant
        $allowedPaymentStatus = [
            'pending',
            'completed',
            'failed',
            'refunded',
        ];

        return [
            'payment_method' => 'required',
            'payment_status' => 'required|in:', implode(',', $allowedPaymentStatus),
            'amount' => 'required|numeric',
            'paid_at' => 'nullable|string'
        ];
    }
}
