import 'package:dmms/Constants/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class commentScreenPage extends StatefulWidget {
  const commentScreenPage({super.key});

  @override
  State<commentScreenPage> createState() => _commentScreenPageState();
}

class _commentScreenPageState extends State<commentScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
              child: Icon(Icons.arrow_back_ios)),
          title: Text("Comments",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
          backgroundColor: appThemeColor,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
          body: Container(
            height: 100.h,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Center(
                      child: Text(
                        "No Comments",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.black54),
                TextFormField(cursorColor: appThemeColor,
                  decoration: InputDecoration(
                    focusColor: appThemeColor,
                    hintText: "Add a comment",
                    suffixIcon: InkWell(
                      onTap: (){},
                        child: Icon(Icons.send, color: appThemeColor)),
                  ),
                ),
              ],
            ),
          )

      ),
    );
  }
}
