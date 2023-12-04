import 'package:flutter/material.dart';

import '../../Constants/colorConstants.dart';
import 'package:sizer/sizer.dart';
class newWorkOrderForm extends StatefulWidget {
  const newWorkOrderForm({super.key});

  @override
  State<newWorkOrderForm> createState() => _newWorkOrderFormState();
}

class _newWorkOrderFormState extends State<newWorkOrderForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: appThemeColor,
          title: Text(
            "New Work Order",
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500,color: Colors.white),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Center(
                  child: InkWell(
                    onTap: (){},
                    child: Text(
                "Create",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500,color: Colors.white),
              ),
                  )),
            )
          ],
        ),
        backgroundColor: appThemeColor,
        body: Container(
          width: 100.w,
          height: 100.h,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios,color: appThemeColor,),
                    Text("Basic",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                    Icon(Icons.arrow_forward_ios_outlined,color: appThemeColor,)
                  ],
                ),
                SizedBox(height: 4.h,),
                Text("Problem Statement",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                SizedBox(height: 2.h,),
                TextFormField(
                  decoration: InputDecoration(
                    // label: Text("Enter Your name",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: "Enter The Problem Statement",
                    suffixIcon: Icon(Icons.mic,color: Colors.blue,)

                  ),
                ),
                SizedBox(height: 4.h,),
                Text("Asset",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                SizedBox(height: 2.h,),
                Container(
                  height: 7.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Select an asset",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black54),),
                        Icon(Icons.keyboard_arrow_down,color: Colors.black54,)
                      ],
                    ),
                  ),
                  
                ),
                SizedBox(height: 4.h,),
                Text("Description",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                SizedBox(height: 2.h,),
                TextFormField(
                  decoration: InputDecoration(
                    // label: Text("Enter Your name",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: "Enter The Problem Description",


                  ),
                ),

              ],
            ),
          ),
        ));
  }
}
