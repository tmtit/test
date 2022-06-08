// ignore_for_file: non_constant_identifier_names

class UrlUtils {
  static String PROTOCOL = "https://";
  static String DOMAIN = "rpc.freshdi.com";
  static String API_LOGIN = "/api/method/freshdi.data.farm_company.login";
  static String API_GET_BATCH_DETAIL =
      "/api/method/freshdi.data.test.batch.get_batch_detail";
  static String API_POST_TRANS =
      "/api/method/freshdi.data.test.batch_trans.post_batch_trans";

  static String urlConnect(String pathUrl) {
    return "$PROTOCOL$DOMAIN$pathUrl";
  }
}
