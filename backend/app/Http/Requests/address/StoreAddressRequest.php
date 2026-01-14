<?php

namespace App\Http\Requests\address;

use Illuminate\Foundation\Http\FormRequest;

class StoreAddressRequest extends FormRequest
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
        // Define allowed address types in a constant
        $allowedAddressTypes = [
            'user_address',
            'shipping',
            'billing',
            'pickup',
            'dropoff',
        ];

        return [
            'address_line1' => 'required|string',
            'address_line2' => 'nullable|string',
            'city' => 'required|string',
            'state' => 'nullable|string',
            'postal_code' => 'nullable|string',
            'country' => 'required|string',
            'address_type' => 'required|string|in:'.implode(',',  $allowedAddressTypes),
        ];
    }
}
