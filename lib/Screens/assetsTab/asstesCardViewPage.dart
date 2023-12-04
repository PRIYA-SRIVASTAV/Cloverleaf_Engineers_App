import 'package:dmms/Screens/assetsTab/seeHistoryPmWorkTabPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/colorConstants.dart';
import '../CommonScreen/floatingActionBtn.dart';
import 'addNewPm-page.dart';
import 'cardWorkDetailPage.dart';

class AssetCardViewPage extends StatefulWidget {
  var TabIndex;
  AssetCardViewPage({required this.TabIndex, super.key});

  @override
  State<AssetCardViewPage> createState() => _AssetCardViewPageState();
}

class _AssetCardViewPageState extends State<AssetCardViewPage> {

  // -----------------------------Searching Functionality---------------------
  final List<Map<String, dynamic>> _allWorkOrders = [

    {
      "workId":156,
      "problemName":"Screw change",
      "category":"Breakdown",
      "priority":"Low",
      "status":"Submitted",
      "requestedBy":"Engineer 1",
      "assign":"Demo",
      "supervisor":"Manager",
      "createdOn":"19-10-2023",
      "dueDate":"Invalid Date",
      "submittedOn":"19-10-2023"
    },
    {
      "workId":157,
      "problemName":"Test",
      "category":"Breakdown",
      "priority":"Low",
      "status":"Submitted",
      "requestedBy":"Engineer 1",
      "assign":"Demo",
      "supervisor":"Manager",
      "createdOn":"19-10-2023",
      "dueDate":"Invalid Date",
      "submittedOn":"19-10-2023"
    }

  ];

  List<Map<String,dynamic>>_fondWorkOrders =[];
  @override
  void initState(){
    _fondWorkOrders = _allWorkOrders;
  }

  void _runFilter(String enteredKeyWords){
    List<Map<String,dynamic>> results=[];
    if(enteredKeyWords.isEmpty){
      results =Text("No data Available",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w700),) as List<Map<String, dynamic>>;
    }
    else{
      results = _allWorkOrders
          .where((user) => user["problemName"].toLowerCase().contains(enteredKeyWords.toLowerCase()))
          .toList();
    }

