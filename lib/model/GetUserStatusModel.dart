import 'dart:convert';

GetUserStatusModel getUserStatusModelFromJson(String str) => GetUserStatusModel.fromJson(json.decode(str));

String getUserStatusModelToJson(GetUserStatusModel data) => json.encode(data.toJson());

class GetUserStatusModel {
  String status;
  int data;
  String message;

  GetUserStatusModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GetUserStatusModel.fromJson(Map<String, dynamic> json) => GetUserStatusModel(
    status: json["status"],
    data: json["data"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}
