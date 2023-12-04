// To parse this JSON data, do
//
//     final getSeCallLogsList = getSeCallLogsListFromJson(jsonString);

import 'dart:convert';

GetSeCallLogsList getSeCallLogsListFromJson(String str) => GetSeCallLogsList.fromJson(json.decode(str));

String getSeCallLogsListToJson(GetSeCallLogsList data) => json.encode(data.toJson());

class GetSeCallLogsList {
  bool? status;
  Data? data;

  GetSeCallLogsList({
    this.status,
    this.data,
  });

  factory GetSeCallLogsList.fromJson(Map<String, dynamic> json) => GetSeCallLogsList(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  List<Today>? today;
  List<dynamic>? yesterday;
  List<dynamic>? older;

  Data({
    this.today,
    this.yesterday,
    this.older,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    today: json["today"] == null ? [] : List<Today>.from(json["today"]!.map((x) => Today.fromJson(x))),
    yesterday: json["yesterday"] == null ? [] : List<dynamic>.from(json["yesterday"]!.map((x) => x)),
    older: json["older"] == null ? [] : List<dynamic>.from(json["older"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "today": today == null ? [] : List<dynamic>.from(today!.map((x) => x.toJson())),
    "yesterday": yesterday == null ? [] : List<dynamic>.from(yesterday!.map((x) => x)),
    "older": older == null ? [] : List<dynamic>.from(older!.map((x) => x)),
  };
}

class Today {
  String? engName;
  String? duration;
  int? callStatus;
  int? callType;
  int? workorderId;
  String? date;
  String? time;

  Today({
    this.engName,
    this.duration,
    this.callStatus,
    this.callType,
    this.workorderId,
    this.date,
    this.time,
  });

  factory Today.fromJson(Map<String, dynamic> json) => Today(
    engName: json["eng_name"],
    duration: json["duration"],
    callStatus: json["call_status"],
    callType: json["call_type"],
    workorderId: json["workorder_id"],
    date: json["date"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "eng_name": engName,
    "duration": duration,
    "call_status": callStatus,
    "call_type": callType,
    "workorder_id": workorderId,
    "date": date,
    "time": time,
  };
}