// To parse this JSON data, do
//
//     final getSeWorkOrderListModel = getSeWorkOrderListModelFromJson(jsonString);

import 'dart:convert';

GetSeWorkOrderListModel getSeWorkOrderListModelFromJson(String str) => GetSeWorkOrderListModel.fromJson(json.decode(str));

String getSeWorkOrderListModelToJson(GetSeWorkOrderListModel data) => json.encode(data.toJson());

class GetSeWorkOrderListModel {
  bool? status;
  List<Datum>? data;
  String? message;

  GetSeWorkOrderListModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetSeWorkOrderListModel.fromJson(Map<String, dynamic> json) => GetSeWorkOrderListModel(
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
  int? assignedEngineerId;
  String? zegoUserId;
  String? assignedEngineerName;
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
    this.assignedEngineerId,
    this.zegoUserId,
    this.assignedEngineerName,
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
    assignedEngineerId: json["assigned_engineer_id"],
    zegoUserId: json["zego_user_id"],
    assignedEngineerName: json["assigned_engineer_name"],
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
    "assigned_engineer_id": assignedEngineerId,
    "zego_user_id": zegoUserId,
    "assigned_engineer_name": assignedEngineerName,
    "wo_status_date": woStatusDate,
  };
}
