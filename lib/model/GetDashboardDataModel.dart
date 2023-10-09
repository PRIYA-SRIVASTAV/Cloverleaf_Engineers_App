// To parse this JSON data, do
//
//     final getDashboardDataModel = getDashboardDataModelFromJson(jsonString);

import 'dart:convert';

GetDashboardDataModel getDashboardDataModelFromJson(String str) => GetDashboardDataModel.fromJson(json.decode(str));

String getDashboardDataModelToJson(GetDashboardDataModel data) => json.encode(data.toJson());

class GetDashboardDataModel {
  bool status;
  Data data;
  String message;

  GetDashboardDataModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GetDashboardDataModel.fromJson(Map<String, dynamic> json) => GetDashboardDataModel(
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
  int pending;
  int unassign;
  int completed;
  int accelerated;
  int rejected;
  String payout;
  String pendingPerc;
  String unassignPerc;
  String compPerc;
  String accPerc;

  Data({
    required this.pending,
    required this.unassign,
    required this.completed,
    required this.accelerated,
    required this.rejected,
    required this.payout,
    required this.pendingPerc,
    required this.unassignPerc,
    required this.compPerc,
    required this.accPerc,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    pending: json["pending"],
    unassign: json["unassign"],
    completed: json["completed"],
    accelerated: json["accelerated"],
    rejected: json["rejected"],
    payout: json["payout"],
    pendingPerc: json["pending_perc"],
    unassignPerc: json["unassign_perc"],
    compPerc: json["comp_perc"],
    accPerc: json["acc_perc"],
  );

  Map<String, dynamic> toJson() => {
    "pending": pending,
    "unassign": unassign,
    "completed": completed,
    "accelerated": accelerated,
    "rejected": rejected,
    "payout": payout,
    "pending_perc": pendingPerc,
    "unassign_perc": unassignPerc,
    "comp_perc": compPerc,
    "acc_perc": accPerc,
  };
}
