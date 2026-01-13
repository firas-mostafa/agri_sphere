<?php

namespace App\Http\Requests\product\purchasedProduct;

use Illuminate\Foundation\Http\FormRequest;

class StorePurchasedProductRequest extends FormRequest
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
        // Define allowed product types in a constant 
        $allowedProductTypes = [
            'purchased_product',
        ];

        return [
            'product_type' => 'required|string|in:'.implode(',', $allowedProductTypes),
            'price' => 'required|numeric',
            'compare_price' => 'nullable|numeric',
            'is_active' => 'required'
        ];
    }
}
