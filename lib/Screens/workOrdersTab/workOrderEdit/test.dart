import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/colorConstants.dart';

class WorkOrderEditPage extends StatefulWidget {
  const WorkOrderEditPage({super.key});

  @override
  State<WorkOrderEditPage> createState() => _WorkOrderEditState();
}

class _WorkOrderEditState extends State<WorkOrderEditPage> {
  TextEditingController pStatementContainer = TextEditingController();

  bool? isChecked = true;
  String dropdownvalue = 'Excellence Series-BHT-1650FC';

  var items = [
    'Excellence Series-BHT-1650FC',
    'Printer Slotter with rotary diecutter',
    'Flute Laminator',
    'Offset Printing machine',
    'Flat bed Diecutter',
  ];

  String categoryvalue = 'Breakdown';

  var categoryitems = [
    'Breakdown',
    'Preventive',
    'Inspection',
    'Safety',
    'Service Request',
    'Measurement',
  ];

  String schedulevalue = 'Once';

  var scheduleitems = [
    'Once',
  ];

  String priorityvalue = 'High';

  var priorityitems = [
    'Low',
    'Medium',
    'High'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appThemeColor,
        title: Text("Update Work Order",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w700,color: Colors.white),),
        leading: Icon(Icons.arrow_back_ios,color: Colors.white,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text("Update",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w700,color: Colors.white),),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: (
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios,color: appThemeColor,size: 20.sp,),
                      Text("Basic",style: TextStyle(fontSize: 14.sp,color: Colors.black87,fontWeight:FontWeight.w700),),
                      Icon(Icons.arrow_forward_ios_outlined,size: 20.sp,color: appThemeColor,)
                    ],
                  ),
                  SizedBox(height: 3.h,),
                  Text("Problem Statement",style: TextStyle(fontSize: 12.sp,color: Colors.black87,fontWeight: FontWeight.w500),),
                  SizedBox(height: 1.h,),
                  TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.black87,
                              width: 2.0,
                            ),
                          ),
                          hintText: "Testing date ( 22/11/2023 )",
                          hintStyle: const TextStyle(color: Colors.black54,fontWeight: FontWeight.w700),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.black87,
                              width: 2.0,
                            ),
                          )
                      )

                  ),
                  SizedBox(height: 2.h,),
                  Text("Asset",style: TextStyle(fontSize: 12.sp,color: Colors.black87,fontWeight: FontWeight.w500),),
                  SizedBox(height: 1.h,),
                  Container(
                    width: 100.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade300,
                    ),
                    child: DropdownButton(
                      isExpanded: true,

                      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.h),
                      dropdownColor: Colors.grey,
                      // Initial Value
                      value: dropdownvalue,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down, textDirection: TextDirection.ltr),
                      // Array list of items
                      items: items.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      // After selecting the desired option, it will
                      // change the button value to the selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Text("Category",style: TextStyle(fontSize: 12.sp,color: Colors.black87,fontWeight: FontWeight.w500),),
                  SizedBox(height: 1.h,),
                  Container(
                    width: 100.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade300,
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.h),
                      dropdownColor: Colors.grey,
                      // Initial Value
                      value: categoryvalue,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down, textDirection: TextDirection.ltr),
                      // Array list of items
                      items: categoryitems.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      // After selecting the desired option, it will
                      // change the button value to the selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          categoryvalue = newValue!; // Fix: Assign to categoryvalue, not categoryitems
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  Row(
                    children: [
                      Checkbox(
                        tristate: true,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value;
                          });
                        },
                      ),
                      SizedBox(width: 1.w,),
                      Text("opt for manual input of downtime by technicians",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black87),),


                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Text("Schedule",style: TextStyle(fontSize: 12.sp,color: Colors.black87,fontWeight: FontWeight.w500),),
                  SizedBox(height: 1.h,),
                  Container(
                    width: 100.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade300,
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.h),
                      dropdownColor: Colors.grey.shade200,
                      // Initial Value
                      value: schedulevalue,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down, textDirection: TextDirection.ltr),
                      // Array list of items
                      items: scheduleitems.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      // After selecting the desired option, it will
                      // change the button value to the selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          schedulevalue = newValue!; // Fix: Assign to categoryvalue, not categoryitems
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Text("Priority",style: TextStyle(fontSize: 12.sp,color: Colors.black87,fontWeight: FontWeight.w500),),
                  SizedBox(height: 1.h,),
                  Container(
                    width: 100.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade300,
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.h),
                      dropdownColor: Colors.grey.shade200,
                      // Initial Value
                      value: priorityvalue,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down, textDirection: TextDirection.ltr),
                      // Array list of items
                      items: priorityitems.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      // After selecting the desired option, it will
                      // change the button value to the selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          priorityvalue = newValue!; // Fix: Assign to categoryvalue, not categoryitems
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Text("Estimated Hours",style: TextStyle(fontSize: 12.sp,color: Colors.black87,fontWeight: FontWeight.w500),),
                  SizedBox(height: 1.h,),
                  TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.black87,
                              width: 2.0,
                            ),
                          ),
                          hintText: "1:2",
                          hintStyle: const TextStyle(color: Colors.black54,fontWeight: FontWeight.w700),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.black87,
                              width: 2.0,
                            ),
                          )
                      )

                  ),
                  SizedBox(height: 2.h,),
                  Text("Due Date",style: TextStyle(fontSize: 12.sp,color: Colors.black87,fontWeight: FontWeight.w500),),
                  SizedBox(height: 1.h,),
                  TextField(
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.black87,
                            width: 2.0,
                          ),
                        ),
                        hintText: "25/11/2023",
                        hintStyle: const TextStyle(color: Colors.black54,fontWeight: FontWeight.w700),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.black87,
                            width: 2.0,
                          ),
                        ),
                        suffixIcon: Icon(Icons.calendar_month)
                    ),

                  ),
                  SizedBox(height: 2.h,),
                  Text("Description",style: TextStyle(fontSize: 12.sp,color: Colors.black87,fontWeight: FontWeight.w500),),
                  SizedBox(height: 1.h,),
                  TextField(

                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.black87,
                          width: 2.0,
                        ),
                      ),
                      hintText: "Testing",
                      hintStyle: const TextStyle(color: Colors.black54,fontWeight: FontWeight.w700),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.black87,
                          width: 2.0,
                        ),
                      ),
                      // suffixIcon: Icon(Icons.calendar_month)
                    ),

                  ),

                ],
              )
          ),
        ),
      ),
    );
  }
}
