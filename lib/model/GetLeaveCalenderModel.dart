// To parse this JSON data, do
//
//     final getLeaveCalendarModel = getLeaveCalendarModelFromJson(jsonString);

import 'dart:convert';

GetLeaveCalendarModel getLeaveCalendarModelFromJson(String str) => GetLeaveCalendarModel.fromJson(json.decode(str));

String getLeaveCalendarModelToJson(GetLeaveCalendarModel data) => json.encode(data.toJson());

class GetLeaveCalendarModel {
  bool? status;
  Map<String, List<Datum>>? data;
  String? message;

  GetLeaveCalendarModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetLeaveCalendarModel.fromJson(Map<String, dynamic> json) => GetLeaveCalendarModel(
    status: json["status"],
    data: Map.from(json["data"]!).map((k, v) => MapEntry<String, List<Datum>>(k, List<Datum>.from(v.map((x) => Datum.fromJson(x))))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": Map.from(data!).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
    "message": message,
  };
}

class Datum {
  int? isOnleave;
  int? leaveStatus;
  String? notes;

  Datum({
    this.isOnleave,
    this.leaveStatus,
    this.notes,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    isOnleave: json["is_onleave"],
    leaveStatus: json["leave_status"],
    notes: json["notes"],
  );

  Map<String, dynamic> toJson() => {
    "is_onleave": isOnleave,
    "leave_status": leaveStatus,
    "notes": notes,
  };
}
