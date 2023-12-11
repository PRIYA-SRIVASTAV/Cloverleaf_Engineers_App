import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class DocumentListTile extends StatefulWidget {
  var fileUrl ;
  var title;
  DocumentListTile({required this.title,required this.fileUrl,super.key});

  @override
  State<DocumentListTile> createState() => _DocumentListTileState();
}

class _DocumentListTileState extends State<DocumentListTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.h,
      shadowColor: Colors.grey.shade100,
      child: ListTile(
        title: Text(
          widget.title,
          style: GoogleFonts.lato(
              fontSize: 10.sp),
        ),
        trailing: InkWell(
          onTap: () {},
          child: Icon(
            Icons.download,
            color: Colors.blue.shade900,
          ),
        ),
      ),
    );
  }
}
