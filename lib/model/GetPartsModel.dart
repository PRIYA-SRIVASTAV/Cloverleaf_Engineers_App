import 'dart:convert';

GetPartsModel getPartsModelFromJson(String str) => GetPartsModel.fromJson(json.decode(str));

String getPartsModelToJson(GetPartsModel data) => json.encode(data.toJson());

class GetPartsModel {
  String status;
  List<Dat> data;
  String message;

  GetPartsModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GetPartsModel.fromJson(Map<String, dynamic> json) => GetPartsModel(
    status: json["status"],
    data: List<Dat>.from(json["data"].map((x) => Dat.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Dat {
  String name;
  int id;

  Dat({
    required this.name,
    required this.id,
  });

  factory Dat.fromJson(Map<String, dynamic> json) => Dat(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}
