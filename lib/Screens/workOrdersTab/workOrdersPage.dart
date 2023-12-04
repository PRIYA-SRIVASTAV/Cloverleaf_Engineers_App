
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/colorConstants.dart';
import '../CommonScreen/DrawerNavBar.dart';
import '../assetsTab/cardWorkDetailPage.dart';

class workOrdersPage extends StatefulWidget {
  const workOrdersPage({super.key});

  @override
  State<workOrdersPage> createState() => _workOrdersPageState();
}

class _workOrdersPageState extends State<workOrdersPage> {
  var getResult ='QR Code Result';
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: widget.TabIndex,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Work Orders",
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500,color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  scanQRCode();
                },
                icon: Icon(
                  Icons.qr_code_scanner,
                  size: 20.sp,
                  color: Colors.white,
                )),
          ],
          leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu,color: Colors.white,)),
          ),
          backgroundColor: appThemeColor,
          elevation: 0,
        ),
        drawer: const AppDrawer(),
        backgroundColor: appThemeColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                width: 40.w,
                child: TabBar(
                  labelStyle:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
                  indicator: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(15)),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  tabs: const [
                    Tab(
                      text: "For Me",
                    ),
                    Tab(
                      text: "All",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: Container(
                height: 65.h,
                decoration:  BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TabBarView(
                    children: [
                      // ---------------------------Tab1------------------------
                      Column(
                        children: [
                          Container(
                            child: TextFormField(
                              // onChanged: (value) => _runFilter(value),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black54,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Search WorkOrders",
                                  hintStyle: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1 active workorders",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54),
                              ),
                              Icon(
                                Icons.filter_list_alt,
                                color: appThemeColor,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          DefaultTabController(
                            length: 3,
                            child: Column(
                              children: [
                                Container(
                                  child: TabBar(
                                    labelStyle: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500),
                                    indicator: BoxDecoration(
                                      color: appThemeColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    labelColor: Colors.white,
                                    unselectedLabelColor: Colors.black54,
                                    tabs: const [
                                      Tab(
                                        text: "All",
                                      ),
                                      Tab(
                                        text: "Today",
                                      ),
                                      Tab(
                                        text: "Past Due",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      decoration:
                                           BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade400,
                                            blurRadius: 5
                                        ),
                                      ]),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const CardWorkOrderTabDetail()),
                                          );
                                        },
                                        child:Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                          ),
                                          elevation: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets.all(3.0),
                                                        child: Center(
                                                            child: Text(
                                                              // _fondWorkOrders[index]['workId'].toString(),
                                                              "#145",
                                                              style: TextStyle(
                                                                  color: Colors.blue,
                                                                  fontSize: 10.sp),
                                                            )),
                                                      ),
                                                      width: 15.w,
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFB2D9FF),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15.w,
                                                    ),
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons.clean_hands_outlined,color:Color(0xFFB2D9FF) ,),
                                                          SizedBox(
                                                            width: 2.w,
                                                          ),
                                                          Text(
                                                            // _fondWorkOrders[index]['workId'].toString(),
                                                            "Folder Gluer,Flute Laminator"
                                                            ,style: TextStyle(
                                                                color: Colors.black54,
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                FontWeight.w500),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                  // _fondWorkOrders[index]['problemName'],
                                                  "Pump Problem",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w700),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Category",
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                              FontWeight.w700,color: Colors.black87),
                                                        ),
                                                        SizedBox(
                                                          height: 0.5.h,
                                                        ),
                                                        Text(
                                                          // _fondWorkOrders[index]['category'],
                                                          "Breakdown",
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
                                                              fontWeight: FontWeight.w500,
                                                              color: Colors.black54),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Priority",
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                              FontWeight.w700,color: Colors.black87),
                                                        ),
                                                        SizedBox(
                                                          height: 0.5.h,
                                                        ),
                                                        Text(
                                                          // _fondWorkOrders[index]['priority'],
                                                          "Low",
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
                                                              fontWeight: FontWeight.w500,
                                                              color: appThemeColor),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 17),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "Status",
                                                            style: TextStyle(
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                FontWeight.w700,color: Colors.black87),
                                                          ),
                                                          SizedBox(
                                                            height: 0.5.h,
                                                          ),
                                                          Text(
                                                            // _fondWorkOrders[index]['status'],
                                                            "Submitted",
                                                            style: TextStyle(
                                                                fontSize: 10.sp,
                                                                fontWeight: FontWeight.w500,
                                                                color: Colors.orangeAccent),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Requested by",
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                              FontWeight.w700,color: Colors.black87),
                                                        ),
                                                        SizedBox(
                                                          height: 0.5.h,
                                                        ),
                                                        Text(
                                                          // _fondWorkOrders[index]['requestedBy'],
                                                          "Engineer1",
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
                                                              fontWeight: FontWeight.w500,
                                                              color: Colors.black54),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 15),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "Assign",
                                                            style: TextStyle(
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                FontWeight.w700,color: Colors.black87),
                                                          ),
                                                          SizedBox(
                                                            height: 0.5.h,
                                                          ),
                                                          Text(
                                                            // _fondWorkOrders[index]['assign'],
                                                            "Demo",
                                                            style: TextStyle(
                                                                fontSize: 10.sp,
                                                                fontWeight: FontWeight.w500,
                                                                color: Colors.black54),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 16),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "Supervisor",
                                                            style: TextStyle(
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                FontWeight.w700,color: Colors.black87),
                                                          ),
                                                          SizedBox(
                                                            height: 0.5.h,
                                                          ),
                                                          Text(
                                                            // _fondWorkOrders[index]['supervisor'],
                                                            "Manager",
                                                            style: TextStyle(
                                                                fontSize: 10.sp,
                                                                fontWeight: FontWeight.w500,
                                                                color: Colors.black54),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Created On",
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                              FontWeight.w700,color: Colors.black87),
                                                        ),
                                                        SizedBox(
                                                          height: 0.5.h,
                                                        ),
                                                        Text(
                                                          // _fondWorkOrders[index]['createdOn'],
                                                          "19-10-2023",
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
                                                              fontWeight: FontWeight.w500,
                                                              color: Colors.black54),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Due Date",
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                              FontWeight.w700,color: Colors.black87),
                                                        ),
                                                        SizedBox(
                                                          height: 0.5.h,
                                                        ),
                                                        Text(
                                                          // _fondWorkOrders[index]['dueDate'],
                                                          "Invalid Date",
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
                                                              fontWeight: FontWeight.w500,
                                                              color: Colors.black54),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Submitted On",
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                              FontWeight.w700,color: Colors.black87),
                                                        ),
                                                        SizedBox(
                                                          height: 0.5.h,
                                                        ),
                                                        Text(
                                                          // _fondWorkOrders[index]['submittedOn '].toString(),
                                                          "19-10-2023",
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
                                                              fontWeight: FontWeight.w500,
                                                              color: Colors.black54),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //  ----------------------------Tab2------------------------
                      Column(
                        children: [
                          Container(
                            child: TextFormField(
                              // onChanged: (value) => _runFilter(value),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.search, color: Colors.black54),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Search Work Order",
                                  hintStyle: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "22 active workorders",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54),
                              ),
                              Icon(
                                Icons.filter_list_alt,
                                color: appThemeColor,
                                size: 20.sp,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          DefaultTabController(
                            length: 3,
                            child: Container(
                              // color: Colors.red,
                              height: 55.h,
                              child: Column(
                                children: [
                                  Container(
                                    child: TabBar(
                                      labelStyle: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500),
                                      indicator: BoxDecoration(
                                          color: appThemeColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      labelColor: Colors.white,
                                      unselectedLabelColor: Colors.black54,
                                      tabs: const [
                                        Tab(
                                          text: "All",
                                        ),
                                        Tab(
                                          text: "Today",
                                        ),
                                        Tab(
                                          text: "Past Due",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),

                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void scanQRCode() async{
    try{
      final qrCode =  await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);

      if(!mounted) return;

      setState(() {
        getResult=qrCode;
      });

      print("QRCode_Result:--");
      print(qrCode);
    }on PlatformException{
      getResult = 'Failed to scan QR Code.';
    }
  }
}
