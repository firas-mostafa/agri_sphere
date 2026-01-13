<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\order\StoreOrderRequest;
use App\Models\Order;
use App\Services\OrderService;
use App\Services\ResponseService;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    private $itemName = "Order";

    // This method will return all orders
    public function index() {
        $orders = OrderService::showAllOrders();

        return ResponseService::allItemsResponse($orders);
    }

    // This method will return a single order with specific ID
    public function detail(string $id) {
        $order = Order::find($id);

        if ( $order == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        $order = OrderService::getOrderById($id);

        return ResponseService::singleItemsResponse($order);
    }

    // This method will update a single order with specific ID
    public function update(Request $request, string $id) {
        $order = Order::find($id);

        if ( $order == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        if ( $order->order_type ) {
            if( $order->order_type == "purchased_order" ) $validator = OrderService::validateUpdatePurchasedOrder($request);

            else if ( $order->order_type == "rental_order" ) $validator = OrderService::validateUpdateRentalOrder($request);

            if ( $validator->fails() ) return ResponseService::faliedValidationResponse($validator);

            $order = OrderService::updateOrder($request, $order);

            return ResponseService::successUpdateItemResponse($this->itemName, $id, $order);
        }
    }

    // This method will delete a single order with specific ID
    public function destroy(string $id) {
        $order = OrderService::deleteOrderById($id);

        if ( $order == null ) return ResponseService::itemNotFoundResponse($this->itemName, $id);

        return ResponseService::successDeleteItemResponse($this->itemName, $id);
    }
}
