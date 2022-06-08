import 'package:dio/dio.dart';
import 'package:minhtu/helper/api_base.dart';
import 'package:minhtu/models/batch_detail/batch_detail_model.dart';
import 'package:minhtu/utils/urls.dart';

class BatchRepository {
  Future<BatchDetailModel?> getBatchDetail({required cultivation}) async {
    Response? result = await ApiBaseHelper().getData(
      url: UrlUtils.API_GET_BATCH_DETAIL,
      params: {
        "cultivation": cultivation,
      },
    );
    if (result != null && result.statusCode == 200) {
      BatchDetailModel batchDetailModel = BatchDetailModel.fromJson(
        result.data["message"],
      );
      return batchDetailModel;
    } else {
      return null;
    }
  }

  Future<BatchDetailModel?> createTransaction(
      {required cultivation,
      required String transType,
      required String transDate,
      required double transQuantity,
      required String transUom,
      required String transDes}) async {
    Map<String, dynamic> body = {
      "trans_cultivation": cultivation,
      "trans_type": transType,
      "trans_date": transDate,
      "trans_quantity": transQuantity,
      "trans_uom": transUom,
      "trans_description": transDes,
    };
    Response? result = await ApiBaseHelper().postData(
      url: UrlUtils.API_POST_TRANS,
      body: body,
    );
    if (result != null && result.statusCode == 200) {
      BatchDetailModel batchDetailModel = BatchDetailModel.fromJson(
        result.data["message"],
      );
      return batchDetailModel;
    } else {
      return null;
    }
  }
}
