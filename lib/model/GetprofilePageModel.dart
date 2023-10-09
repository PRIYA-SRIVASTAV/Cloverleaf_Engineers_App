import 'dart:convert';

GetProfileDetailsModel getProfileDetailsModelFromJson(String str) => GetProfileDetailsModel.fromJson(json.decode(str));

String getProfileDetailsModelToJson(GetProfileDetailsModel data) => json.encode(data.toJson());

class GetProfileDetailsModel {
  String status;
  Data data;
  String message;

  GetProfileDetailsModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GetProfileDetailsModel.fromJson(Map<String, dynamic> json) => GetProfileDetailsModel(
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
  };
}
