import 'dart:convert';

GetTechnicianSummaryModel getTechnicianSummaryModelFromJson(String str) => GetTechnicianSummaryModel.fromJson(json.decode(str));

String getTechnicianSummaryModelToJson(GetTechnicianSummaryModel data) => json.encode(data.toJson());

class GetTechnicianSummaryModel {
  bool? status;
  Data? data;
  String? message;

  GetTechnicianSummaryModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetTechnicianSummaryModel.fromJson(Map<String, dynamic> json) => GetTechnicianSummaryModel(
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
  List<AfterImage>? beforeImage;
  List<AfterImage>? afterImage;
  List<AfterImage>? attachFile;
  String? techSummary;
  String? hrsSpentByTech;

  Data({
    this.beforeImage,
    this.afterImage,
    this.attachFile,
    this.techSummary,
    this.hrsSpentByTech,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    beforeImage: json["before_image"] == null ? [] : List<AfterImage>.from(json["before_image"]!.map((x) => AfterImage.fromJson(x))),
    afterImage: json["after_image"] == null ? [] : List<AfterImage>.from(json["after_image"]!.map((x) => AfterImage.fromJson(x))),
    attachFile: json["attach_file"] == null ? [] : List<AfterImage>.from(json["attach_file"]!.map((x) => AfterImage.fromJson(x))),
    techSummary: json["tech_summary"],
    hrsSpentByTech: json["hrs_spent_by_tech"],
  );

  Map<String, dynamic> toJson() => {
    "before_image": beforeImage == null ? [] : List<dynamic>.from(beforeImage!.map((x) => x.toJson())),
    "after_image": afterImage == null ? [] : List<dynamic>.from(afterImage!.map((x) => x.toJson())),
    "attach_file": attachFile == null ? [] : List<dynamic>.from(attachFile!.map((x) => x.toJson())),
    "tech_summary": techSummary,
    "hrs_spent_by_tech": hrsSpentByTech,
  };
}

class AfterImage {
  int? type;
  String? path;
  String? date;
  String? time;

  AfterImage({
    this.type,
    this.path,
    this.date,
    this.time,
  });

  factory AfterImage.fromJson(Map<String, dynamic> json) => AfterImage(
    type: json["type"],
    path: json["path"],
    date: json["date"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "path": path,
    "date": date,
    "time": time,
  };
}
