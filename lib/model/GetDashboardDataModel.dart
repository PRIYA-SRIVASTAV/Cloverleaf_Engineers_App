import 'dart:convert';

GetDashboardDataModel getDashboardDataModelFromJson(String str) => GetDashboardDataModel.fromJson(json.decode(str));

String getDashboardDataModelToJson(GetDashboardDataModel data) => json.encode(data.toJson());

class GetDashboardDataModel {
  bool? status;
  Data? data;
  String? message;

  GetDashboardDataModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetDashboardDataModel.fromJson(Map<String, dynamic> json) => GetDashboardDataModel(
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
  int? assign;
  int? ongoing;
  int? accelerate;
  int? completed;
  int? rejected;
  String? payout;
  String? pendingPerc;
  String? unassignPerc;
  String? compPerc;
  String? accPerc;

  Data({
    this.assign,
    this.ongoing,
    this.accelerate,
    this.completed,
    this.rejected,
    this.payout,
    this.pendingPerc,
    this.unassignPerc,
    this.compPerc,
    this.accPerc,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    assign: json["assign"],
    ongoing: json["ongoing"],
    accelerate: json["accelerate"],
    completed: json["completed"],
    rejected: json["rejected"],
    payout: json["payout"],
    pendingPerc: json["pending_perc"],
    unassignPerc: json["unassign_perc"],
    compPerc: json["comp_perc"],
    accPerc: json["acc_perc"],
  );

  Map<String, dynamic> toJson() => {
    "assign": assign,
    "ongoing": ongoing,
    "accelerate": accelerate,
    "completed": completed,
    "rejected": rejected,
    "payout": payout,
    "pending_perc": pendingPerc,
    "unassign_perc": unassignPerc,
    "comp_perc": compPerc,
    "acc_perc": accPerc,
  };
}
