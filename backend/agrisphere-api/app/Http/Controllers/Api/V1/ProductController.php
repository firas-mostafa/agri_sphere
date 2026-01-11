<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class ProductController extends Controller
{
    // GET /api/v1/products?search=&category_id=&brand_id=&status=&page=
    public function index(Request $request)
    {
        $query = Product::query()->with(['category', 'brand', 'images'])
->orderByDesc('product_id');

        if ($request->filled('search')) {
            $search = $request->string('search')->toString();
            $query->where('name', 'like', "%{$search}%");
        }

        if ($request->filled('category_id')) {
            $query->where('category_id', $request->integer('category_id'));
        }

        if ($request->filled('brand_id')) {
            $query->where('brand_id', $request->integer('brand_id'));
        }

        if ($request->filled('status')) {
            $query->where('status', $request->string('status')->toString());
        }

        return response()->json(
            $query->paginate(10)
        );
    }

    // POST /api/v1/products
    public function store(Request $request)
    {
        $data = $request->validate([
            'category_id' => ['required', 'integer', 'exists:categories,category_id'],
            'brand_id'    => ['required', 'integer', 'exists:brands,brand_id'],
            'name'        => ['required', 'string', 'max:255'],
            'description' => ['nullable', 'string'],
            'price'       => ['required', 'numeric', 'min:0'],
            'quantity'    => ['required', 'integer', 'min:0'],
            'status'      => ['nullable', Rule::in(['active', 'inactive'])],
        ]);

        // enforce unique brand_id + name at validation-level too (nicer error than SQL)
        $exists = Product::where('brand_id', $data['brand_id'])
            ->where('name', $data['name'])
            ->exists();

        if ($exists) {
            return response()->json([
                'message' => 'The name has already been taken for this brand.',
                'errors' => ['name' => ['The name has already been taken for this brand.']]
            ], 422);
        }

        $product = Product::create($data)->load(['category', 'brand']);

        return response()->json($product, 201);
    }

    // GET /api/v1/products/{product}
    public function show(Product $product)
    {
        return response()->json($product->load(['category', 'brand', 'images']));

    }

    // PUT/PATCH /api/v1/products/{product}
    public function update(Request $request, Product $product)
    {
        $data = $request->validate([
            'category_id' => ['sometimes', 'required', 'integer', 'exists:categories,category_id'],
            'brand_id'    => ['sometimes', 'required', 'integer', 'exists:brands,brand_id'],
            'name'        => ['sometimes', 'required', 'string', 'max:255'],
            'description' => ['nullable', 'string'],
            'price'       => ['sometimes', 'required', 'numeric', 'min:0'],
            'quantity'    => ['sometimes', 'required', 'integer', 'min:0'],
            'status'      => ['sometimes', 'nullable', Rule::in(['active', 'inactive'])],
        ]);

        // if brand_id or name changed, check unique (brand_id + name)
        $brandId = $data['brand_id'] ?? $product->brand_id;
        $name    = $data['name'] ?? $product->name;

        $exists = Product::where('brand_id', $brandId)
            ->where('name', $name)
            ->where('product_id', '!=', $product->product_id)
            ->exists();

        if ($exists) {
            return response()->json([
                'message' => 'The name has already been taken for this brand.',
                'errors' => ['name' => ['The name has already been taken for this brand.']]
            ], 422);
        }

        $product->update($data);

        return response()->json($product->fresh()->load(['category', 'brand']));
    }

    // DELETE /api/v1/products/{product}
    public function destroy(Product $product)
    {
        $product->delete();

        return response()->json(['message' => 'Product deleted']);
    }
}
