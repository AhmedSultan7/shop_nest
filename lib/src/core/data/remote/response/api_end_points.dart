class ApiEndPoints {
  //? Headers
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static const String baseUrl =
      "https://strapi-production-5c35.up.railway.app/api";
  static const String populate = "?populate=*";
  static const String products = "/products$populate";
  static const String sliders = "/sliders$populate";
  static const String setting = "/setting$populate";
}
