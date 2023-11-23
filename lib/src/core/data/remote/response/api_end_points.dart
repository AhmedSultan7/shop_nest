class ApiEndPoints {
  //? Headers
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static const String baseUrl = "https://sim-app.up.railway.app/api";
  static const String populate = "populate=*";
  static const String register = "/auth/local/register";
  static const String login = "/auth/local";
  static const String products = "/products";
  static const String sliders = "/sliders";
  static const String setting = "/setting";
  static const String user = "/users";
  static const String orders = "/orders";
}
