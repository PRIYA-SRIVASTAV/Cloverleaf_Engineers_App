
import 'package:dmms/Screens/assetsTab/commentScreenPage.dart';
import 'package:dmms/Screens/workOrdersTab/workOrderEdit/workOrderEdit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/colorConstants.dart';

class CardWorkOrderTabDetail extends StatefulWidget {
  const CardWorkOrderTabDetail({super.key});

  @override
  State<CardWorkOrderTabDetail> createState() => _CardWorkOrderTabDetailState();
}

class _CardWorkOrderTabDetailState extends State<CardWorkOrderTabDetail> {

  bool showMore = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appThemeColor,
        title: Text("Work Order",style: TextStyle(color: Colors.white),),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkOrderEditPage()),
                );
              },
                child: Icon(Icons.edit_note,color: Colors.white,size: 20.sp,)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Screw change",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w700,color: Colors.black54),),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                height: showMore ? 30.h : 60.h,
               child:showMore ?
               Container(
          
                    decoration: BoxDecoration(
                        border: Border.all(color: appThemeColor),
                        color: Color(0xE5F0FFFF),
                        borderRadius: BorderRadius.circular(10)
                    ),
          
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Asset",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Text("Automatic Corru..",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Status",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Text("Submitted",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.orangeAccent),)
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Assignee",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Text("Demo",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Supervisor",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Text("Manageer",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Priority",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Text("Low",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Category",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Text("Breakdown",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                        
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      showMore = !showMore;
                                    });
                                  },
                                    child: Text("Show more",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: appThemeColor),)),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Icon(Icons.keyboard_arrow_down,color: appThemeColor,size: 12.sp,)
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                ):
               Container(
          
                   decoration: BoxDecoration(
                       border: Border.all(color: appThemeColor),
                       color: Color(0xE5F0FFFF),
                       borderRadius: BorderRadius.circular(10)
                   ),
          
                   child: Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Asset",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                 SizedBox(
                                   height: 0.5.h,
                                 ),
                                 Text("Automatic Corru..",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                               ],
                             ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Status",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                 SizedBox(
                                   height: 0.5.h,
                                 ),
                                 Text("Submitted",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.orangeAccent),)
                               ],
                             ),
                           ],
                         ),
                         SizedBox(height: 2.h,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Assignee",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                 SizedBox(
                                   height: 0.5.h,
                                 ),
                                 Text("Demo",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                               ],
                             ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Supervisor",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                 SizedBox(
                                   height: 0.5.h,
                                 ),
                                 Text("Manageer",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                               ],
                             ),
                           ],
                         ),
                         SizedBox(height: 2.h,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Priority",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                 SizedBox(
                                   height: 0.5.h,
                                 ),
                                 Text("Low",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                               ],
                             ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Category",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                 SizedBox(
                                   height: 0.5.h,
                                 ),
                                 Text("Breakdown",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                               ],
                             ),
                           ],
                         ),
                         SizedBox(
                           height: 2.h,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Due Date",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                 SizedBox(
                                   height: 0.5.h,
                                 ),
                                 Text("---",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                               ],
                             ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Estimated hours",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                 SizedBox(
                                   height: 0.5.h,
                                 ),
                                 Text("---",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                               ],
                             ),
                           ],
                         ),
                         SizedBox(
                           height: 2.h,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Schedule",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                 SizedBox(
                                   height: 0.5.h,
                                 ),
                                 Text("Once",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                               ],
                             ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Task procedures",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                 SizedBox(
                                   height: 0.5.h,
                                 ),
                                 Text("---",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                               ],
                             ),
                           ],
                         ),
                         SizedBox(
                           height: 2.h,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Parts used",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                 SizedBox(
                                   height: 0.5.h,
                                 ),
                                 Text("---",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                               ],
                             ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Timeline",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                 SizedBox(
                                   height: 0.5.h,
                                 ),
                                 Text("View",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color:appThemeColor),)
                               ],
                             ),
                           ],
                         ),
                         SizedBox(
                           height: 2.h,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Safety Approvers",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                 SizedBox(
                                   height: 0.5.h,
                                 ),
                                 Text("---",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                               ],
                             ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Quality Approvers",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                                 SizedBox(
                                   height: 0.5.h,
                                 ),
                                 Text("---",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),)
                               ],
                             ),
                           ],
                         ),
                         SizedBox(
                           height: 2.h,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             InkWell(
                               onTap: (){
                                 setState(() {
                                   showMore = !showMore;
                                 });
                               },
                                 child: Text("Show less",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: appThemeColor),)),
                             SizedBox(
                               width: 1.w,
                             ),
                             Icon(Icons.keyboard_arrow_up,color: appThemeColor,size: 12.sp,)
                           ],
                         )
                       ],
                     ),
                   )
               ),
              ),
          
          
          
          
              SizedBox(
                height: 5.h,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("View technical summary",style: TextStyle(fontSize: 10.sp,color: Colors.black38,fontWeight: FontWeight.w500),),
                      Icon(Icons.arrow_circle_right_outlined,color: Colors.black38,)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const commentScreenPage()),
                  );
          
                },
                  child: Text("Comments(0)",style: TextStyle(fontSize: 10.sp,color: appThemeColor,fontWeight: FontWeight.w700),))
              
            ],
          ),
        ),
      ),
    );
  }
}
