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
  int currentStep = 0; // Add a variable to track the current step

  var items = [
    'Excellence Series-BHT-1650FC',
    'Printer Slotter with rotary die-cutter',
    'Flute Laminator',
    'Offset Printing machine',
    'Flat bed Die-cutter',
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
    'High',
  ];

  String assetToValue = 'Demo Cloverleaf Global';
  var assetToItems = [
    'TeslaEng2 t',
    'Engineer2 Packaging',
    'Demo Cloverleaf Global',
    'TeslaM Manager',
    'TeslaEng1 Eng1',
    'Admin Cloverleaf',
    'Engineer Packaging',
    'Manager Cloverleaf'
  ];

  String supervisiorValue = 'Manager Cloverleaf';
  var superisiorItem = [
    'TeslaM Manager',
    'Admin Cloverleaf',
    'Manager Cloverleaf'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appThemeColor,
        title: Text(
          "Update Work Order",
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              "Update",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios,
                        color: appThemeColor, size: 20.sp),
                    onPressed: () {
                      if (currentStep > 0) {
                        setState(() {
                          currentStep--;
                        });
                      }
                    },
                  ),
                  Text(
                    "Step $currentStep",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios_outlined,
                        size: 20.sp, color: appThemeColor),
                    onPressed: () {
                      if (currentStep < 3) {
                        setState(() {
                          currentStep++;
                        });
                      }
                    },
                  )
                ],
              ),
              SizedBox(height: 3.h),
              // Add your form sections here, and conditionally show/hide them based on the currentStep
              if (currentStep == 0) ...[
                // Form for Step 0
                SingleChildScrollView(
                  child: (Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        "Problem Statement",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.black54,
                                  width: 2.0,
                                ),
                              ),
                              hintText: "Testing date ( 22/11/2023 )",
                              hintStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.black54,
                                  width: 2.0,
                                ),
                              ))),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Asset",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: 100.w,
                        height: 7.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.shade200,
                          border: Border.all(color: Colors.black54, width: 2.0),
                        ),
                        child: DropdownButton(
                          isExpanded: true,

                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 4.h),
                          dropdownColor: Colors.grey.shade200,
                          // Initial Value
                          value: dropdownvalue,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down,
                              textDirection: TextDirection.ltr),
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
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Category",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: 100.w,
                        height: 7.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade200,
                            border:
                                Border.all(color: Colors.black54, width: 2.0)),
                        child: DropdownButton(
                          isExpanded: true,
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 4.h),
                          dropdownColor: Colors.grey.shade200,
                          // Initial Value
                          value: categoryvalue,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down,
                              textDirection: TextDirection.ltr),
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
                              categoryvalue =
                                  newValue!; // Fix: Assign to categoryvalue, not categoryitems
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
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
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            "opt for manual input of downtime by technicians",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Schedule",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: 100.w,
                        height: 7.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade200,
                            border:
                                Border.all(color: Colors.black54, width: 2.0)),
                        child: DropdownButton(
                          isExpanded: true,
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 4.h),
                          dropdownColor: Colors.grey.shade200,
                          // Initial Value
                          value: schedulevalue,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down,
                              textDirection: TextDirection.ltr),
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
                              schedulevalue =
                                  newValue!; // Fix: Assign to categoryvalue, not categoryitems
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Priority",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: 100.w,
                        height: 7.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade200,
                            border:
                                Border.all(color: Colors.black54, width: 2.0)),
                        child: DropdownButton(
                          isExpanded: true,
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 4.h),
                          dropdownColor: Colors.grey.shade200,
                          // Initial Value
                          value: priorityvalue,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down,
                              textDirection: TextDirection.ltr),
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
                              priorityvalue =
                                  newValue!; // Fix: Assign to categoryvalue, not categoryitems
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Estimated Hours",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.black54,
                                  width: 2.0,
                                ),
                              ),
                              hintText: "1:2",
                              hintStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.black87,
                                  width: 2.0,
                                ),
                              ))),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Due Date",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.black54,
                                width: 2.0,
                              ),
                            ),
                            hintText: "25/11/2023",
                            hintStyle: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.black87,
                                width: 2.0,
                              ),
                            ),
                            suffixIcon: Icon(Icons.calendar_month)),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.black54,
                              width: 2.0,
                            ),
                          ),
                          hintText: "Testing",
                          hintStyle: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w700),
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
                  )),
                ),
                // Rest of the widgets for Step 0
              ] else if (currentStep == 1) ...[
                // Form for Step 1
                SingleChildScrollView(
                  child: (Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        "Asset To",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: 100.w,
                        height: 7.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.shade200,
                          border: Border.all(color: Colors.black54, width: 2.0),
                        ),
                        child: DropdownButton(
                          isExpanded: true,

                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 4.h),
                          dropdownColor: Colors.grey.shade200,
                          // Initial Value
                          value: assetToValue,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down,
                              textDirection: TextDirection.ltr),
                          // Array list of items
                          items: assetToItems.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          // After selecting the desired option, it will
                          // change the button value to the selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              assetToValue = newValue!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Supervisor",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        width: 100.w,
                        height: 7.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.shade200,
                          border: Border.all(color: Colors.black54, width: 2.0),
                        ),
                        child: DropdownButton(
                          isExpanded: true,

                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 4.h),
                          dropdownColor: Colors.grey.shade200,
                          // Initial Value
                          value: supervisiorValue,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down,
                              textDirection: TextDirection.ltr),
                          // Array list of items
                          items: superisiorItem.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          // After selecting the desired option, it will
                          // change the button value to the selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              supervisiorValue = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  )),
                ),
                // Rest of the widgets for Step 1
              ] else if (currentStep == 2) ...[
                // Form for Step 2
                Container()
              ] else if (currentStep == 3) ...[
                // Form for Step 2
                SingleChildScrollView(
                  child: (Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        "Asset",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: 100.w,
                        height: 7.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.shade200,
                          border: Border.all(color: Colors.black54, width: 2.0),
                        ),
                        child: DropdownButton(
                          isExpanded: true,

                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 4.h),
                          dropdownColor: Colors.grey.shade200,
                          // Initial Value
                          value: dropdownvalue,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down,
                              textDirection: TextDirection.ltr),
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

                    ],
                  )),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
