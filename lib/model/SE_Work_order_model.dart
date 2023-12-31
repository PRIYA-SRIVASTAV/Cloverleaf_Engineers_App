// To parse this JSON data, do
//
//     final getSeWorkOrderListModel = getSeWorkOrderListModelFromJson(jsonString);

import 'dart:convert';

GetSeWorkOrderListModel getSeWorkOrderListModelFromJson(String str) => GetSeWorkOrderListModel.fromJson(json.decode(str));

String getSeWorkOrderListModelToJson(GetSeWorkOrderListModel data) => json.encode(data.toJson());

class GetSeWorkOrderListModel {
  String status;
  List<Datum> data;
  String message;

  GetSeWorkOrderListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GetSeWorkOrderListModel.fromJson(Map<String, dynamic> json) => GetSeWorkOrderListModel(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  int workId;
  String subject;
  String category;
  String priority;
  String desc;
  String loc;
  String asset;
  String woStatus;
  int assignedEngineerId;
  String zegoUserId;
  String assignedEngineerName;

  Datum({
    required this.workId,
    required this.subject,
    required this.category,
    required this.priority,
    required this.desc,
    required this.loc,
    required this.asset,
    required this.woStatus,
    required this.assignedEngineerId,
    required this.zegoUserId,
    required this.assignedEngineerName,
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
  };
}
