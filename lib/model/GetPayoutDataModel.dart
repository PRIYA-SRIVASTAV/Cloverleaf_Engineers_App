// To parse this JSON data, do
//
//     final getPayoutDataModel = getPayoutDataModelFromJson(jsonString);

import 'dart:convert';

GetPayoutDataModel getPayoutDataModelFromJson(String str) => GetPayoutDataModel.fromJson(json.decode(str));

String getPayoutDataModelToJson(GetPayoutDataModel data) => json.encode(data.toJson());

class GetPayoutDataModel {
  String status;
  List<Datum> data;
  String message;

  GetPayoutDataModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GetPayoutDataModel.fromJson(Map<String, dynamic> json) => GetPayoutDataModel(
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
  double payout;
  int workId;
  String subject;
  DateTime payoutDate;

  Datum({
    required this.payout,
    required this.workId,
    required this.subject,
    required this.payoutDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    payout: json["payout"]?.toDouble(),
    workId: json["work_id"],
    subject: json["subject"],
    payoutDate: DateTime.parse(json["payout_date"]),
  );

  Map<String, dynamic> toJson() => {
    "payout": payout,
    "work_id": workId,
    "subject": subject,
    "payout_date": "${payoutDate.year.toString().padLeft(4, '0')}-${payoutDate.month.toString().padLeft(2, '0')}-${payoutDate.day.toString().padLeft(2, '0')}",
  };
}
