// To parse this JSON data, do
//
//     final getWorkorderdetailsModel = getWorkorderdetailsModelFromJson(jsonString);

import 'dart:convert';

GetWorkorderdetailsModel getWorkorderdetailsModelFromJson(String str) => GetWorkorderdetailsModel.fromJson(json.decode(str));

String getWorkorderdetailsModelToJson(GetWorkorderdetailsModel data) => json.encode(data.toJson());

class GetWorkorderdetailsModel {
  bool? status;
  Data? data;
  String? message;

  GetWorkorderdetailsModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetWorkorderdetailsModel.fromJson(Map<String, dynamic> json) => GetWorkorderdetailsModel(
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
  String? woStatus;
  String? assetName;
  String? createdDate;
  String? createdTime;
  String? location;
  String? desc;
  String? priority;
  String? category;
  String? subject;
  int? workId;
  List<String>? clientImages;
  List<Comment>? comment;

  Data({
    this.woStatus,
    this.assetName,
    this.createdDate,
    this.createdTime,
    this.location,
    this.desc,
    this.priority,
    this.category,
    this.subject,
    this.workId,
    this.clientImages,
    this.comment,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    woStatus: json["wo_status"],
    assetName: json["asset_name"],
    createdDate: json["created_date"],
    createdTime: json["created_time"],
    location: json["location"],
    desc: json["desc"],
    priority: json["priority"],
    category: json["category"],
    subject: json["subject"],
    workId: json["work_id"],
    clientImages: json["client_images"] == null ? [] : List<String>.from(json["client_images"]!.map((x) => x)),
    comment: json["comment"] == null ? [] : List<Comment>.from(json["comment"]!.map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "wo_status": woStatus,
    "asset_name": assetName,
    "created_date": createdDate,
    "created_time": createdTime,
    "location": location,
    "desc": desc,
    "priority": priority,
    "category": category,
    "subject": subject,
    "work_id": workId,
    "client_images": clientImages == null ? [] : List<dynamic>.from(clientImages!.map((x) => x)),
    "comment": comment == null ? [] : List<dynamic>.from(comment!.map((x) => x.toJson())),
  };
}

class Comment {
  int? commentType;
  String? comment;
  String? name;
  String? date;
  String? time;

  Comment({
    this.commentType,
    this.comment,
    this.name,
    this.date,
    this.time,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    commentType: json["comment_type"],
    comment: json["comment"],
    name: json["name"],
    date: json["date"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "comment_type": commentType,
    "comment": comment,
    "name": name,
    "date": date,
    "time": time,
  };
}
