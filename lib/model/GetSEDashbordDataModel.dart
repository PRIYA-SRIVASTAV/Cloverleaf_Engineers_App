// To parse this JSON data, do
//
//     final getSeDashbordDataModel = getSeDashbordDataModelFromJson(jsonString);

import 'dart:convert';

GetSeDashbordDataModel getSeDashbordDataModelFromJson(String str) => GetSeDashbordDataModel.fromJson(json.decode(str));

String getSeDashbordDataModelToJson(GetSeDashbordDataModel data) => json.encode(data.toJson());

class GetSeDashbordDataModel {
  bool? status;
  Data? data;
  String? message;

  GetSeDashbordDataModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetSeDashbordDataModel.fromJson(Map<String, dynamic> json) => GetSeDashbordDataModel(
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
  int? onging;
  int? completed;
  int? assign;
  String? payout;
  String? assignPerc;
  String? compPerc;
  String? ongoingPerc;

  Data({
    this.onging,
    this.completed,
    this.assign,
    this.payout,
    this.assignPerc,
    this.compPerc,
    this.ongoingPerc,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    onging: json["onging"],
    completed: json["completed"],
    assign: json["assign"],
    payout: json["payout"],
    assignPerc: json["assign_perc"],
    compPerc: json["comp_perc"],
    ongoingPerc: json["ongoing_perc"],
  );

  Map<String, dynamic> toJson() => {
    "onging": onging,
    "completed": completed,
    "assign": assign,
    "payout": payout,
    "assign_perc": assignPerc,
    "comp_perc": compPerc,
    "ongoing_perc": ongoingPerc,
  };
}
