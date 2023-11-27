// To parse this JSON data, do
//
//     final getAddPartsListModel = getAddPartsListModelFromJson(jsonString);

import 'dart:convert';

GetAddPartsListModel getAddPartsListModelFromJson(String str) => GetAddPartsListModel.fromJson(json.decode(str));

String getAddPartsListModelToJson(GetAddPartsListModel data) => json.encode(data.toJson());

class GetAddPartsListModel {
  bool? status;
  List<Datum>? data;
  String? message;

  GetAddPartsListModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetAddPartsListModel.fromJson(Map<String, dynamic> json) => GetAddPartsListModel(
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
  String? partsName;
  int? partsId;

  Datum({
    this.partsName,
    this.partsId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    partsName: json["parts_name"],
    partsId: json["parts_id"],
  );

  Map<String, dynamic> toJson() => {
    "parts_name": partsName,
    "parts_id": partsId,
  };
}
