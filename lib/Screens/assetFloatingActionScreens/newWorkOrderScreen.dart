import 'package:flutter/material.dart';

import '../../Constants/colorConstants.dart';
import 'package:sizer/sizer.dart';

import 'newWorkOrderForm.dart';
class newWorkOrderFloatBtn extends StatefulWidget {
  const newWorkOrderFloatBtn({super.key});

  @override
  State<newWorkOrderFloatBtn> createState() => _newWorkOrderFloatBtnState();
}

class _newWorkOrderFloatBtnState extends State<newWorkOrderFloatBtn> {
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
              child: Center(child: Text("Create",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500,color: Colors.white),)),
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: 2.h,),
                  Text("Select what can be there in your work order form",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                  SizedBox(height: 4.h,),
                  Text("Basic",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                  SizedBox(height: 2.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 20.w,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/b1.jpeg'),
                            ),
                          ),
                          SizedBox(height: 0.5.h,),
                          Text("Asset",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                        ],
                      ),

                      Column(
                        children: [
                          SizedBox(
                            width: 20.w,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/b2.jpeg'),
                            ),
                          ),
                          SizedBox(height: 0.5.h,),
                          Text("Category",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 20.w,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/b3.jpeg'),
                            ),
                          ),
                          SizedBox(height: 0.5.h,),
                          Text("Priority",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 20.w,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/b4.png'),
                            ),
                          ),
                          SizedBox(height: 0.5.h,),
                          Text("Description",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                        ],
                      ),

                      Column(
                        children: [
                          SizedBox(
                            width: 20.w,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/b6.png'),
                            ),
                          ),
                          SizedBox(height: 0.5.h,),
                          Text("Schedule",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 20.w,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/b7.jpeg'),
                            ),
                          ),
                          SizedBox(height: 0.5.h,),
                          Text("Due Date",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 20.w,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/b10.jpeg'),
                            ),
                          ),
                          SizedBox(height: 0.5.h,),
                          Text("Estimated Hours",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                        ],
                      ),

                    ],
                  ),
                  SizedBox(height: 4.h,),
                  Text("Owners",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                  SizedBox(height: 2.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 20.w,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/o2.jpeg'),
                            ),
                          ),
                          SizedBox(height: 0.5.h,),
                          Text("Assignee",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                        ],
                      ),

                      Column(
                        children: [
                          SizedBox(
                            width: 20.w,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/o3.jpeg'),
                            ),
                          ),
                          SizedBox(height: 0.5.h,),
                          Text("Supervisor",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 20.w,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/o4.jpeg'),
                            ),
                          ),
                          SizedBox(height: 0.5.h,),
                          Text("Safety Approvers",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 20.w,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/o5.jpeg'),
                            ),
                          ),
                          SizedBox(height: 0.5.h,),
                          Text("Quality Approvers",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                        ],
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text("Additional preferences",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                  SizedBox(height: 2.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 20.w,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/o6.jpeg'),
                            ),
                          ),
                          SizedBox(height: 0.5.h,),
                          Text("Photos",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                        ],
                      ),

                      Column(
                        children: [
                          SizedBox(
                            width: 20.w,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/o7.jpeg'),
                            ),
                          ),
                          SizedBox(height: 0.5.h,),
                          Text("Task Procedure",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 20.w,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/o9.jpeg'),
                            ),
                          ),
                          SizedBox(height: 0.5.h,),
                          Text("Bill of Materials",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            // return SignUpPage();
                            return newWorkOrderForm();
                          })
                      );
                    },

                    child: Container(
                      width: 100.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: appThemeColor,
                        borderRadius: BorderRadius.circular(6)
                      ),
                      child: Center(child: Text("Next",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.white),)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
