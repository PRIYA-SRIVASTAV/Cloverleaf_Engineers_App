// To parse this JSON data, do
//
//     final getPayoutTransactionListModel = getPayoutTransactionListModelFromJson(jsonString);

import 'dart:convert';

GetPayoutTransactionListModel getPayoutTransactionListModelFromJson(String str) => GetPayoutTransactionListModel.fromJson(json.decode(str));

String getPayoutTransactionListModelToJson(GetPayoutTransactionListModel data) => json.encode(data.toJson());

class GetPayoutTransactionListModel {
  bool? status;
  List<Datum>? data;
  String? message;

  GetPayoutTransactionListModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetPayoutTransactionListModel.fromJson(Map<String, dynamic> json) => GetPayoutTransactionListModel(
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
  int? id;
  String? transactionId;
  int? workId;
  int? amount;
  String? date;

  Datum({
    this.id,
    this.transactionId,
    this.workId,
    this.amount,
    this.date,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    transactionId: json["transaction_id"],
    workId: json["work_id"],
    amount: json["amount"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "transaction_id": transactionId,
    "work_id": workId,
    "amount": amount,
    "date": date,
  };
}
