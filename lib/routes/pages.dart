import 'package:get/get.dart';
import 'package:minhtu/bindings/auth/login_binding.dart';
import 'package:minhtu/pages/auth/login_page.dart';
import 'package:minhtu/routes/routes.dart';


class Pages {
  static final pages = [

    GetPage(
      name: Routes.INITIAL,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.LOGIN_PAGE,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
