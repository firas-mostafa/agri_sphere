<?php

namespace App\Http\Requests\order;

use Illuminate\Foundation\Http\FormRequest;

class StoreOrderRequest extends FormRequest
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
            'rental_order',
        ];

        return [
            'order_type' => 'required|string|in:'.implode(',', $allowedOrderTypes),
            'discount_amount' => 'nullable|numeric',
            'cancelled_at' => 'nullable|string',
            'cancellation_reason' => 'nullable|string',
        ];
    }
}
