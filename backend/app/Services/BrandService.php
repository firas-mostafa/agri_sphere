<?php

namespace App\Services;

use App\Http\Requests\brand\StoreBrandRequest;
use App\Models\Brand;

class BrandService
{
    // This method will show all brands
    public static function showAllBrands() {
        $brands = Brand::orderBy('created_at')->get();

        return $brands;
    }

    // This method will store a single brand in DB
    public static function storeBrand(StoreBrandRequest $request) {
        $data = $request->validated();

        $brand = new Brand();
        $brand->name = $data['name'];
        $brand->is_active = $data['is_active'];

        $brand->save();

        return $brand;
    }

    // This method will update a single brand with specific ID
    public static function updateBrandById(StoreBrandRequest $request, string $id) {
        $brand = Brand::find($id);

        if ( $brand == null ) return null;

        $data = $request->validated();

        $brand->name = $data['name'];
        $brand->is_active = $data['is_active'];

        $brand->save();

        return $brand;
    }
    
    // This method will delete a single brand with specific ID
    public static function deleteBrandById(string $id) {
        $brand = Brand::find($id);

        if ( $brand == null ) return null;

        $brand->delete();

        return $brand;
    }
}
