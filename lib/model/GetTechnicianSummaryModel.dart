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
  List<AttachFile>? beforeAfterImage;
  List<AttachFile>? attachFile;
  String? techSummary;
  String? hrsSpentByTech;

  Data({
    this.beforeAfterImage,
    this.attachFile,
    this.techSummary,
    this.hrsSpentByTech,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    beforeAfterImage: json["before_after_image"] == null ? [] : List<AttachFile>.from(json["before_after_image"]!.map((x) => AttachFile.fromJson(x))),
    attachFile: json["attach_file"] == null ? [] : List<AttachFile>.from(json["attach_file"]!.map((x) => AttachFile.fromJson(x))),
    techSummary: json["tech_summary"],
    hrsSpentByTech: json["hrs_spent_by_tech"],
  );

  Map<String, dynamic> toJson() => {
    "before_after_image": beforeAfterImage == null ? [] : List<dynamic>.from(beforeAfterImage!.map((x) => x.toJson())),
    "attach_file": attachFile == null ? [] : List<dynamic>.from(attachFile!.map((x) => x.toJson())),
    "tech_summary": techSummary,
    "hrs_spent_by_tech": hrsSpentByTech,
  };
}

class AttachFile {
  int? id;
  int? type;
  String? path;
  String? name;
  String? date;
  String? time;

  AttachFile({
    this.id,
    this.type,
    this.path,
    this.name,
    this.date,
    this.time,
  });

  factory AttachFile.fromJson(Map<String, dynamic> json) => AttachFile(
    id: json["id"],
    type: json["type"],
    path: json["path"],
    name: json["name"],
    date: json["date"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "path": path,
    "name": name,
    "date": date,
    "time": time,
  };
}
