// To parse this JSON data, do
//
//     final getPayoutDataModel = getPayoutDataModelFromJson(jsonString);

import 'dart:convert';

GetPayoutDataModel getPayoutDataModelFromJson(String str) => GetPayoutDataModel.fromJson(json.decode(str));

String getPayoutDataModelToJson(GetPayoutDataModel data) => json.encode(data.toJson());

class GetPayoutDataModel {
  bool? status;
  Map<String, List<Datum>>? data;
  String? message;

  GetPayoutDataModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetPayoutDataModel.fromJson(Map<String, dynamic> json) => GetPayoutDataModel(
    status: json["status"],
    data: Map.from(json["data"]).map((k, v) => MapEntry<String, List<Datum>>(k, List<Datum>.from(v.map((x) => Datum.fromJson(x))))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": Map.from(data!).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
    "message": message,
  };
}

class Datum {
  double pending;
  double totalPaid;
  int totalAmountToPay;

  Datum({
    required this.pending,
    required this.totalPaid,
    required this.totalAmountToPay,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    pending: json["pending"]?.toDouble(),
    totalPaid: json["total_paid"]?.toDouble(),
    totalAmountToPay: json["total_amount_to_pay"],
  );

  Map<String, dynamic> toJson() => {
    "pending": pending,
    "total_paid": totalPaid,
    "total_amount_to_pay": totalAmountToPay,
  };
}
