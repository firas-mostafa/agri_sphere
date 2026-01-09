<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProductImageController extends Controller
{
    // POST /api/v1/products/{product}/images  (admin)
    public function store(Request $request, Product $product)
    {
        $data = $request->validate([
            'image' => ['required', 'file', 'image', 'max:4096'], // 4MB
        ]);

        $path = $data['image']->store('products', 'public'); // storage/app/public/products/...

        $img = ProductImage::create([
            'product_id' => $product->product_id,
            'path' => $path,
        ]);

        return response()->json([
            'product_image_id' => $img->product_image_id,
            'url' => asset('storage/' . $img->path),
        ], 201);
    }

    // DELETE /api/v1/product-images/{productImage} (admin)
    public function destroy(ProductImage $productImage)
    {
        // delete file
        Storage::disk('public')->delete($productImage->path);

        $productImage->delete();

        return response()->json(['message' => 'Image deleted']);
    }
}
