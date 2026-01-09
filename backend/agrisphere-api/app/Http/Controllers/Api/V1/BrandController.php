<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use Illuminate\Http\Request;

class BrandController extends Controller
{
    public function index()
    {
        return response()->json(Brand::orderBy('brand_id', 'desc')->get());
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => ['required', 'string', 'max:255', 'unique:brands,name'],
            'description' => ['nullable', 'string'],
        ]);

        $brand = Brand::create($data);

        return response()->json($brand, 201);
    }

    public function show(Brand $brand)
    {
        return response()->json($brand);
    }

    public function update(Request $request, Brand $brand)
    {
        $data = $request->validate([
            'name' => ['sometimes', 'required', 'string', 'max:255', 'unique:brands,name,' . $brand->brand_id . ',brand_id'],
            'description' => ['nullable', 'string'],
        ]);

        $brand->update($data);

        return response()->json($brand);
    }

    public function destroy(Brand $brand)
    {
        $brand->delete();

        return response()->json(['message' => 'Brand deleted']);
    }
}
