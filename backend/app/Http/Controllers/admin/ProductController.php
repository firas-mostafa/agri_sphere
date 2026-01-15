<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\product\StoreProductRequest;
use App\Http\Requests\product\UpdateProductRequest;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\PurchasedProduct;
use App\Models\RentalProduct;
use App\Models\TempImage;
use App\Services\ProductService;
use App\Services\ResponseService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Drivers\Gd\Driver;
use Intervention\Image\ImageManager;

class ProductController extends Controller
{
    private $itemName = "Product";
    private $purchasedProductType = "purchased_product";
    private $rentalProductType = "rental_product";

    // This method will return all products
    public function index() {
        $products = ProductService::showAllProducts();

        return ResponseService::allItemsResponse($products);
    }

    // This method will store a single product in DB
    public function store(StoreProductRequest $request) {
        $product = ProductService::storeProduct($request);

        $validator = null;

        if ( $request->product_type != null ) {

            if ( $request->product_type == "purchased_product" ) 
            {
                $validator = ProductService::validatePurchasedProduct($request);

                if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

                $product->save();

                $purchasedProduct = ProductService::storePurchasedProduct($request, $product);
            } 

            else if ( $request->product_type == "rental_product" ) 
            {
                $validator = ProductService::validateRentalProduct($request);

                if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

                $product->save();

                $rentalProduct = ProductService::storeRentalProduct($request, $product);

            }
        }

        // Save the product images
        if ( !empty($request->gallery) ) {
            foreach ( $request->gallery as $key => $tempImageId ) {
                $tempImage = TempImage::find($tempImageId);

                // Large Thumbnail
                $extArray = explode('.', $tempImage->name);
                $ext = end($extArray);
                $rand = rand(1000,10000);

                $imageName = $product->id.'-'.$rand.time().'.'.$ext; // 2-123456789.jpg

                $manager = new ImageManager(Driver::class);
                $img = $manager->read(public_path('uploads/temp/'.$tempImage->name));
                $img->scaleDown(1200);
                $img->save(public_path('uploads/products/large/'.$imageName));

                // Small Thumbnail
                $manager = new ImageManager(Driver::class);
                $img = $manager->read(public_path('uploads/temp/'.$tempImage->name));
                $img->coverDown(400, 460);
                $img->save(public_path('uploads/products/small/'.$imageName));

                $productImage = new ProductImage();
                $productImage->image = $imageName;
                $productImage->product_id = $product->id;
                $productImage->save();

                if ( $key == 0 ) {
                    $product->image = $imageName;
                    $product->save();
                }
            }
        }

        if ( $request->product_type == "purchased_product" )
            return ProductService::successStoreProductResponse($product, $purchasedProduct, $this->purchasedProductType);
        else if ( $request->product_type == "rental_product" )
            return ProductService::successStoreProductResponse($product, $rentalProduct, $this->rentalProductType);

    }

    // This method will return a single product with specific ID
    public function show(string $id) {
        $product = ProductService::getProductById($id);

        if ( $product == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        return ResponseService::singleItemsResponse($product);
    }

    // This method will update a single product with specific ID
    public function update(UpdateProductRequest $request, string $id) {
        $product = Product::find($id);

        if ( $product == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);
        
        $request->validated();

        $validator = null;

        if ( $request->product_type ) 
        {
            if ( $request->product_type == "purchased_product" ) {

                $validator = ProductService::validatePurchasedProduct($request);

                if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

                if ( $request->product_type != $product->product_type ) {
                    $rentalProduct = RentalProduct::find($id);
                    $rentalProduct->delete($id);
                } 

                $validator = ProductService::validatePurchasedProduct($request);

                if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

                $product = ProductService::updateProductById($request, $id);

                $product->save();

                $purchasedProduct = ProductService::updatePurchasedProductById($request, $id);

                return ProductService::successUpdateProductResponse($id, $product, $purchasedProduct, $this->purchasedProductType);
            } 

            else if ( $request->product_type == "rental_product") {

                $validator = ProductService::validateRentalProduct($request);

                if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

                if ( $request->product_type != $product->product_type ) {
                    $purchasedProduct = PurchasedProduct::find($id);
                    $purchasedProduct->delete();
                } 

                $product = ProductService::updateProductById($request, $id);

                $product->save();

                $rentalProduct = ProductService::updateRentalProductById($request, $id);

                return ProductService::successUpdateProductResponse($id, $product, $rentalProduct, $this->rentalProductType);
            }
        }
    }

    // This method will delete a single product with specific ID
    public function destroy(string $id) {
        $product = ProductService::deleteProductById($id);

        if ( $product == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        return ResponseService::successDeleteItemResponse($this->itemName, $id);
    }

    // This method will store product image in DB and Server
    public function saveProductImage(Request $request) {
        
        // Validate the request
        $validator = Validator::make($request->all(), [
            'image' => 'required|image|mimes:jpeg,png,jpg,gif',
        ]);

        if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);


        $image = $request->file('image');
        $imageName = $request->product_id.'-'.time().'.'.$image->extension(); // 17-23224242.jpg

        // Large Thumbnail
        
        $manager = new ImageManager(Driver::class);
        $img = $manager->read($image->getPathName());
        $img->scaleDown(1200);
        $img->save(public_path('uploads/products/large/'.$imageName));

        // Small Thumbnail
        $manager = new ImageManager(Driver::class);
        $img = $manager->read($image->getPathName());
        $img->coverDown(400, 460);
        $img->save(public_path('uploads/products/small/'.$imageName));

        // Insert a record in product_images table
        $productImage = new ProductImage();
        $productImage->image = $imageName;
        $productImage->product_id = $request->product_id;
        $productImage->save();

        return response()->json([
            'status' => 200,
            'message' => 'Image has been uploaded successfully',
            'data' => $productImage,
        ], 200);
    }

    // This method will update default product image
    public function updateDefaultImage(Request $request) {
        $product = Product::find($request->product_id);

        if ( $product == null ) return ResponseService::itemNotFoundResponse($this->itemName, $request->product_id);

        $product->image = $request->image;
        $product->save();

        return response()->json([
            'status' => 200,
            'message' => 'product default image changed successfully',
        ], 200);
    }

    // This method will delete product image
    public function deleteProductImage(string $id) {
        $productImage = ProductImage::find($id);

        if ( $productImage == null ) {
            return response()->json([
                'status' => 404,
                'message' => 'Image not found',
            ], 404);
        }

        File::delete( public_path('uploads/products/large/').$productImage->image );
        File::delete( public_path('uploads/products/small/').$productImage->image );

        $productImage->delete();

        return response()->json([
            'status' => 200,
            'message' => 'product image deleted successfully',
        ], 200);
    }
}
