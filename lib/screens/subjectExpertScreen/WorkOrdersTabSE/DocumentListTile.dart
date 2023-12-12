import 'dart:io';
import 'package:cloverleaf_project/constant/colorConstant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/helperMethods.dart';
import 'package:path/path.dart' as Path;

class DocumentListTile extends StatefulWidget {
  var fileUrl;

  var title;

  DocumentListTile({required this.title, required this.fileUrl, super.key});

  @override
  State<DocumentListTile> createState() => _DocumentListTileState();
}

class _DocumentListTileState extends State<DocumentListTile> {
  bool downloading = false;
  bool fileExists = false;
  double progress = 0;
  String fileName = "";
  late String filePath;
  late CancelToken cancelToken;
  var getPathFile = DirectoryPath();

  startDownload() async {
    cancelToken = CancelToken();
    var storePath = await getPathFile.getPath();
    filePath = '$storePath/$fileName';
    setState(() {
      downloading = true;
      progress = 0;
    });
    try {
      await Dio().download(widget.fileUrl, filePath,
          onReceiveProgress: (count, total) {
        setState(() {
          progress = (count / total);
        });
      }, cancelToken: cancelToken);
      setState(() {
        downloading = false;
        fileExists = true;
      });
    } catch (e) {
      setState(() {
        downloading = false;
      });
    }
  }

  cancelDownload() async {
    cancelToken.cancel();
    setState(() {
      downloading = false;
    });
  }

  checkFileExit() async {
    var storePath = await getPathFile.getPath();
    filePath = '$storePath/$fileName';
    bool fileExistCheck = await File(filePath).exists();
    setState(() {
      fileExists = fileExistCheck;
    });
    checkFileExit();
  }

  openFile(){
    OpenFile.open(filePath);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fileName = Path.basename(widget.fileUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.h,
      shadowColor: Colors.grey.shade100,
      child: ListTile(
        title: Text(
          widget.title,
          style: GoogleFonts.lato(fontSize: 10.sp),
        ),
        leading: InkWell(
          onTap: () {
            fileExists && downloading == false
                ? openFile()
                : cancelDownload();
          },
          child: fileExists && downloading == false
              ? Icon(Icons.window,color: appThemeColor,)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                    Text(
                      "Cancel",
                      style: GoogleFonts.lato(fontSize: 8.sp),
                    ),
                    Text(
                      "download",
                      style: GoogleFonts.lato(fontSize: 8.sp),
                    ),
                  ],
                ),
        ),
        trailing: InkWell(
          onTap: () {
            fileExists && downloading == false
                ? print("exit")
                : startDownload();
          },
          child: fileExists
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.save,
                      color: Colors.blue.shade900,
                    ),
                    Text(
                      "Saved",
                      style: GoogleFonts.lato(fontSize: 8.sp),
                    ),
                  ],
                )
              : downloading
                  ? Stack(
            alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 3,
                          backgroundColor: Colors.grey,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "${(progress * 100).toStringAsFixed(2)}%",
                            style: GoogleFonts.lato(fontSize: 8.sp),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.download),
                        Text(
                          "Download",
                          style: GoogleFonts.lato(fontSize: 8.sp),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
