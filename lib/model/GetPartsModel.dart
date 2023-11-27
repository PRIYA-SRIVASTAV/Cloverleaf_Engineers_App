// To parse this JSON data, do
//
//     final getPartsModel = getPartsModelFromJson(jsonString);

import 'dart:convert';

GetPartsModel getPartsModelFromJson(String str) => GetPartsModel.fromJson(json.decode(str));

String getPartsModelToJson(GetPartsModel data) => json.encode(data.toJson());

class GetPartsModel {
  bool? status;
  List<Datum>? data;
  String? message;

  GetPartsModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetPartsModel.fromJson(Map<String, dynamic> json) => GetPartsModel(
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
  String? name;
  int? id;

  Datum({
    this.name,
    this.id,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}
