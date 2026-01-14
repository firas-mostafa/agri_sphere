<?php

namespace App\Services;

use App\Http\Requests\product\StoreProductRequest;
use App\Http\Requests\product\UpdateProductRequest;
use App\Models\Product;
use App\Models\PurchasedProduct;
use App\Models\RentalProduct;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class ProductService
{
    // ==================== Public Static Methods ====================

    // This method will return all of the products
    public static function showAllProducts() {
        $products = Product::with(['purchasedProduct', 'rentalProduct'])
            // ->whereHas('purchasedProduct') // Optional: only products that have a purchased product
            // ->whereHas('rentalProduct')    // Optional: only products that have a rental product
            ->get();

        return $products;
    }

    // This method will return all engineer/dealer purchased products
    public static function getAllUserProducts($request) {
        $products = Product::select('products.*', 'MUP.*')
            ->join(
                'management_user_products as MUP', 'products.product_id', '=', 'MUP.product_id'
            )
            ->with(['purchasedProduct', 'rentalProduct', 'productImages'])
            ->where([
                'MUP.user_id' => $request->user()->user_id,
            ])
            ->get();
        
        return $products;
    }

    // This method will return all of the purchased products
    public static function getAllPurchasedProducts() {
        $purchasedProducts = Product::select('products.*', 'PP.*')
            ->join(
                'purchased_products as PP', 'products.product_id', '=', 'PP.purchased_product_id'
            )
            ->with('productImages')
            ->get();
        
        return $purchasedProducts;
    }

    // This method will return the latest purchased products
    public static function getLatestPurchasedProducts() {
        $purchasedProducts = Product::select('products.*', 'PP.*')
            ->join(
                'purchased_products as PP', 'products.product_id', '=', 'PP.purchased_product_id'
            )
            ->with('productImages')
            ->orderBy('products.created_at', 'DESC')
            ->get();
        
        return $purchasedProducts;
    }

    // This method will return the latest purchased products
    public static function getLatestPurchasedProductsByCategory(string $categoryId) {
        $purchasedProducts = Product::select('products.*', 'PP.*')
            ->join(
                'purchased_products as PP', 'products.product_id', '=', 'PP.purchased_product_id'
            )
            ->where('products.category_id', $categoryId)
            ->with('productImages')
            ->orderBy('products.created_at', 'DESC')
            ->get();

        return $purchasedProducts;
    }

    // This method will return all of the rental products
    public static function getAllRentalProducts() {
        $rentalProducts = Product::select('products.*', 'RP.*')
            ->join(
                'rental_products as RP', 'products.product_id', '=', 'RP.rental_product_id'
                )
            ->with('productImages')
            ->get();

        return $rentalProducts;
    }

    // This method will return the latest rental products
    public static function getLatestRentalProducts() {
        $rentalProducts = Product::select('products.*', 'RP.*')
            ->join(
                'rental_products as RP', 'products.product_id', '=', 'RP.rental_product_id'
                )
            ->with('productImages')
            ->orderBy('products.created_at', 'DESC')
            ->get();

        return $rentalProducts;
    }

    // This method will return certain product from DB with specific ID
    public static function getProductById(string $id) {
        $product = Product::find($id);
        
        if ( $product == null ) return null;
        
        $purchasedProduct = PurchasedProduct::find($id);

        if ( $purchasedProduct != null ) {
            // $product = DB::table(
            //         'products as P'
            //     )
            //     ->join(
            //             'purchased_products as PP', 'P.product_id', '=', 'PP.purchased_product_id'
            //         )
            //     ->select(
            //             'P.*', 'PP.*'
            //         )
            //     ->where('product_id', $id)
            //     ->get();

            $product = Product::select('products.*', 'PP.*')
                ->join(
                    'purchased_products as PP', 'products.product_id', '=', 'PP.purchased_product_id'
                    )
                ->with('productImages')
                ->find($id);

            // $product = Product::with('purchasedProduct')->find($id);

        } else {
            $product = Product::select('products.*', 'RP.*')
                ->join(
                    'rental_products as RP', 'products.product_id', '=', 'RP.rental_product_id'
                    )
                ->with('productImages')
                ->find($id);

            // $product = Product::with('rentalProduct')->find($id);
        }

        return $product;
    }

    // This method will store a single product in DB
    public static function storeProduct(StoreProductRequest $request) {
        $product = ProductService::saveProduct($request, new Product());

        return $product;
    }

    // This method will store a single purchased product related to exist product in DB
    public static function storePurchasedProduct($request, $product) {

        // $product_id = Product::orderBy('product_id', 'desc')->first()->product_id;
        $product_id = $product->product_id;

        $purchasedProduct = new PurchasedProduct();

        $purchasedProduct->purchased_product_id = $product_id;

        $purchasedProduct = ProductService::savePurchasedProduct($request, $purchasedProduct, $product_id);

        return $purchasedProduct;
    }

    // This method will sotre a single rental product related to exist product in DB
    public static function storeRentalProduct($request, $product) {

        // $product_id = Product::latest('product_id')->first()->product_id;
        $product_id = $product->product_id;

        $rentalProduct = new RentalProduct();

        $rentalProduct->rental_product_id = $product_id;

        $rentalProduct = ProductService::saveRentalProduct($request, $rentalProduct, $product_id);

        return $rentalProduct;
    }

    // This method will update a single product by specific ID
    public static function updateProductById(UpdateProductRequest $request, string $id) {
        $product = Product::find($id);
        
        $product = ProductService::saveProduct($request, $product);

        return $product;
    }

    // This method will update a single purchased product related to exist product in DB
    public static function updatePurchasedProductById($request, $id) {
        $purchasedProduct = PurchasedProduct::find($id);

        if ( $purchasedProduct == null ) {
            $purchasedProduct = new PurchasedProduct();
            $purchasedProduct->purchased_product_id = $id;
        }

        $purchasedProduct = ProductService::savePurchasedProduct($request, $purchasedProduct);

        return $purchasedProduct;
    }

    // This method will update a single rental product related to exist product in DB
    public static function updateRentalProductById($request, $id) {
        $rentalProduct= RentalProduct::find($id);

        if ( $rentalProduct == null ) {
            $rentalProduct = new RentalProduct();
            $rentalProduct->rental_product_id = $id;
        }

        $rentalProduct = ProductService::saveRentalProduct($request, $rentalProduct);

        return $rentalProduct;
    }

    // This method will delete a single product by specific ID
    public static function deleteProductById(string $id) {
        $product = Product::find($id);

        if ( $product == null ) return null;

        $product->delete();

        return $product;
    }

    // This method will valdiate the requirment of store purcahsed product
    public static function validatePurchasedProduct($request) {
        $purchasedProductRules = [
            'price' => 'required|numeric',
            'compare_price' => 'nullable|numeric',
            'is_active' => 'required'
        ];

        $validator = Validator::make($request->all(), $purchasedProductRules);

        return $validator;
    }

    // This method will valdiate the requirment of store purcahsed product
    public static function validateRentalProduct($request) {
        $rentalProductRules = [
            'hourly_rate' => 'required|numeric',
            'daily_base_rate' => 'required|numeric',
            'weekly_base_rate' => 'required|numeric',
            'monthly_base_rate' => 'required|numeric',
            'transmission' => 'required',
            'fuel_type' => 'required',
            'rent_product_status' => 'required',
        ];

        $validator = Validator::make($request->all(), $rentalProductRules);

        return $validator;
    }

    // This method will return a success response for store product in DB
    public static function successStoreProductResponse($product, $subProduct, $product_type) {
        return response()->json([
            'status' => 200,
            'message' => 'Product has been added succesfully',
            'product' => $product,
            $product_type => $subProduct,
        ], 200);
    }

    // This method will return a success response for update purchased product with specific ID in DB
    public static function successUpdateProductResponse($id, $product, $subProduct, $product_type) {
        return response()->json([
            'status' => 200,
            'message' => 'Product with ID: '.$id.' has been updated successfully',
            'product' => $product,
            $product_type => $subProduct,
        ], 200);
    }

    // This method will return product not found response
    public static function productNotFoundResponse($itemName, $id) {
        return response()->json([
            'status'=> 404,
            'message' => $itemName.' with ID: '.$id.' not found',
            'data' => [],
        ], 404);
    }



    // ========================= Private Static Methods =========================
    private static function saveProduct($request, $product) {
        $data = $request->validated();

        $product->category_id = $data['category_id'];
        $product->product_type = $data['product_type'];
        $product->name = $data['name'];
        $product->sku = $data['sku'];

        $product->brand_id = $request->brand_id;
        $product->description = $request->description;
        $product->short_description = $request->short_description;
        $product->barcode = $request->barcode;
        $product->stock_quantity = $request->stock_quantity;
        $product->average_rating = $request->average_rating;
        $product->total_reviews = $request->total_reviews;
        $product->image = $request->image;

        return $product;
    }

    private static function savePurchasedProduct($request, $purchasedProduct) {
        
        $purchasedProduct->product_type = "purchased_product";
        $purchasedProduct->price = $request->price;
        $purchasedProduct->compare_price = $request->compare_price;
        $purchasedProduct->is_active = $request->is_active;

        $purchasedProduct->save();

        return $purchasedProduct;
    }

    private static function saveRentalProduct($request, $rentalProduct) {
        
        $rentalProduct->product_type = "rental_product";
        $rentalProduct->hourly_rate = $request->hourly_rate;
        $rentalProduct->daily_base_rate = $request->daily_base_rate;
        $rentalProduct->weekly_base_rate = $request->weekly_base_rate;
        $rentalProduct->monthly_base_rate = $request->monthly_base_rate;

        $rentalProduct->transmission = $request->transmission;
        $rentalProduct->fuel_type = $request->fuel_type;
        $rentalProduct->rent_product_status = $request->rent_product_status;

        $rentalProduct->save();

        return $rentalProduct;
    }

    // private static function editPurchasedProduct($request, $purchasedProduct) {
    //     $purchasedProduct->update([
    //         'product_type' => "purchased_product",
    //         'price' => $request->price,
    //         'compare_price' => $request->compare_price,
    //         'is_active' => $request->is_active,
    //     ]);

    //     return $purchasedProduct;
    // }

    // private static function editRentalProduct($request, $rentalProduct) {
    //     $rentalProduct->update([
    //         'product_type' => 'rental_product',
    //         'hourly_rate' => $request->hourly_rate,
    //         'daily_base_rate' => $request->daily_base_rate,
    //         'weekly_base_rate' => $request->weekly_base_rate,
    //         'monthly_base_rate' => $request->monthly_base_rate,
    //         'transmission' => $request->transimission,
    //         'fuel_type' => $request->fuel_type,
    //         'rent_product_status' => $request->rent_product_status,
    //     ]);

    //     return $rentalProduct;
    // }
}
