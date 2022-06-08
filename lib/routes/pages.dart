import 'package:get/get.dart';
import 'package:minhtu/bindings/auth/login_binding.dart';
import 'package:minhtu/bindings/batch_detail/add_transaction_binding.dart';
import 'package:minhtu/bindings/batch_detail/batch_detail_binding.dart';
import 'package:minhtu/pages/auth/login_page.dart';
import 'package:minhtu/pages/batch_detail/add_transaction_page.dart';
import 'package:minhtu/pages/batch_detail/batch_detail_page.dart';
import 'package:minhtu/routes/routes.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const BatchDetailPage(),
      binding: BatchDetailBinding(),
    ),
    GetPage(
      name: Routes.LOGIN_PAGE,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.ADD_TRANSACTION_PAGE,
      page: () => const AddTransactionPage(),
      binding: AddTransactionBinding(),
    ),
  ];
}
