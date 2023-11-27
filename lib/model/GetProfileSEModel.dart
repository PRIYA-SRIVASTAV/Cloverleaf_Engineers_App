// To parse this JSON data, do
//
//     final getProfileSeDetailsModel = getProfileSeDetailsModelFromJson(jsonString);

import 'dart:convert';

GetProfileSeDetailsModel getProfileSeDetailsModelFromJson(String str) => GetProfileSeDetailsModel.fromJson(json.decode(str));

String getProfileSeDetailsModelToJson(GetProfileSeDetailsModel data) => json.encode(data.toJson());

class GetProfileSeDetailsModel {
  bool? status;
  Data? data;
  String? message;

  GetProfileSeDetailsModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetProfileSeDetailsModel.fromJson(Map<String, dynamic> json) => GetProfileSeDetailsModel(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  String? name;
  String? email;
  int? phone;
  String? address1;
  String? address2;
  int? zipCode;
  String? state;
  String? city;
  String? image;

  Data({
    this.name,
    this.email,
    this.phone,
    this.address1,
    this.address2,
    this.zipCode,
    this.state,
    this.city,
    this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    address1: json["address_1"],
    address2: json["address_2"],
    zipCode: json["zip_code"],
    state: json["state"],
    city: json["city"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "address_1": address1,
    "address_2": address2,
    "zip_code": zipCode,
    "state": state,
    "city": city,
    "image": image,
  };
}
