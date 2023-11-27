// To parse this JSON data, do
//
//     final getWorkOrderListModel = getWorkOrderListModelFromJson(jsonString);

import 'dart:convert';

GetWorkOrderListModel getWorkOrderListModelFromJson(String str) => GetWorkOrderListModel.fromJson(json.decode(str));

String getWorkOrderListModelToJson(GetWorkOrderListModel data) => json.encode(data.toJson());

class GetWorkOrderListModel {
  bool? status;
  List<Datum>? data;
  String? message;

  GetWorkOrderListModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetWorkOrderListModel.fromJson(Map<String, dynamic> json) => GetWorkOrderListModel(
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
  int? workId;
  String? subject;
  String? category;
  String? priority;
  String? desc;
  String? loc;
  String? asset;
  String? woStatus;
  String? woStatusDate;

  Datum({
    this.workId,
    this.subject,
    this.category,
    this.priority,
    this.desc,
    this.loc,
    this.asset,
    this.woStatus,
    this.woStatusDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    workId: json["work_id"],
    subject: json["subject"],
    category: json["category"],
    priority: json["priority"],
    desc: json["desc"],
    loc: json["loc"],
    asset: json["asset"],
    woStatus: json["wo_status"],
    woStatusDate: json["wo_status_date"],
  );

  Map<String, dynamic> toJson() => {
    "work_id": workId,
    "subject": subject,
    "category": category,
    "priority": priority,
    "desc": desc,
    "loc": loc,
    "asset": asset,
    "wo_status": woStatus,
    "wo_status_date": woStatusDate,
  };
}
