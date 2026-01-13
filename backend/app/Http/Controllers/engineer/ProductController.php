<?php

namespace App\Http\Controllers\engineer;

use App\Http\Controllers\Controller;
use App\Http\Requests\product\StoreProductRequest;
use App\Http\Requests\product\UpdateProductRequest;
use App\Models\ManagementUserProduct;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\PurchasedProduct;
use App\Models\RentalProduct;
use App\Models\TempImage;
use App\Services\ProductService;
use App\Services\ResponseService;
use Illuminate\Http\Request;
use Intervention\Image\Drivers\Gd\Driver;
use Intervention\Image\ImageManager;

class ProductController extends Controller
{
    private $itemName = "EngineerProduct";
    private $purchasedProductType = "purchased_product";
    private $rentalProductType = "rental_product";

    public function getEngineerProducts(Request $request) {
        $engineerProducts = ProductService::getAllUserProducts($request);

        return ResponseService::allItemsResponse($engineerProducts);
    }

    public function getEngineerProduct (string $id) {
        $engineerProduct = ProductService::getProductById($id);

        if ( $engineerProduct == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        return ResponseService::singleItemsResponse($engineerProduct);
    }

    public function saveEngineerProduct(StoreProductRequest $request) {
        $engineerProduct = ProductService::storeProduct($request);

        $validator = null;

        if ( $request->product_type != null ) {

            if ( $request->product_type == "purchased_product" ) 
            {
                $validator = ProductService::validatePurchasedProduct($request);

                if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

                $engineerProduct->save();

                $purchasedProduct = ProductService::storePurchasedProduct($request, $engineerProduct);

                ManagementUserProduct::create([
                    'user_id' => $request->user()->user_id,
                    'product_id' => $engineerProduct->product_id,
                ]);

                // Save the product images
                if ( !empty($request->gallery) ) {
                    foreach ( $request->gallery as $key => $tempImageId ) {
                        $tempImage = TempImage::find($tempImageId);

                        // Large Thumbnail
                        $extArray = explode('.', $tempImage->name);
                        $ext = end($extArray);
                        $rand = rand(1000,10000);

                        $imageName = $engineerProduct->id.'-'.$rand.time().'.'.$ext; // 2-123456789.jpg

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
                        $productImage->product_id = $engineerProduct->id;
                        $productImage->save();

                        if ( $key == 0 ) {
                            $engineerProduct->image = $imageName;
                            $engineerProduct->save();
                        }
                    }
                }

                return ProductService::successStoreProductResponse($engineerProduct, $purchasedProduct, $this->purchasedProductType);
            } 

            else if ( $request->product_type == "rental_product" ) 
            {
                $validator = ProductService::validateRentalProduct($request);

                if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

                $engineerProduct->save();

                $rentalProduct = ProductService::storeRentalProduct($request, $engineerProduct);

                ManagementUserProduct::create([
                    'user_id' => $request->user()->user_id,
                    'product_id' => $engineerProduct->product_id,
                ]);

                // Save the product images
                if ( !empty($request->gallery) ) {
                    foreach ( $request->gallery as $key => $tempImageId ) {
                        $tempImage = TempImage::find($tempImageId);

                        // Large Thumbnail
                        $extArray = explode('.', $tempImage->name);
                        $ext = end($extArray);
                        $rand = rand(1000,10000);

                        $imageName = $engineerProduct->id.'-'.$rand.time().'.'.$ext; // 2-123456789.jpg

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
                        $productImage->product_id = $engineerProduct->id;
                        $productImage->save();

                        if ( $key == 0 ) {
                            $engineerProduct->image = $imageName;
                            $engineerProduct->save();
                        }
                    }
                }

                return ProductService::successStoreProductResponse($engineerProduct, $rentalProduct, $this->rentalProductType);
            }
        }

    }

    public function updateEngineerProduct(UpdateProductRequest $request, string $id) {
        $engineerProduct = Product::find($id);

        if ( $engineerProduct == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);
        
        $request->validated();

        $validator = null;

        if ( $request->product_type ) 
        {
            if ( $request->product_type == "purchased_product" ) {

                $validator = ProductService::validatePurchasedProduct($request);

                if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

                if ( $request->product_type != $engineerProduct->product_type ) {
                    $rentalProduct = RentalProduct::find($id);
                    $rentalProduct->delete($id);
                } 
                $validator = ProductService::validatePurchasedProduct($request);

                if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

                $engineerProduct = ProductService::updateProductById($request, $id);

                $engineerProduct->save();

                $purchasedProduct = ProductService::updatePurchasedProductById($request, $id);

                return ProductService::successUpdateProductResponse($id, $engineerProduct, $purchasedProduct, $this->purchasedProductType);
            } 

            else if ( $request->product_type == "rental_product") {

                $validator = ProductService::validateRentalProduct($request);

                if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

                if ( $request->product_type != $engineerProduct->product_type ) {
                    $purchasedProduct = PurchasedProduct::find($id);
                    $purchasedProduct->delete();
                } 

                $engineerProduct = ProductService::updateProductById($request, $id);

                $engineerProduct->save();

                $rentalProduct = ProductService::updateRentalProductById($request, $id);

                return ProductService::successUpdateProductResponse($id, $engineerProduct, $rentalProduct, $this->rentalProductType);
            }
        }
    }

    public function deleteEngineerProduct(string $id) {
        $product = ProductService::deleteProductById($id);

        if ( $product == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        return ResponseService::successDeleteItemResponse($this->itemName, $id);
    }
}
