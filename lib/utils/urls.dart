// ignore_for_file: non_constant_identifier_names

class UrlUtils {
  static String PROTOCOL = "https://";
  static String DOMAIN = "test.tagon.ai";
  static String API_LOGIN = "/api/authenticate";
  static String API_REGISTER = "/api/register";
  static String API_GET_USER= "/api/users/get-user-profile";
  static String Api_Get_Project ="/api/projects/current-user-projects";

  static String urlConnect(String pathUrl) {
    return "$PROTOCOL$DOMAIN$pathUrl";
  }
}
