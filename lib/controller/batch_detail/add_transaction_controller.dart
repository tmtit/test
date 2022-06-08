import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:minhtu/controller/batch_detail/batch_detail_controller.dart';
import 'package:minhtu/models/batch_detail/batch_detail_model.dart';
import 'package:minhtu/repositories/batch_repository.dart';

class AddTransactionController extends GetxController {
  BatchRepository repository = BatchRepository();
  TextEditingController weightController = TextEditingController();
  FocusNode focusNodeWeight = FocusNode();
  String warningWeight = "";
  TextEditingController desController = TextEditingController();
  String? selectedType = "Mua";
  DateTime? selectedDate = DateTime.now();
  BatchDetailController batchDetailController = Get.find();

  @override
  void onInit() {
    super.onInit();
    // focusNodeWeight.addListener(() {
    //   if (!focusNodeWeight.hasFocus) {
    //
    //     update();
    //   }
    // });
  }

  chooseDate() async {
    selectedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate!,
        firstDate: DateTime(1900, 1, 1),
        lastDate: DateTime(2100, 1, 1));

    update();
  }

  onChangeType(String? newValue) {
    selectedType = newValue;
    update();
  }

  onCreate() async {
    if (weightController.text.trim().isEmpty) {
      warningWeight = "Không được để trống!";
    } else if (double.tryParse(weightController.text.trim()) == null) {
      warningWeight = "Vui lòng nhập đúng định dạng!";
    } else {
      warningWeight = "";
    }
    update();
    if (warningWeight.isEmpty) {
      BatchDetailModel? batchDetailModel = await repository.createTransaction(
        cultivation: "FTQWW001079733XJ",
        transDate: DateFormat("yyyy-MM-dd").format(selectedDate!),
        transDes: desController.text,
        transQuantity: double.tryParse(weightController.text)!,
        transType: selectedType!,
        transUom: batchDetailController.batchDetailModel!.culHarvestUom!.trim(),
      );
      batchDetailController.batchDetailModel = batchDetailModel;
      batchDetailController.update();
      Get.back();
    }
  }
}
