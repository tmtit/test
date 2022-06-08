import 'package:get/get.dart';
import 'package:minhtu/models/batch_detail/batch_detail_model.dart';
import 'package:minhtu/repositories/batch_repository.dart';

class BatchDetailController extends GetxController {
  BatchDetailModel? batchDetailModel;
  BatchRepository repository = BatchRepository();
  bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
    initData();
  }

  initData() async {
    isLoading = true;
    update();
    batchDetailModel =
        await repository.getBatchDetail(cultivation: "FTQWW001079733XJ");
    isLoading = false;
    update();
  }
}
