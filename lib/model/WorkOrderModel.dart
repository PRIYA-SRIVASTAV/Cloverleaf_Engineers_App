import 'dart:convert';

GetWorkOrderListModel getWorkOrderListModelFromJson(String str) => GetWorkOrderListModel.fromJson(json.decode(str));

String getWorkOrderListModelToJson(GetWorkOrderListModel data) => json.encode(data.toJson());

class GetWorkOrderListModel {
  String status;
  List<Datum> data;
  String message;

  GetWorkOrderListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GetWorkOrderListModel.fromJson(Map<String, dynamic> json) => GetWorkOrderListModel(
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

  Datum({
    required this.workId,
    required this.subject,
    required this.category,
    required this.priority,
    required this.desc,
    required this.loc,
    required this.asset,
    required this.woStatus,
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
  };
}
