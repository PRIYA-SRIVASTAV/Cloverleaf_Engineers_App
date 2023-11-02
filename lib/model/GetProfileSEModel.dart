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
  int id;
  String userType;
  int isEnabled;
  String name;
  String email;
  int phone;
  String address1;
  String address2;
  String city;
  String state;
  int zipCode;
  String isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  String image;
  int isActive;
  String isFreelancer;
  String location;
  String calender;
  String machineType;
  String technical;
  String experiance;
  String language;
  String clusterId;
  String profileId;
  String isExpert;
  String deviceType;
  String applicationName;
  String machine;
  int uniqueId;

  Data({
    required this.id,
    required this.userType,
    required this.isEnabled,
    required this.name,
    required this.email,
    required this.phone,
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
    required this.isActive,
    required this.isFreelancer,
    required this.location,
    required this.calender,
    required this.machineType,
    required this.technical,
    required this.experiance,
    required this.language,
    required this.clusterId,
    required this.profileId,
    required this.isExpert,
    required this.deviceType,
    required this.applicationName,
    required this.machine,
    required this.uniqueId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    userType: json["user_type"],
    isEnabled: json["is_enabled"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    address1: json["address_1"],
    address2: json["address_2"],
    city: json["city"],
    state: json["state"],
    zipCode: json["zip_code"],
    isDeleted: json["is_deleted"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    image: json["image"],
    isActive: json["is_active"],
    isFreelancer: json["is_freelancer"],
    location: json["location"],
    calender: json["calender"],
    machineType: json["machine_type"],
    technical: json["technical"],
    experiance: json["experiance"],
    language: json["language"],
    clusterId: json["cluster_id"],
    profileId: json["profile_id"],
    isExpert: json["is_expert"],
    deviceType: json["device_type"],
    applicationName: json["application_name"],
    machine: json["machine"],
    uniqueId: json["unique_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_type": userType,
    "is_enabled": isEnabled,
    "name": name,
    "email": email,
    "phone": phone,
    "address_1": address1,
    "address_2": address2,
    "city": city,
    "state": state,
    "zip_code": zipCode,
    "is_deleted": isDeleted,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "image": image,
    "is_active": isActive,
    "is_freelancer": isFreelancer,
    "location": location,
    "calender": calender,
    "machine_type": machineType,
    "technical": technical,
    "experiance": experiance,
    "language": language,
    "cluster_id": clusterId,
    "profile_id": profileId,
    "is_expert": isExpert,
    "device_type": deviceType,
    "application_name": applicationName,
    "machine": machine,
    "unique_id": uniqueId,
  };
}
