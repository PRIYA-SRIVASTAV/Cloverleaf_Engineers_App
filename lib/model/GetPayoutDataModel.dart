// To parse this JSON data, do
//
//     final getPayoutDataModel = getPayoutDataModelFromJson(jsonString);

import 'dart:convert';

GetPayoutDataModel getPayoutDataModelFromJson(String str) => GetPayoutDataModel.fromJson(json.decode(str));

String getPayoutDataModelToJson(GetPayoutDataModel data) => json.encode(data.toJson());

class GetPayoutDataModel {
  bool? status;
  List<Datum>? data;
  String? message;

  GetPayoutDataModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetPayoutDataModel.fromJson(Map<String, dynamic> json) => GetPayoutDataModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  String? year;
  int? totalPaid;
  int? pending;
  int? month;
  String? monthName;
  int? totalAmountToPay;

  Datum({
    this.year,
    this.totalPaid,
    this.pending,
    this.month,
    this.monthName,
    this.totalAmountToPay,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    year: json["year"],
    totalPaid: json["total_paid"],
    pending: json["pending"],
    month: json["month"],
    monthName: json["month_name"],
    totalAmountToPay: json["total_amount_to_pay"],
  );

  Map<String, dynamic> toJson() => {
    "year": year,
    "total_paid": totalPaid,
    "pending": pending,
    "month": month,
    "month_name": monthName,
    "total_amount_to_pay": totalAmountToPay,
  };
}
