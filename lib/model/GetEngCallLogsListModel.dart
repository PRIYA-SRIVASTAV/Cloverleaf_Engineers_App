import 'dart:convert';

GetEngCallLogsList getEngCallLogsListFromJson(String str) => GetEngCallLogsList.fromJson(json.decode(str));

String getEngCallLogsListToJson(GetEngCallLogsList data) => json.encode(data.toJson());

class GetEngCallLogsList {
  bool? status;
  Data? data;

  GetEngCallLogsList({
    this.status,
    this.data,
  });

  factory GetEngCallLogsList.fromJson(Map<String, dynamic> json) => GetEngCallLogsList(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  List<Older>? today;
  List<Older>? yesterday;
  List<Older>? older;

  Data({
    this.today,
    this.yesterday,
    this.older,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    today: json["today"] == null ? [] : List<Older>.from(json["today"]!.map((x) => Older.fromJson(x))),
    yesterday: json["yesterday"] == null ? [] : List<Older>.from(json["yesterday"]!.map((x) => Older.fromJson(x))),
    older: json["older"] == null ? [] : List<Older>.from(json["older"]!.map((x) => Older.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "today": today == null ? [] : List<dynamic>.from(today!.map((x) => x.toJson())),
    "yesterday": yesterday == null ? [] : List<dynamic>.from(yesterday!.map((x) => x.toJson())),
    "older": older == null ? [] : List<dynamic>.from(older!.map((x) => x.toJson())),
  };
}

class Older {
  String? subjectExpertName;
  String? duration;
  int? callStatus;
  int? callType;
  int? workorderId;
  String? date;
  String? time;

  Older({
    this.subjectExpertName,
    this.duration,
    this.callStatus,
    this.callType,
    this.workorderId,
    this.date,
    this.time,
  });

  factory Older.fromJson(Map<String, dynamic> json) => Older(
    subjectExpertName: json["subject_expert_name"],
    duration: json["duration"],
    callStatus: json["call_status"],
    callType: json["call_type"],
    workorderId: json["workorder_id"],
    date: json["date"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "subject_expert_name": subjectExpertName,
    "duration": duration,
    "call_status": callStatus,
    "call_type": callType,
    "workorder_id": workorderId,
    "date": date,
    "time": time,
  };
}
