<?php

namespace App\Http\Requests\order\rentalOrder;

use Illuminate\Foundation\Http\FormRequest;

class StoreRentalOrderRequest extends FormRequest
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
            'rental_order',
        ];

        // Define allowed rental status types in a constant
        $allowedRentStatus = [
            'quote',
            'confirmed',
            'active',
            'completed',
            'cancelled',
            'no_show',
        ];

        // Define pick up status in a constant
        $allowedPickupStatus = [
            'pending',
            'customer_present',
            'vehicle_ready',
            'completed',
        ];

        // Define drop off status in a constant
        $allowedDropoffStatus = [
            'pending',
            'vehicle_returned',
            'inspection_pending',
            'completed',
        ];

        return [
            'rental_product_id' => 'required|integer',
            'order_type' => 'required|string|in:'.implode(',', $allowedOrderTypes),
            'order_date' => 'required|string',
            'discount_amount' => 'nullable|numeric',
            'cancelled_at' => 'nullable|string',
            'cancellation_reason' => 'nullable|string',
            'actual_pickup_date' => 'nullable|string',
            'actual_dropoff_date' => 'nullable|string',
            'rental_status' => 'required|string|in:'.implode(',', $allowedRentStatus),
            'pickup_status' => 'required|string|in:'.implode(',', $allowedPickupStatus),
            'dropoff_status' => 'required|string|in:'.implode(',', $allowedDropoffStatus),
            'base_rental_amount' => 'required|numeric',
            'tax_amount' => 'required|numeric',
            'insurance_total' => 'nullable|numeric',
            'total_amount' => 'required|numeric',
            'refund_amount' => 'nullable|numeric',
        ];
    }
}
