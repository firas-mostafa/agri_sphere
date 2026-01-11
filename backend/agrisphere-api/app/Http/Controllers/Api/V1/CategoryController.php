<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    // GET /api/v1/categories
    public function index()
    {
        return response()->json(Category::orderBy('category_id', 'desc')->get());
    }

    // POST /api/v1/categories
    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => ['required', 'string', 'max:255', 'unique:categories,name'],
            'description' => ['nullable', 'string'],
        ]);

        $category = Category::create($data);

        return response()->json($category, 201);
    }

    // GET /api/v1/categories/{category}
    public function show(Category $category)
    {
        return response()->json($category);
    }

    // PUT/PATCH /api/v1/categories/{category}
    public function update(Request $request, Category $category)
    {
        $data = $request->validate([
            'name' => ['sometimes', 'required', 'string', 'max:255', 'unique:categories,name,' . $category->category_id . ',category_id'],
            'description' => ['nullable', 'string'],
        ]);

        $category->update($data);

        return response()->json($category);
    }

    // DELETE /api/v1/categories/{category}
    public function destroy(Category $category)
    {
        $category->delete();

        return response()->json(['message' => 'Category deleted']);
    }
}
