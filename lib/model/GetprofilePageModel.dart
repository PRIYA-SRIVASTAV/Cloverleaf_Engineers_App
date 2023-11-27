// To parse this JSON data, do
//
//     final getProfileDetailsModel = getProfileDetailsModelFromJson(jsonString);

import 'dart:convert';

GetProfileDetailsModel getProfileDetailsModelFromJson(String str) => GetProfileDetailsModel.fromJson(json.decode(str));

String getProfileDetailsModelToJson(GetProfileDetailsModel data) => json.encode(data.toJson());

class GetProfileDetailsModel {
  Data? data;
  String? message;
  bool? status;

  GetProfileDetailsModel({
    this.data,
    this.message,
    this.status,
  });

  factory GetProfileDetailsModel.fromJson(Map<String, dynamic> json) => GetProfileDetailsModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "message": message,
    "status": status,
  };
}

class Data {
  String? address1;
  String? address2;
  String? city;
  String? email;
  String? image;
  String? name;
  int? phone;
  String? state;
  int? zipCode;

  Data({
    this.address1,
    this.address2,
    this.city,
    this.email,
    this.image,
    this.name,
    this.phone,
    this.state,
    this.zipCode,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    address1: json["address_1"],
    address2: json["address_2"],
    city: json["city"],
    email: json["email"],
    image: json["image"],
    name: json["name"],
    phone: json["phone"],
    state: json["state"],
    zipCode: json["zip_code"],
  );

  Map<String, dynamic> toJson() => {
    "address_1": address1,
    "address_2": address2,
    "city": city,
    "email": email,
    "image": image,
    "name": name,
    "phone": phone,
    "state": state,
    "zip_code": zipCode,
  };
}
