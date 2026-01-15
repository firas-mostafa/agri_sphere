class EndPoint {
  static String baseUrl = "https://41b4563b5d57.ngrok-free.app";

  // static String baseUrl = "http://127.0.0.1:8000/";

  // Farmer endPoint
  static String api = "/api/";
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
  static String categoryId = "category_id";
  static String brandId = "brand_id";

  static String status = "status";

  static String email = "email";
  static String name = "name";
  static String password = "password";
  static String token = "token";
  static String nonFieldErrors = "non_field_errors";
  static String message = "message";
  static String id = "id";
  static String userID = "user_id";
  static String username = "username";
  static String firstName = "first_name";
  static String lastName = "last_name";
  static String phoneNumber = "phone_number";
  static String createdAt = "created_at";
  static String confirmPassword = "confirmPassword";
  static String addresses = "addresses";
  static String image = "image_url";
}
