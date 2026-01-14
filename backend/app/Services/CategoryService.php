<?php

namespace App\Services;

use App\Http\Requests\category\StoreCategoryRequest;
use App\Models\Category;

class CategoryService
{
    // This static method will return all categories
    public static function showAllCategoies() {
        $categories = Category::orderBy('created_at', 'DESC')->get();

        return $categories;
    }

    // This static method will store a single category
    public static function storeCategory(StoreCategoryRequest $request) {
        $data = $request->validated();

        $category = new Category();
        $category->name = $data['name'];
        $category->is_active = $data['is_active'];

        $category->save();

        return $category;
    }

    // This static method will update a single category with specific ID
    public static function updateCategoryById(StoreCategoryRequest $request, string $id) {
        $category = Category::find($id);

        if ( $category == null ) return null;

        $data = $request->validated();

        $category->name = $data['name'];
        $category->is_active = $data['is_active'];

        $category->save();

        return $category;
    }

    // This static method will delete a single category with specific ID
    public static function deleteCategoryById(string $id) {
        $category = Category::find($id);

        if ( $category == null ) return null;

        $category->delete();
    }
}