    setState((){
      _fondWorkOrders = results;
    });

  }

  // -------------------------------------------------------------------------
  String TapToExpandIt = 'Purchase Info';
  bool isExpanded = true;
  bool isExpanded2 = true;
  bool isExpanded3 = true;
  Widget purchaseContainer(){
    return Container(
      height: 20.h,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date Of Manufacturing",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                    SizedBox(height: 1.h,),
                    Text("02 oct 2023",style: TextStyle(fontSize: 8.sp,fontWeight: FontWeight.w500,color: Colors.black54),),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Type of Purchase",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                    SizedBox(height: 1.h,),
                    Text("New",style: TextStyle(fontSize: 8.sp,fontWeight: FontWeight.w500,color: Colors.black54),),
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
                    Text("Date Of purchase",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                    SizedBox(height: 1.h,),
                    Text("16 oct 2023",style: TextStyle(fontSize: 8.sp,fontWeight: FontWeight.w500,color: Colors.black54),),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text("Purchase Price",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                    // SizedBox(height: 1.h,),
                    // Text("New",style: TextStyle(fontSize: 8.sp,fontWeight: FontWeight.w500,color: Colors.black54),),
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
                    Text("Present alue",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                    // SizedBox(height: 1.h,),
                    // Text("02 oct 2023",style: TextStyle(fontSize: 8.sp,fontWeight: FontWeight.w500,color: Colors.black54),),
                  ],
                ),

                Column(
                  children: [
                    Text("End Of Life(in years)",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                    // SizedBox(height: 1.h,),
                    // Text("New",style: TextStyle(fontSize: 8.sp,fontWeight: FontWeight.w500,color: Colors.black54),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget serviceInfoContainer(){
    return Container(
      // height: 22.h,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Last Service Date",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                    SizedBox(height: 0.5.h,),
                    Text("02 oct 2023",style: TextStyle(fontSize: 8.sp,fontWeight: FontWeight.w500,color: Colors.black54),),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("New Service Date",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                    SizedBox(height: 0.5.h,),
                    Text("New",style: TextStyle(fontSize: 8.sp,fontWeight: FontWeight.w500,color: Colors.black54),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 1.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Warranty End Date",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                    // SizedBox(height: 1.h,),
                    // Text("02 oct 2023",style: TextStyle(fontSize: 8.sp,fontWeight: FontWeight.w500,color: Colors.black54),),
                  ],
                ),

                Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text("AMC End Date",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w700,color: Colors.black87),),
                    ),
                    // SizedBox(height: 1.h,),
                    // Text("New",style: TextStyle(fontSize: 8.sp,fontWeight: FontWeight.w500,color: Colors.black54),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget documentContainer(){
    return Container(
      height: 9.9.h,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.file_copy_outlined,size: 25.sp,),
            SizedBox(width: 2.w,),
            Text("Document Name",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.sp,color: Colors.black54),)

          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: widget.TabIndex,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.h,
          backgroundColor: appThemeColor,
          title: Text("Automatic Corrugator",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        ),
        backgroundColor: appThemeColor,
        body: Column(
          children: [
            TabBar(
              labelStyle:
                  TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
              indicator: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15)),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              tabs: const [
                Tab(
                  text: "Details",
                ),
                Tab(
                  text: "Work Orders",
                ),
                Tab(
                  text: "PM Work",
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: Container(
                decoration:  BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.0),
                        topLeft: Radius.circular(25.0))),
                child: TabBarView(
                  children: [
                    // ----------------------------Tab1--------------------------------------------
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 2.h,vertical: 2.h),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  'assets/images/asset_4.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width: 100.w,
                              height: 20.h,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black38)),
                              child: Padding(
                                padding: EdgeInsets.only(top: 2.h,left: 4.w,right: 4.w,bottom:3.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Serial Number",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87),
                                            ),
                                            Text(
                                              "531578",
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
                                              "Category",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87),
                                            ),
                                            Text(
                                              "Automatic",
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
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
                                              "Type",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87),
                                            ),
                                            Text(
                                              "Automatic",
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
                                              "Facility",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87),
                                            ),
                                            Text(
                                              "Shopfloor",
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      "Description",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),

                                    InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          setState(() {
                                            isExpanded = !isExpanded;
                                          });
                                        },
                                        child:
                                            AnimatedContainer(
                                              height: isExpanded ? 5.h : 25.52.h,
                                              duration: Duration(milliseconds: 100),
                                              decoration: BoxDecoration(
                                                color: Color(0xFFB2D9FF).withOpacity(1),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(isExpanded ? 10 : 0),
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Purchase Info",
                                                          style: TextStyle(
                                                            color: Colors.black54,
                                                            fontSize: 12.sp,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                        Icon(
                                                          isExpanded
                                                              ? Icons.keyboard_arrow_down
                                                              : Icons.keyboard_arrow_up,
                                                          color: Colors.black54,
                                                          size: 15.sp,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  isExpanded ? SizedBox() : SizedBox(height: 5),
                                                  AnimatedCrossFade(
                                                    firstChild: Text(
                                                      '',
                                                      style: TextStyle(
                                                        fontSize: 0,
                                                      ),
                                                    ),
                                                    secondChild:
                                                    purchaseContainer(),
                                                    crossFadeState: isExpanded
                                                        ? CrossFadeState.showFirst
                                                        : CrossFadeState.showSecond,
                                                    duration: Duration(milliseconds: 200),
                                                  ),
                                                ],
                                              ),
                                            )
                                    ),
                                    SizedBox(height: 2.h,),
                                    InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          setState(() {
                                            isExpanded2 = !isExpanded2;
                                          });
                                        },
                                        child:
                                        AnimatedContainer(
                                          height: isExpanded2 ? 5.h : 15.9.h,
                                          duration: Duration(milliseconds: 100),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFB2D9FF).withOpacity(1),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(isExpanded2 ? 10 : 0),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Service Info",
                                                      style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 12.sp,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                    Icon(
                                                      isExpanded2
                                                          ? Icons.keyboard_arrow_down
                                                          : Icons.keyboard_arrow_up,
                                                      color: Colors.black54,
                                                      size: 15.sp,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              isExpanded2 ? SizedBox() : SizedBox(height: 5),
                                              AnimatedCrossFade(
                                                firstChild: Text(
                                                  '',
                                                  style: TextStyle(
                                                    fontSize: 0,
                                                  ),
                                                ),
                                                secondChild:
                                                serviceInfoContainer(),
                                                crossFadeState: isExpanded2
                                                    ? CrossFadeState.showFirst
                                                    : CrossFadeState.showSecond,
                                                duration: Duration(milliseconds: 200),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                    SizedBox(height: 2.h,),
                                    InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          setState(() {
                                            isExpanded3 = !isExpanded3;
                                          });
                                        },
                                        child:
                                        AnimatedContainer(
                                          height: isExpanded3 ? 5.h : 15.6.h,
                                          duration: Duration(milliseconds: 100),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFB2D9FF).withOpacity(1),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(isExpanded3 ? 10 : 0),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Documents",
                                                      style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 12.sp,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                    Icon(
                                                      isExpanded3
                                                          ? Icons.keyboard_arrow_down
                                                          : Icons.keyboard_arrow_up,
                                                      color: Colors.black54,
                                                      size: 15.sp,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              isExpanded3 ? SizedBox() : SizedBox(height: 5),
                                              AnimatedCrossFade(
                                                firstChild: const Text(
                                                  '',
                                                  style: TextStyle(
                                                    fontSize: 0,
                                                  ),
                                                ),
                                                secondChild:
                                                documentContainer(),
                                                crossFadeState: isExpanded3
                                                    ? CrossFadeState.showFirst
                                                    : CrossFadeState.showSecond,
                                                duration: Duration(milliseconds: 200),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    //-----------------------------Tab2--------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 10,left: 15,right: 15),
                      child: Column(
                        children: [
                          TextFormField(
                            onChanged: (value) => _runFilter(value),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.black54,
                                    width: 2.0,
                                  ),
                                ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.black54,
                                  width: 2.0,
                                ),
                              ),
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
                                Icons.filter_list_rounded,
                                color: appThemeColor,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount:_fondWorkOrders.length,
                              itemBuilder:(context,index){
                               return Container(
                                  decoration: new BoxDecoration(boxShadow: [
                                    new BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        blurRadius: 5.0),
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
                                    child: Card(
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
                                                          _fondWorkOrders[index]['workId'].toString(),
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
                                                        _fondWorkOrders[index]['workId'].toString(),
                                                        style: TextStyle(
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
                                              _fondWorkOrders[index]['problemName'],
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
                                                      _fondWorkOrders[index]['category'],
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
                                                      _fondWorkOrders[index]['priority'],
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
                                                        _fondWorkOrders[index]['status'],
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
                                                      _fondWorkOrders[index]['requestedBy'],
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
                                                        _fondWorkOrders[index]['assign'],
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
                                                        _fondWorkOrders[index]['supervisor'],
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
                                                      _fondWorkOrders[index]['createdOn'],
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
                                                      _fondWorkOrders[index]['dueDate'],
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
                                                      _fondWorkOrders[index]['submittedOn '].toString(),
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
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),

                    //-----------------------------Tab3--------------------------------------------
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PM Works",
                                style: TextStyle(
                                    fontSize: 14.sp, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                width: 100.w,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: InkWell(
                                    onTap:() {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: (context) =>
                                  seeHistory()));
                                    },
                                    child: Text(
                                      "Weekly-PM-Vibration-Noise",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 100.w,
                                      height: 5.h,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddNewPmBtnPage()),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: appThemeColor,
                                              side: BorderSide.none),
                                          child: Text(
                                            "+ Add new PM",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                      height: 5.h,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        seeHistory()));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            side: BorderSide(
                                                width: 1,
                                                color: appThemeColor),
                                            backgroundColor: Colors.white,
                                          ),
                                          child: Text(
                                            "See History",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                                color: appThemeColor),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // ------
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
