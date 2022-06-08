import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:minhtu/controller/batch_detail/add_transaction_controller.dart';
import 'package:minhtu/controller/batch_detail/batch_detail_controller.dart';
import 'package:minhtu/utils/colors.dart';
import 'package:minhtu/widgets/app_bar_widget.dart';

class AddTransactionPage extends GetWidget<AddTransactionController> {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: GetBuilder(
          builder: (BatchDetailController controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarWidget(
                "Thêm giao dịch",
                enableBack: true,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    detailView(),
                    buttonView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  typeTransView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          const Expanded(
            flex: 4,
            child: Text(
              "Loại giao dịch",
              style: TextStyle(
                color: Color(0xff3D3D3D),
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
              flex: 6,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                height: 25,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffDBDBDB),
                    style: BorderStyle.solid,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: GetBuilder(
                  builder: (AddTransactionController controller) =>
                      DropdownButton<String>(
                    value: controller.selectedType,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 18,
                    ),
                    elevation: 10,
                    isExpanded: true,
                    style: const TextStyle(color: Color(0xff263238)),
                    underline: Container(
                      height: 0,
                      color: Colors.transparent,
                    ),
                    isDense: true,
                    dropdownColor: const Color(0xffDBDBDB),
                    onChanged: controller.onChangeType,
                    items: <String>['Mua', 'Bán']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  timeView() {
    return GestureDetector(
      onTap: controller.chooseDate,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            const Expanded(
              flex: 4,
              child: Text(
                "Thời gian",
                style: TextStyle(
                  color: Color(0xff3D3D3D),
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                height: 25,
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffDBDBDB),
                    style: BorderStyle.solid,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GetBuilder(
                    builder: (AddTransactionController controller) => Text(
                      DateFormat("dd/MM/yyyy").format(controller.selectedDate!),
                      style: const TextStyle(
                        color: Color(0xff3D3D3D),
                        fontSize: 11,
                        height: 1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  weightView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              const Expanded(
                flex: 4,
                child: Text(
                  "Khối lượng",
                  style: TextStyle(
                    color: Color(0xff3D3D3D),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  height: 25,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffDBDBDB),
                      style: BorderStyle.solid,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    focusNode: controller.focusNodeWeight,
                    controller: controller.weightController,
                    maxLines: 1,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      suffixText: Get.find<BatchDetailController>()
                          .batchDetailModel!
                          .culHarvestUom,
                      suffixStyle: const TextStyle(
                        color: Color(0xff3D3D3D),
                        fontSize: 11,
                        height: 1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Color(0xff3D3D3D),
                      fontSize: 11,
                      height: 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            const Spacer(
              flex: 4,
            ),
            Expanded(
              flex: 6,
              child: GetBuilder(
                builder: (AddTransactionController controller) =>
                    controller.warningWeight.isNotEmpty
                        ? Text(
                            controller.warningWeight,
                            style: const TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                                color: ColorUtils.errorColor),
                          )
                        : const SizedBox(),
              ),
            ),
          ],
        )
      ],
    );
  }

  descriptionView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: const Text(
              "Mô tả",
              style: TextStyle(
                color: Color(0xff3D3D3D),
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffDBDBDB),
                style: BorderStyle.solid,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: controller.desController,
              maxLines: 4,
              onChanged: (value) {},
              decoration: const InputDecoration(
                hintText: "Thêm mô tả chi tiết (nếu có) cho giao dịch của bạn ",
                hintStyle: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    color: Color(0xffC4C4C4)),
                isDense: false,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                border: InputBorder.none,
                suffixStyle: TextStyle(
                  color: Color(0xff3D3D3D),
                  fontSize: 11,
                  height: 1,
                  fontWeight: FontWeight.w400,
                ),
              ),
              textInputAction: TextInputAction.newline,
              style: const TextStyle(
                color: Color(0xff3D3D3D),
                fontSize: 11,
                height: 1,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buttonView() {
    return GestureDetector(
      onTap: controller.onCreate,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xffFFB62C), Color(0xffFF872C)],
              stops: [0.0014, 0.94],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight),
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Center(
          child: Text(
            "Lưu",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget detailView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        typeTransView(),
        timeView(),
        weightView(),
        descriptionView(),
        const SizedBox(
          height: 28,
        ),
      ],
    );
  }
}
