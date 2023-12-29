// To parse this JSON data, do
//
//     final getEscalateDataModel = getEscalateDataModelFromJson(jsonString);

import 'dart:convert';

GetEscalateDataModel getEscalateDataModelFromJson(String str) => GetEscalateDataModel.fromJson(json.decode(str));

String getEscalateDataModelToJson(GetEscalateDataModel data) => json.encode(data.toJson());

class GetEscalateDataModel {
  bool? status;
  Data? data;
  String? message;

  GetEscalateDataModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetEscalateDataModel.fromJson(Map<String, dynamic> json) => GetEscalateDataModel(
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
  int? scId;
  String? location;
  String? desc;
  String? priority;
  String? category;
  String? subject;
  int? workId;
  String? zegoUserId;
  List<String>? clientImages;
  List<Comment>? comment;
  EscalateWoData? escalateWoData;

  Data({
    this.woStatus,
    this.assetName,
    this.createdDate,
    this.createdTime,
    this.scId,
    this.location,
    this.desc,
    this.priority,
    this.category,
    this.subject,
    this.workId,
    this.zegoUserId,
    this.clientImages,
    this.comment,
    this.escalateWoData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    woStatus: json["wo_status"],
    assetName: json["asset_name"],
    createdDate: json["created_date"],
    createdTime: json["created_time"],
    scId: json["scId"],
    location: json["location"],
    desc: json["desc"],
    priority: json["priority"],
    category: json["category"],
    subject: json["subject"],
    workId: json["work_id"],
    zegoUserId: json["zego_user_id"],
    clientImages: json["client_images"] == null ? [] : List<String>.from(json["client_images"]!.map((x) => x)),
    comment: json["comment"] == null ? [] : List<Comment>.from(json["comment"]!.map((x) => Comment.fromJson(x))),
    escalateWoData: json["escalate_wo_data"] == null ? null : EscalateWoData.fromJson(json["escalate_wo_data"]),
  );

  Map<String, dynamic> toJson() => {
    "wo_status": woStatus,
    "asset_name": assetName,
    "created_date": createdDate,
    "created_time": createdTime,
    "scId": scId,
    "location": location,
    "desc": desc,
    "priority": priority,
    "category": category,
    "subject": subject,
    "work_id": workId,
    "zego_user_id": zegoUserId,
    "client_images": clientImages == null ? [] : List<dynamic>.from(clientImages!.map((x) => x)),
    "comment": comment == null ? [] : List<dynamic>.from(comment!.map((x) => x.toJson())),
    "escalate_wo_data": escalateWoData?.toJson(),
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

class EscalateWoData {
  List<BeforeEscalateImage>? beforeEscalateImage;
  List<BeforeEscalateImage>? escalateFile;

  EscalateWoData({
    this.beforeEscalateImage,
    this.escalateFile,
  });

  factory EscalateWoData.fromJson(Map<String, dynamic> json) => EscalateWoData(
    beforeEscalateImage: json["before_escalate_image"] == null ? [] : List<BeforeEscalateImage>.from(json["before_escalate_image"]!.map((x) => BeforeEscalateImage.fromJson(x))),
    escalateFile: json["escalate_file"] == null ? [] : List<BeforeEscalateImage>.from(json["escalate_file"]!.map((x) => BeforeEscalateImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "before_escalate_image": beforeEscalateImage == null ? [] : List<dynamic>.from(beforeEscalateImage!.map((x) => x.toJson())),
    "escalate_file": escalateFile == null ? [] : List<dynamic>.from(escalateFile!.map((x) => x.toJson())),
  };
}

class BeforeEscalateImage {
  int? id;
  int? type;
  String? name;
  String? path;
  String? date;
  String? time;

  BeforeEscalateImage({
    this.id,
    this.type,
    this.name,
    this.path,
    this.date,
    this.time,
  });

  factory BeforeEscalateImage.fromJson(Map<String, dynamic> json) => BeforeEscalateImage(
    id: json["id"],
    type: json["type"],
    name: json["name"],
    path: json["path"],
    date: json["date"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
    "path": path,
    "date": date,
    "time": time,
  };
}
