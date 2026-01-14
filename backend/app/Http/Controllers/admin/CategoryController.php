<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\category\StoreCategoryRequest;
use App\Models\Category;
use App\Services\CategoryService;
use App\Services\ResponseService;

class CategoryController extends Controller
{
    private $itemName = "Category";

    // This method will return all categories
    public function index() {
        $categories = CategoryService::showAllCategoies();

        return ResponseService::allItemsResponse($categories);
    }

    // This method will store a single category in DB
    public function store(StoreCategoryRequest $request) {
        $category = CategoryService::storeCategory($request);
        
        return ResponseService::successInsertItemResponse($this->itemName, $category);
    }

    // This method will return a single category in with specific ID
    public function show(string $id) {
        $category = Category::find($id);

        if ( $category == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        return ResponseService::singleItemsResponse($category);
    }

    // This method will update a single category with specific ID
    public function update(StoreCategoryRequest $request, string $id) {
        $category = CategoryService::updateCategoryById($request, $id);

        if ( $category == null ) {
            return ResponseService::itemNotFoundResponse($this->itemName, $id);
        }
        else {
            return ResponseService::successUpdateItemResponse($this->itemName, $id, $category);
        }
    }

    // This method will destroy a single category with specific ID
    public function destroy(string $id) {
        $category = CategoryService::deleteCategoryById($id);

        if ( $category == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        return ResponseService::successDeleteItemResponse($this->itemName, $id);
    }
}