<?php

namespace App\Http\Requests\order\purchasedOrder;

use Illuminate\Foundation\Http\FormRequest;

class StorePurchasedOrderRequest extends FormRequest
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
        // Define allowed order types in a constant
        $allowedOrderTypes = [
            'purchased_order',
        ];

        // Define allowed order status in a constant
        $allowedOrderStatus = [
            'pending',
            'processing',
            'shipped',
            'delivered',
            'cancelled',
        ];

        return [
            'order_type' => 'required|string|in:'.implode(',', $allowedOrderTypes),
            'discount_amount' => 'nullable|numeric',
            'cancelled_at' => 'nullable|string',
            'cancellation_reason' => 'nullable|string',
            'subtotal' => 'required|numeric',
            'grand_total' => 'required|numeric',
            'order_status' => 'required|string|in:'.implode(',', $allowedOrderStatus),
            'required_date' => 'nullable|string',
            'shipped_date' => 'nullable|string',
            'shipping_fee' => 'required|numeric',
        ];
    }
}
