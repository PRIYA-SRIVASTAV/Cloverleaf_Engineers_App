// import 'package:daacoworks/Constants/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/colorConstants.dart';

class AddNewPmBtnPage extends StatefulWidget {
  const AddNewPmBtnPage({super.key});

  @override
  State<AddNewPmBtnPage> createState() => _AddNewPmBtnPageState();
}

class _AddNewPmBtnPageState extends State<AddNewPmBtnPage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appThemeColor,
        title: Text("Add New PM Schedule",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15.sp),),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);

          },
          child: Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),
      ),
      backgroundColor: appThemeColor,
      body:Container(
        height: 100.h,
        width: 100.w,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          color: Colors.grey.shade200

        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 50.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                              width: 100.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black54),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Select a PM Schedule",style: TextStyle(fontSize: 12.sp,color: Colors.black87,fontWeight: FontWeight.w500),),
                                    Icon(Icons.arrow_drop_down,color: Colors.black87,)
                                  ],
                                ),
                              )
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text("#Tasks: 0",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500),),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 40.w,
                          height: 5.h,
                          child: ElevatedButton(onPressed: (){
                            Navigator.pop(context);
                          },
                              style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                    width: 1,
                                    color: Colors.redAccent,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  backgroundColor: Color(0xFFDBE1E1),
                              ),
                              child: Text("Cancel",style: TextStyle(color: Colors.redAccent,fontSize: 12.sp,fontWeight: FontWeight.w500),)),
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        SizedBox(
                          width: 40.w,
                          height: 5.h,
                          child: ElevatedButton(onPressed: (){},
                              style: ElevatedButton.styleFrom(

                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  backgroundColor: Colors.grey
                              ),
                              child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 12.sp,fontWeight: FontWeight.w500),)),
                        ),

                      ],
                    )
                  ],
                ),
              ),
              

            ],
          ),
        ),
      )
    );
  }
}
