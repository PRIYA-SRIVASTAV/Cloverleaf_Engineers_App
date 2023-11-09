// To parse this JSON data, do
//
//     final getProfileSeDetailsModel = getProfileSeDetailsModelFromJson(jsonString);

import 'dart:convert';

GetProfileSeDetailsModel getProfileSeDetailsModelFromJson(String str) => GetProfileSeDetailsModel.fromJson(json.decode(str));

String getProfileSeDetailsModelToJson(GetProfileSeDetailsModel data) => json.encode(data.toJson());

class GetProfileSeDetailsModel {
  String status;
  Data data;
  String message;

  GetProfileSeDetailsModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GetProfileSeDetailsModel.fromJson(Map<String, dynamic> json) => GetProfileSeDetailsModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  String name;
  String email;
  int phone;
  String address1;
  String address2;
  String city;
  String state;
  int zipCode;
  String image;

  Data({
    required this.name,
    required this.email,
    required this.phone,
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    address1: json["address_1"],
    address2: json["address_2"],
    city: json["city"],
    state: json["state"],
    zipCode: json["zip_code"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "address_1": address1,
    "address_2": address2,
    "city": city,
    "state": state,
    "zip_code": zipCode,
    "image": image,
  };
}
