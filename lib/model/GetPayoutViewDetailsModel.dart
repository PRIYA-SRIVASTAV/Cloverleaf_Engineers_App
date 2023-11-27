// To parse this JSON data, do
//
//     final getPayoutViewDetailsModel = getPayoutViewDetailsModelFromJson(jsonString);

import 'dart:convert';

GetPayoutViewDetailsModel getPayoutViewDetailsModelFromJson(String str) => GetPayoutViewDetailsModel.fromJson(json.decode(str));

String getPayoutViewDetailsModelToJson(GetPayoutViewDetailsModel data) => json.encode(data.toJson());

class GetPayoutViewDetailsModel {
  bool? status;
  Data? data;
  String? message;

  GetPayoutViewDetailsModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetPayoutViewDetailsModel.fromJson(Map<String, dynamic> json) => GetPayoutViewDetailsModel(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  List<PaymentList>? paymentList;
  bool? isPromised;

  Data({
    this.paymentList,
    this.isPromised,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    paymentList: json["paymentList"] == null ? [] : List<PaymentList>.from(json["paymentList"]!.map((x) => PaymentList.fromJson(x))),
    isPromised: json["is_promised"],
  );

  Map<String, dynamic> toJson() => {
    "paymentList": paymentList == null ? [] : List<dynamic>.from(paymentList!.map((x) => x.toJson())),
    "is_promised": isPromised,
  };
}

class PaymentList {
  int? id;
  int? workId;
  int? isPromised;
  String? totalAmountToPay;
  String? totalPaid;
  String? pending;
  String? updatedAt;
  String? latestTransactionDate;

  PaymentList({
    this.id,
    this.workId,
    this.isPromised,
    this.totalAmountToPay,
    this.totalPaid,
    this.pending,
    this.updatedAt,
    this.latestTransactionDate,
  });

  factory PaymentList.fromJson(Map<String, dynamic> json) => PaymentList(
    id: json["id"],
    workId: json["work_id"],
    isPromised: json["is_promised"],
    totalAmountToPay: json["total_amount_to_pay"],
    totalPaid: json["total_paid"],
    pending: json["pending"],
    updatedAt: json["updated_at"],
    latestTransactionDate: json["latest_transaction_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "work_id": workId,
    "is_promised": isPromised,
    "total_amount_to_pay": totalAmountToPay,
    "total_paid": totalPaid,
    "pending": pending,
    "updated_at": updatedAt,
    "latest_transaction_date": latestTransactionDate,
  };
}
