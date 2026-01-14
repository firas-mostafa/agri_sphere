<?php

namespace App\Http\Requests\product;

use Illuminate\Foundation\Http\FormRequest;

class UpdateProductRequest extends FormRequest
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
        return [
            'category_id' => 'required|integer',
            'brand_id' => 'nullable|integer',
            'product_type' => 'required|string',
            'name' => 'required|string',
            'description' => 'nullable|string',
            'short_description' => 'nullable|string',
            'image' => 'nullable|string',
            'barcode' => 'nullable|string',
            'sku' => 'required|unique:products,sku,'.$this->route('id').',product_id',
            'stock_qunatity' => 'nullable|string',
            'average_rating' => 'nullable|numeric',
            'total_reviews' => 'nullable|integer',

        ];
    }
}
