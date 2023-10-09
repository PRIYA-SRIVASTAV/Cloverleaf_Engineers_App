import 'dart:convert';

GetAddPartsListModel getAddPartsListModelFromJson(String str) => GetAddPartsListModel.fromJson(json.decode(str));

String getAddPartsListModelToJson(GetAddPartsListModel data) => json.encode(data.toJson());

class GetAddPartsListModel {
  String status;
  List<Datum> data;
  String message;

  GetAddPartsListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GetAddPartsListModel.fromJson(Map<String, dynamic> json) => GetAddPartsListModel(
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
  String partsName;
  int partsId;

  Datum({
    required this.partsName,
    required this.partsId,
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
