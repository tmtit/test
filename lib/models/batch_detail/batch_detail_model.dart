// ignore_for_file: unnecessary_getters_setters

import 'package:intl/intl.dart';

class BatchDetailModel {
  String? _culItem;
  String? _culFarm;
  String? _culBatchNo;
  String? _culBatchNoCode;
  String? _culSubfarm;
  String? _culCert;
  String? _culSeed;
  double? _culHarvestSize;
  String? _culHarvestUom;
  String? _culHarvestStartDate;
  String? _culHarvestEndDate;
  List<CulTransaction>? _culTransaction;

  BatchDetailModel(
      {String? culItem,
      String? culFarm,
      String? culBatchNo,
      String? culBatchNoCode,
      String? culSubfarm,
      String? culCert,
      String? culSeed,
      double? culHarvestSize,
      String? culHarvestUom,
      String? culHarvestStartDate,
      String? culHarvestEndDate,
      List<CulTransaction>? culTransaction}) {
    if (culItem != null) {
      _culItem = culItem;
    }
    if (culFarm != null) {
      _culFarm = culFarm;
    }
    if (culBatchNo != null) {
      _culBatchNo = culBatchNo;
    }
    if (culBatchNoCode != null) {
      _culBatchNoCode = culBatchNoCode;
    }
    if (culSubfarm != null) {
      _culSubfarm = culSubfarm;
    }
    if (culCert != null) {
      _culCert = culCert;
    }
    if (culSeed != null) {
      _culSeed = culSeed;
    }
    if (culHarvestSize != null) {
      _culHarvestSize = culHarvestSize;
    }
    if (culHarvestUom != null) {
      _culHarvestUom = culHarvestUom;
    }
    if (culHarvestStartDate != null) {
      _culHarvestStartDate = culHarvestStartDate;
    }
    if (culHarvestEndDate != null) {
      _culHarvestEndDate = culHarvestEndDate;
    }
    if (culTransaction != null) {
      _culTransaction = culTransaction;
    }
  }

  String? get culItem => _culItem;

  set culItem(String? culItem) => _culItem = culItem;

  String? get culFarm => _culFarm;

  set culFarm(String? culFarm) => _culFarm = culFarm;

  String? get culBatchNo => _culBatchNo;

  set culBatchNo(String? culBatchNo) => _culBatchNo = culBatchNo;

  String? get culBatchNoCode => _culBatchNoCode;

  set culBatchNoCode(String? culBatchNoCode) =>
      _culBatchNoCode = culBatchNoCode;

  String? get culSubfarm => _culSubfarm;

  set culSubfarm(String? culSubfarm) => _culSubfarm = culSubfarm;

  String? get culCert => _culCert;

  set culCert(String? culCert) => _culCert = culCert;

  String? get culSeed => _culSeed;

  set culSeed(String? culSeed) => _culSeed = culSeed;

  double? get culHarvestSize => _culHarvestSize;

  set culHarvestSize(double? culHarvestSize) =>
      _culHarvestSize = culHarvestSize;

  String? get culHarvestUom => _culHarvestUom;

  set culHarvestUom(String? culHarvestUom) => _culHarvestUom = culHarvestUom;

  String? get culHarvestStartDate {
    if (_culHarvestStartDate != null) {
      DateTime parseDate =
          DateFormat("yyyy-MM-dd").parse(_culHarvestStartDate!);
      return DateFormat("dd/MM/yyyy").format(parseDate);
    }
    return "";
  }

  set culHarvestStartDate(String? culHarvestStartDate) =>
      _culHarvestStartDate = culHarvestStartDate;

  String? get culHarvestEndDate {
    if (_culHarvestEndDate != null) {
      DateTime parseDate = DateFormat("yyyy-MM-dd").parse(_culHarvestEndDate!);
      // var inputDate = DateTime.parse(parseDate.toString());
      return DateFormat("dd/MM/yyyy").format(parseDate);
    }
    return "";
  }

  set culHarvestEndDate(String? culHarvestEndDate) =>
      _culHarvestEndDate = culHarvestEndDate;

  List<CulTransaction>? get culTransaction => _culTransaction;

  set culTransaction(List<CulTransaction>? culTransaction) =>
      _culTransaction = culTransaction;

  BatchDetailModel.fromJson(Map<String, dynamic> json) {
    _culItem = json['cul_item'];
    _culFarm = json['cul_farm'];
    _culBatchNo = json['cul_batch_no'];
    _culBatchNoCode = json['cul_batch_no_code'];
    _culSubfarm = json['cul_subfarm'];
    _culCert = json['cul_cert'];
    _culSeed = json['cul_seed'];
    _culHarvestSize = json['cul_harvest_size'];
    _culHarvestUom = json['cul_harvest_uom'];
    _culHarvestStartDate = json['cul_harvest_start_date'];
    _culHarvestEndDate = json['cul_harvest_end_date'];
    if (json['cul_transaction'] != null) {
      _culTransaction = <CulTransaction>[];
      json['cul_transaction'].forEach((v) {
        _culTransaction!.add(CulTransaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cul_item'] = _culItem;
    data['cul_farm'] = _culFarm;
    data['cul_batch_no'] = _culBatchNo;
    data['cul_batch_no_code'] = _culBatchNoCode;
    data['cul_subfarm'] = _culSubfarm;
    data['cul_cert'] = _culCert;
    data['cul_seed'] = _culSeed;
    data['cul_harvest_size'] = _culHarvestSize;
    data['cul_harvest_uom'] = _culHarvestUom;
    data['cul_harvest_start_date'] = _culHarvestStartDate;
    data['cul_harvest_end_date'] = _culHarvestEndDate;
    if (_culTransaction != null) {
      data['cul_transaction'] =
          _culTransaction!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CulTransaction {
  String? _transType;
  String? _transDate;
  double? _transQuantity;
  String? _transUom;
  String? _transDescription;

  CulTransaction(
      {String? transType,
      String? transDate,
      double? transQuantity,
      String? transUom,
      String? transDescription}) {
    if (transType != null) {
      _transType = transType;
    }
    if (transDate != null) {
      _transDate = transDate;
    }
    if (transQuantity != null) {
      _transQuantity = transQuantity;
    }
    if (transUom != null) {
      _transUom = transUom;
    }
    if (transDescription != null) {
      _transDescription = transDescription;
    }
  }

  String? get transType => _transType;

  set transType(String? transType) => _transType = transType;

  String? get transDate {
    if (_transDate != null) {
      DateTime parseDate = DateFormat("yyyy-MM-dd").parse(_transDate!);
      return DateFormat("dd/MM/yyyy").format(parseDate);
    }
    return "";
  }

  set transDate(String? transDate) => _transDate = transDate;

  double? get transQuantity => _transQuantity;

  set transQuantity(double? transQuantity) => _transQuantity = transQuantity;

  String? get transUom => _transUom;

  set transUom(String? transUom) => _transUom = transUom;

  String? get transDescription => _transDescription;

  set transDescription(String? transDescription) =>
      _transDescription = transDescription;

  CulTransaction.fromJson(Map<String, dynamic> json) {
    _transType = json['trans_type'];
    _transDate = json['trans_date'];
    _transQuantity = json['trans_quantity'];
    _transUom = json['trans_uom'];
    _transDescription = json['trans_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['trans_type'] = _transType;
    data['trans_date'] = _transDate;
    data['trans_quantity'] = _transQuantity;
    data['trans_uom'] = _transUom;
    data['trans_description'] = _transDescription;
    return data;
  }
}
