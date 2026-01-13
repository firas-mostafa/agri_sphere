<?php

namespace App\Http\Controllers\dealer;

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
    private $itemName = "RentalProduct";
    private $purchasedProductType = "purchased_product";

    public function getDealerProducts(Request $request) {
        $dealerProducts = ProductService::getAllUserProducts($request);

        return ResponseService::allItemsResponse($dealerProducts);
    }

    public function getDealerProduct (string $id) {
        $dealerProduct = ProductService::getProductById($id);

        if ( $dealerProduct == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        return ResponseService::singleItemsResponse($dealerProduct);
    }

    public function saveDealerProduct(StoreProductRequest $request) {
        $dealerProduct = ProductService::storeProduct($request);

        $validator = null;

        if ( $request->product_type != null ) {

            if ( $request->product_type == "purchased_product" ) 
            {
                $validator = ProductService::validatePurchasedProduct($request);

                if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

                $dealerProduct->save();

                $purchasedProduct = ProductService::storePurchasedProduct($request, $dealerProduct);

                ManagementUserProduct::create([
                    'user_id' => $request->user()->user_id,
                    'product_id' => $dealerProduct->product_id,
                ]);

                // Save the product images
                if ( !empty($request->gallery) ) {
                    foreach ( $request->gallery as $key => $tempImageId ) {
                        $tempImage = TempImage::find($tempImageId);

                        // Large Thumbnail
                        $extArray = explode('.', $tempImage->name);
                        $ext = end($extArray);
                        $rand = rand(1000,10000);

                        $imageName = $dealerProduct->id.'-'.$rand.time().'.'.$ext; // 2-123456789.jpg

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
                        $productImage->product_id = $dealerProduct->id;
                        $productImage->save();

                        if ( $key == 0 ) {
                            $dealerProduct->image = $imageName;
                            $dealerProduct->save();
                        }
                    }
                }

                return ProductService::successStoreProductResponse($dealerProduct, $purchasedProduct, $this->purchasedProductType);
            } 
        }

    }

    public function updateDealerProduct(UpdateProductRequest $request, string $id) {
        $dealerProduct = Product::find($id);

        if ( $dealerProduct == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);
        
        $request->validated();

        $validator = null;

        if ( $request->product_type ) 
        {
            if ( $request->product_type == "purchased_product" ) {

                $validator = ProductService::validatePurchasedProduct($request);

                if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

                $validator = ProductService::validatePurchasedProduct($request);

                if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

                $dealerProduct = ProductService::updateProductById($request, $id);

                $dealerProduct->save();

                $purchasedProduct = ProductService::updatePurchasedProductById($request, $id);

                return ProductService::successUpdateProductResponse($id, $dealerProduct, $purchasedProduct, $this->purchasedProductType);
            } 
        }
    }

    public function deleteDealerProduct(string $id) {
        $product = ProductService::deleteProductById($id);

        if ( $product == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        return ResponseService::successDeleteItemResponse($this->itemName, $id);
    }
}
