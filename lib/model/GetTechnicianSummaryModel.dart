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
  int? type;
  String? path;
  Date? date;
  String? time;

  AttachFile({
    this.type,
    this.path,
    this.date,
    this.time,
  });

  factory AttachFile.fromJson(Map<String, dynamic> json) => AttachFile(
    type: json["type"],
    path: json["path"],
    date: dateValues.map[json["date"]]!,
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "path": path,
    "date": dateValues.reverse[date],
    "time": time,
  };
}

enum Date {
  THE_26_DEC_2023,
  THE_27_DEC_2023
}

final dateValues = EnumValues({
  "26 Dec 2023": Date.THE_26_DEC_2023,
  "27 Dec 2023": Date.THE_27_DEC_2023
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
