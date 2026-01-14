class EndPoint {
  static String baseUrl = "https://40ff7c979111.ngrok-free.app/";

  // static String baseUrl = "http://127.0.0.1:8000/";

  // Farmer endPoint
  static String api = "api/";
  static String register = "${api}register";
  static String login = "${api}login";
  static String getCategories = "${api}get-categories";
  static String getBrands = "${api}get-brands";
  static String getPurhcasedProducts = "${api}get-purhcased-products";
  static String getRentalProducts = "${api}get-rental-products";
  static String getProfileDetails = "${api}get-profile-details";
  static String savePurchasedOrder = "${api}save-purchased-order";
  static String saveRentalOrder = "${api}save-rental-order";
  static String getOrders = "${api}get-orders";
  static String getLatestEquipmentProducts =
      "${api}get-latest-equipment-products";
  static String getLatestMedicineProducts =
      "${api}get-latest-medicine-products";
  static String getLatestInsecticideProducts =
      "${api}get-latest-insecticide-products";
  static String getLatestSeederProducts = "${api}get-latest-seeder-products";
  static String getLatestPurchasedProducts =
      "${api}get-latest-purchased-products";
  static String getLatestRentalProducts = "${api}get-latest-rental-products";
  static String getproduct(int id) => "${api}get-product/$id";
  static String getOrderDetails(int id) => "${api}get-order-details/$id";
}

class ApiKey {
  static String authorization = "Authorization";
  static String user = "user";
  static String status = "status";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String nonFieldErrors = "non_field_errors";
  static String message = "message";
  static String id = "id";
  static String userID = "user_id";
  static String username = "username";
  static String confirmPassword = "confirmPassword";
  static String image = "image";
  static String title = "title";
  static String timeMinutes = "time_minutes";
  static String price = "price";
  static String link = "link";
  static String description = "description";
  static String detail = "detail";
}
            // "user_id": 3,
            // "username": "Farmer",
            // "email": "farmer@example.com",
            // "email_verified_at": null,
            // "first_name": null,
            // "last_name": null,
            // "phone_number": null,
            // "created_at": "2026-01-14T18:09:20.000000Z",
            // "updated_at": "2026-01-14T18:09:20.000000Z",
            // "addresses": []