import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:minhtu/controller/batch_detail/batch_detail_controller.dart';
import 'package:minhtu/routes/routes.dart';
import 'package:minhtu/widgets/app_bar_widget.dart';

class BatchDetailPage extends GetWidget<BatchDetailController> {
  const BatchDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        builder: (BatchDetailController controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarWidget("Lô sản phẩm"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 28, right: 28, top: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    detailView(),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Hành trình sản phẩm",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Giao dịch"),
                        buttonAdd(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (context, index) => transactionItem(
                          name: "Giao dịch ${index + 1}",
                          des: controller.batchDetailModel
                              ?.culTransaction![index].transDescription,
                          time: controller.batchDetailModel
                              ?.culTransaction![index].transDate,
                          typeTrans: controller.batchDetailModel
                              ?.culTransaction![index].transType,
                          weight:
                              "${controller.batchDetailModel?.culTransaction![index].transQuantity?.toString()} ${controller.batchDetailModel?.culTransaction![index].transUom?.toString()}",
                        ),
                        itemCount: controller
                                .batchDetailModel?.culTransaction?.length ??
                            0,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  buttonAdd() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.ADD_TRANSACTION_PAGE);
      },
      child: Container(
        width: Get.width * 0.29,
        height: 26,
        padding: const EdgeInsets.symmetric(horizontal: 9),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xffFFB62C), Color(0xffFF872C)],
              stops: [0.1, 1],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                border: Border.all(
                  color: Colors.white,
                  style: BorderStyle.solid,
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 12,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "Thêm giao dịch",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  rowTitle(
    String title, {
    String? valueOne,
    String? valueTwo,
    bool arrowOneDropDown = false,
    bool arrowTwoDropDown = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff3D3D3D),
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
              flex: 6,
              child: Row(
                children: [
                  valueOne != null
                      ? Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                                bottom: 4, top: 4, left: 12, right: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: arrowOneDropDown
                                    ? const Color(0xffC5DDFF)
                                    : const Color(0xffDBDBDB),
                                style: BorderStyle.solid,
                                width: arrowOneDropDown ? 1 : 0.5,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    valueOne,
                                    style: const TextStyle(
                                      color: Color(0xff3D3D3D),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                if (arrowOneDropDown)
                                  SizedBox(
                                    width: 11,
                                    height: 6,
                                    child: SvgPicture.asset(
                                      "assets/svg/arrow_down.svg",
                                      color: const Color(0xff979797),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  SizedBox(
                    width: valueTwo != null ? 7 : 0,
                  ),
                  valueTwo != null
                      ? Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                                bottom: 4, top: 4, left: 12, right: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: arrowTwoDropDown
                                    ? const Color(0xffC5DDFF)
                                    : const Color(0xffDBDBDB),
                                style: BorderStyle.solid,
                                width: arrowTwoDropDown ? 1 : 0.5,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    valueTwo,
                                    style: const TextStyle(
                                      color: Color(0xff3D3D3D),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                if (arrowTwoDropDown)
                                  SizedBox(
                                    width: 11,
                                    height: 6,
                                    child: SvgPicture.asset(
                                      "assets/svg/arrow_down.svg",
                                      color: const Color(0xff979797),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ))
        ],
      ),
    );
  }

  Widget detailView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            controller.batchDetailModel?.culItem ?? "",
            style: const TextStyle(
              color: Color(0xff3D3D3D),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 17,
        ),
        rowTitle("Lô sản phẩm", valueOne: controller.batchDetailModel?.culFarm),
        rowTitle("Loại giống", valueOne: controller.batchDetailModel?.culSeed),
        rowTitle("Địa điểm sản xuất",
            valueOne: controller.batchDetailModel?.culSubfarm),
        rowTitle(
          "Tiêu chuẩn",
          valueOne: controller.batchDetailModel?.culCert,
          arrowOneDropDown: true,
        ),
        rowTitle(
          "Khối lượng",
          valueOne:
              controller.batchDetailModel?.culHarvestSize?.toString() ?? "",
          valueTwo: controller.batchDetailModel?.culHarvestUom ?? "",
          arrowTwoDropDown: true,
        ),
        rowTitle("NSX - HSD",
            valueOne:
                "${controller.batchDetailModel?.culHarvestStartDate} - ${controller.batchDetailModel?.culHarvestEndDate}"),
      ],
    );
  }

  transactionItem(
      {String? name,
      String? typeTrans,
      String? time,
      String? weight,
      String? des}) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 24, bottom: 22),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffE0E0E0),
          style: BorderStyle.solid,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name ?? "",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          const Divider(
            color: Color(0xffE0E0E0),
            height: 1,
            thickness: 1,
          ),
          const SizedBox(
            height: 19,
          ),
          rowTrans("Loại giao dịch", typeTrans),
          const SizedBox(
            height: 15,
          ),
          rowTrans("Thời gian", time),
          const SizedBox(
            height: 15,
          ),
          rowTrans("Khối lượng", weight),
          const SizedBox(
            height: 15,
          ),
          rowTrans("Mô tả", des),
        ],
      ),
    );
  }

  rowTrans(title, value) {
    return Row(
      children: [
        Expanded(
          flex: 45,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xff828282),
            ),
          ),
        ),
        Expanded(
          flex: 55,
          child: Text(
            value ?? "",
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xff333333),
            ),
          ),
        ),
      ],
    );
  }
}
