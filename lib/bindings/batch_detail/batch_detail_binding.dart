import 'package:get/get.dart';
import 'package:minhtu/controller/batch_detail/batch_detail_controller.dart';

class BatchDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BatchDetailController>(BatchDetailController());
  }
}
