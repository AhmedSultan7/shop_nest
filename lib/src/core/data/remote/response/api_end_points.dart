class ApiEndPoints {
  //? Headers
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static const String baseUrl = "https://old-strapi-backend.onrender.com";
  // static const String baseUrl = "https://strapi.inspireui.com";

  static const String productsCategory = "/product-categories";
  static const String products = "/products";
  static const String orders = "/orders";
}
