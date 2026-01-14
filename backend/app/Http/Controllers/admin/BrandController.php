<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\brand\StoreBrandRequest;
use App\Models\Brand;
use App\Services\BrandService;
use App\Services\ResponseService;

class BrandController extends Controller
{
    private $itemName = "Brand";

    // This method will return all brands
    public function index() {
        $brands = BrandService::showAllBrands();

        return ResponseService::allItemsResponse($brands);
    }

    // This method will store a single brand in DB
    public function store(StoreBrandRequest $request) {
        $brand = BrandService::storeBrand($request);

        return ResponseService::successInsertItemResponse($this->itemName, $brand);
    }

    // This method will return a single brand with specific ID
    public function show(string $id) {
        $brand = Brand::find($id);

        if ( $brand == null ) {
            return ResponseService::itemNotFoundResponse($this->itemName, $id);
        }

        return ResponseService::singleItemsResponse($brand);
    }

    // This method will update a single brand with specific ID
    public function update(StoreBrandRequest $request, string $id) {
        $brand = BrandService::updateBrandById($request, $id);

        if ( $brand == null ) {
            return ResponseService::itemNotFoundResponse($this->itemName, $id);
        } else {
            return ResponseService::successUpdateItemResponse($this->itemName, $id, $brand);
        }
    }

    // This method will delete a single brand with specific ID
    public function destroy(string $id) {
        $brand = BrandService::deleteBrandById($id);

        if ( $brand == null ) {
            return ResponseService::itemNotFoundResponse($this->itemName, $id);
        }

        return ResponseService::successDeleteItemResponse($this->itemName, $id);
    }
}