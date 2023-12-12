// To parse this JSON data, do
//
//     final getSePayoutList = getSePayoutListFromJson(jsonString);

import 'dart:convert';

GetSePayoutList getSePayoutListFromJson(String str) => GetSePayoutList.fromJson(json.decode(str));

String getSePayoutListToJson(GetSePayoutList data) => json.encode(data.toJson());

class GetSePayoutList {
  bool? status;
  List<Datum>? data;
  String? message;

  GetSePayoutList({
    this.status,
    this.data,
    this.message,
  });

  factory GetSePayoutList.fromJson(Map<String, dynamic> json) => GetSePayoutList(
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
  String? seWorkingHours;
  String? costPerHour;
  int? id;
  String? year;
  int? workId;
  int? isPromised;
  String? totalPaid;
  String? pending;
  int? month;
  String? monthName;
  String? totalAmountToPay;

  Datum({
    this.seWorkingHours,
    this.costPerHour,
    this.id,
    this.year,
    this.workId,
    this.isPromised,
    this.totalPaid,
    this.pending,
    this.month,
    this.monthName,
    this.totalAmountToPay,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    seWorkingHours: json["se_working_hours"],
    costPerHour: json["cost_per_hour"],
    id: json["id"],
    year: json["year"],
    workId: json["work_id"],
    isPromised: json["is_promised"],
    totalPaid: json["total_paid"],
    pending: json["pending"],
    month: json["month"],
    monthName: json["month_name"],
    totalAmountToPay: json["total_amount_to_pay"],
  );

  Map<String, dynamic> toJson() => {
    "se_working_hours": seWorkingHours,
    "cost_per_hour": costPerHour,
    "id": id,
    "year": year,
    "work_id": workId,
    "is_promised": isPromised,
    "total_paid": totalPaid,
    "pending": pending,
    "month": month,
    "month_name": monthName,
    "total_amount_to_pay": totalAmountToPay,
  };
}
