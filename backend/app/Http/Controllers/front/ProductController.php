<?php

namespace App\Http\Controllers\front;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Services\BrandService;
use App\Services\CategoryService;
use App\Services\ProductService;
use App\Services\ResponseService;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function getPurchasedProducts() {
        $purchasedProducts = ProductService::getAllPurchasedProducts();

        return ResponseService::allItemsResponse($purchasedProducts);
    }

    public function getLatestPurchasedProducts() {
        $purchasedProducts = ProductService::getLatestPurchasedProducts();

        return ResponseService::allItemsResponse($purchasedProducts);
    }

    public function getRentalProducts() {
        $rentalProducts = ProductService::getAllRentalProducts();

        return ResponseService::allItemsResponse($rentalProducts);
    }

    public function getLatestRentalProducts() {
        $rentalProducts = ProductService::getLatestRentalProducts();

        return ResponseService::allItemsResponse($rentalProducts);
    }
    
    public function getLatestEquipmentProducts() {
        $categoryId = Category::where('name', 'Equipment')->first()->category_id;
        $purchasedProducts = ProductService::getLatestPurchasedProductsByCategory($categoryId);
        
        return ResponseService::allItemsResponse($purchasedProducts);
    }
    
    public function getLatestMedicineProducts() {
        $categoryId = Category::where('name', 'Medicine')->first()->category_id;
        $purchasedProducts = ProductService::getLatestPurchasedProductsByCategory($categoryId);
        
        return ResponseService::allItemsResponse($purchasedProducts);
    }
    
    public function getLatestInsecticideProducts() {
        $categoryId = Category::where('name', 'Insecticide')->first()->category_id;
        $purchasedProducts = ProductService::getLatestPurchasedProductsByCategory($categoryId);
        
        return ResponseService::allItemsResponse($purchasedProducts);
    }
    
    public function getLatestSeedProducts() {
        $categoryId = Category::where('name', 'seeder')->first()->category_id;
        $purchasedProducts = ProductService::getLatestPurchasedProductsByCategory($categoryId);
        
        return ResponseService::allItemsResponse($purchasedProducts);
    }
    
    public function getProduct(string $id) {
        $product = ProductService::getProductById($id);

        return ResponseService::singleItemsResponse($product);
    }
    
    public function getCategories() {
        $categories = CategoryService::showAllCategoies();

        return ResponseService::allItemsResponse($categories);
    }
    
    public function getBrands() {
        $brands = BrandService::showAllBrands();

        return ResponseService::allItemsResponse($brands);
    }
}
