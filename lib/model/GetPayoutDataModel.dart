// To parse this JSON data, do
//
//     final getPayoutDataModel = getPayoutDataModelFromJson(jsonString);

import 'dart:convert';

GetPayoutDataModel getPayoutDataModelFromJson(String str) => GetPayoutDataModel.fromJson(json.decode(str));

String getPayoutDataModelToJson(GetPayoutDataModel data) => json.encode(data.toJson());

class GetPayoutDataModel {
  bool status;
  Data data;
  String message;

  GetPayoutDataModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GetPayoutDataModel.fromJson(Map<String, dynamic> json) => GetPayoutDataModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  List<PaymentList> paymentList;
  double totalPaymentReceived;

  Data({
    required this.paymentList,
    required this.totalPaymentReceived,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    paymentList: List<PaymentList>.from(json["paymentList"].map((x) => PaymentList.fromJson(x))),
    totalPaymentReceived: json["totalPaymentReceived"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "paymentList": List<dynamic>.from(paymentList.map((x) => x.toJson())),
    "totalPaymentReceived": totalPaymentReceived,
  };
}

class PaymentList {
  int id;
  int workId;
  String totalAmountToPay;
  String totalPaid;
  String pending;
  DateTime updatedAt;

  PaymentList({
    required this.id,
    required this.workId,
    required this.totalAmountToPay,
    required this.totalPaid,
    required this.pending,
    required this.updatedAt,
  });

  factory PaymentList.fromJson(Map<String, dynamic> json) => PaymentList(
    id: json["id"],
    workId: json["work_id"],
    totalAmountToPay: json["total_amount_to_pay"],
    totalPaid: json["total_paid"],
    pending: json["pending"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "work_id": workId,
    "total_amount_to_pay": totalAmountToPay,
    "total_paid": totalPaid,
    "pending": pending,
    "updated_at": updatedAt.toIso8601String(),
  };
}
