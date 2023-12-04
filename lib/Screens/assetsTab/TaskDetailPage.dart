
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/colorConstants.dart';

class taskDetailPage extends StatefulWidget {
  const taskDetailPage({super.key});

  @override
  State<taskDetailPage> createState() => _taskDetailPageState();
}

class _taskDetailPageState extends State<taskDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Task Details"),
        backgroundColor: appThemeColor,
      ),
      backgroundColor: appThemeColor,
      body: Container(
        height: 100.h,
        width: 100.w,

        decoration:const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),

          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("1.Objective",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text("ENSURE NO LOOSE",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("2.Instructions",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text("BY TOOLS",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("3.Expected results",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text("Ok",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("4.Action if failed",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text("Correct it",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
