import 'package:get/get.dart';
import 'package:minhtu/controller/batch_detail/add_transaction_controller.dart';

class AddTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AddTransactionController>(AddTransactionController());
  }
}
