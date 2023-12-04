
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/colorConstants.dart';
import 'TaskDetailPage.dart';

class seeHistory extends StatefulWidget {
  const seeHistory({super.key});

  @override
  State<seeHistory> createState() => _seeHistoryState();
}

class _seeHistoryState extends State<seeHistory> {
  List<String> dateList = ["03 Nov 23", "10 Nov 23", "17 Nov 23"];
  int currentIndex = 0;

  void goForward() {
    if (currentIndex < dateList.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void goBackward() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  Widget DateList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: goBackward,
          child: Icon(Icons.arrow_back_ios, color: Colors.black54),
        ),
        Text(
          dateList[currentIndex],
          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        GestureDetector(
          onTap: goForward,
          child: Icon(Icons.arrow_forward_ios, color: Colors.black54),
        ),
      ],
    );
  }



@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appThemeColor,
        title: Text('Weekly-PM-Vibration-Noise'),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: appThemeColor,
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25)
            ),
            color: Colors.white
        ),

        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Scheduled PMs", style: TextStyle(
                    fontSize: 14.sp, fontWeight: FontWeight.w500),),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 0.5.w),
                      borderRadius: BorderRadius.circular(10)

                  ),
                  width: 100.w,
                  height: 6.h,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Weekly-PM-Vibration-Noise", style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),),
                        Icon(Icons.arrow_drop_down, color: Colors.black54,)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                DateList(),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 100.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 0.4.w),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 9.h,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey
                            ),
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(

                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: Colors.grey
                                    )
                                  )
                                ),
                                width: 45.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Total",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                    Text("2",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500,color: appThemeColor),)
                                  ],
                                ),
                              ),
                              SizedBox(width: 3.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Ok",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                  Text("0",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500,color: appThemeColor),)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 9.h,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Colors.grey
                                        )
                                    )
                                ),
                                width: 45.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Not  Ok",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                    Text("0",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500,color: Colors.redAccent),)
                                  ],
                                ),
                              ),
                              SizedBox(width: 3.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text("On Hold",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                  Text("0",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500,color: Colors.orangeAccent),)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 25.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 0.5.w),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Container(
                        color: appThemeColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("CHECK THE MOTOR MOUNTING",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.white),),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_circle_left_outlined,color: Colors.white,),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Icon(Icons.arrow_circle_right_outlined,color: Colors.white,)
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text("(1 of 2)",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.white),),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Icon(Icons.list,color: Colors.white,)
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Status",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500),),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text("xxx",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Reding",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500),),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text("xxx",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Comments",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500),),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text("0",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: appThemeColor),)
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Photos",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500),),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text("Error",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const taskDetailPage()),
                          );
                        },
                          child: Text("View task Details",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: appThemeColor),))
                    ],
                  ),
                )

              ],
            ),
          ),
        ),

      ),
    );
  }
}

