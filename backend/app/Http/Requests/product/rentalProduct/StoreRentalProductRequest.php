<?php

namespace App\Http\Requests\product\rentalProduct;

use Illuminate\Foundation\Http\FormRequest;

class StoreRentalProductRequest extends FormRequest
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
        // Define allowed product type in a constant
        $allowedProductTypes = [
            'rental_product',
        ];

        // Define allowed transmission types in a constant
        $allowedTransmissionTypes = [
            'automatic',
            'manual',
            'cvt',
            'electric',
        ];
        
        // Define allowed fuel types in a constant
        $allowedFuelTypes = [
            'diesel',
            'gasoline',
            'electric',
            'hybrid',
            'plug-in_hybrid',
        ];
        
        // Define allowed rent product status in a constant
        $allowedRentProductStatus = [
            'available',
            'rented',
            'maintenance',
            'cleaning',
            'out_of_service',
        ];

        return [
            'product_type' => 'required|string|in:'.implode(',', $allowedProductTypes),
            'hourly_rate' => 'required|numeric',
            'daily_base_rate' => 'required|numeric',
            'weekly_base_rate' => 'required|numeric',
            'monthly_base_rate' => 'required|numeric',
            'transmission' => 'required|in:'.implode(',', $allowedTransmissionTypes),
            'fuel_type' => 'required|in:'.implode(',', $allowedFuelTypes),
            'rent_product_status' => 'required|in:'.implode(',', $allowedRentProductStatus),
        ];
    }
}
