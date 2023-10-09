import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/testStyleConstant.dart';

class AssetDescrptionPage extends StatefulWidget {
  const AssetDescrptionPage({super.key});

  @override
  State<AssetDescrptionPage> createState() => _AssetDescrptionPageState();
}

class _AssetDescrptionPageState extends State<AssetDescrptionPage> {
  bool isExpanded1 = true;
  bool isExpanded2 = true;
  bool isExpanded3 = true;

  void toggleContainerSize1() {
    setState(() {
      isExpanded1 = !isExpanded1;
    });
  }

  void toggleContainerSize2() {
    setState(() {
      isExpanded2 = !isExpanded2;
    });
  }

  void toggleContainerSize3() {
    setState(() {
      isExpanded3 = !isExpanded3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Column(
            children: [
              Text(
                "Speed Master 102",
                style: dashboardStyle,
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                "HARIDWAR, shopfloor",
                style: TextStyle(fontSize: 12.sp),
              ),
            ],
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              // Icon to represent the drawer
              onPressed: () {
                Navigator.pop(context); // Open the drawer
              },
            ),
          ),
          backgroundColor: appThemeColor,
        ),
        backgroundColor: appThemeColor,
        body: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.h),
            child: Column(
              children: [
                // Container(
                //   height: 45,
                //   decoration: BoxDecoration(
                //     color: Colors.grey[300],
                //     borderRadius: BorderRadius.circular(25.h),
                //   ),
                //   child: TabBar(
                //     indicator: BoxDecoration(
                //       color: Theme.of(context).primaryColor,
                //       borderRadius: BorderRadius.circular(25.h),
                //     ),
                //     labelColor: Colors.white,
                //     unselectedLabelColor: Colors.grey,
                //     tabs: const [
                //       Tab(
                //         text: 'Details',
                //       ),
                //       // Tab(
                //       //   text: 'Work Orders',
                //       // ),
                //       Tab(
                //         text: 'PM Work',
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 2.h,
                // ),
                SizedBox(
                  height: 75.h,
                  width: 100.w,
                  child: TabBarView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 25.h,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 5),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              pauseAutoPlayOnTouch: true,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: true,
                            ),
                            items: [
                              Container(
                                height: 20.h,
                                width: double.infinity,
                                color: Colors.grey.withOpacity(0.3),
                                child: Image.asset(
                                    "assets/images/asset_1.png"),
                              ),
                              Container(
                                height: 20.h,
                                width: double.infinity,
                                color: Colors.grey.withOpacity(0.3),
                                child: Image.asset(
                                    "assets/images/asset_2.webp"),
                              ),
                              Container(
                                height: 20.h,
                                width: double.infinity,
                                color: Colors.grey.withOpacity(0.3),
                                child: Image.asset(
                                    "assets/images/asset_3.jpg"),
                              ),
                              Container(
                                height: 20.h,
                                width: double.infinity,
                                color: Colors.grey.withOpacity(0.3),
                                child: Image.asset(
                                    "assets/images/asset_4.jpg"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height:5.h,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.6)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 20.h,
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.h, vertical: 3.h),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 15.h,
                                            width: 30.w,
                                            // color: Colors.greenAccent,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Serial Number",
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                      ),
                                                    ),
                                                    Text(
                                                      "531578",
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color: Colors.grey),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Type",
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                      ),
                                                    ),
                                                    Text(
                                                      "102 SPL",
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color: Colors.grey),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 15.h,
                                            width: 30.w,
                                            // color: Colors.red,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Category",
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                      ),
                                                    ),
                                                    Text(
                                                      "PRINTING",
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color: Colors.grey),
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
                                                        fontSize: 14.sp,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Shopfloor",
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color: Colors.grey),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Description",
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              Text(
                                                "Offset Printing Machine",
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      GestureDetector(
                                        onTap: toggleContainerSize1,
                                        child: AnimatedContainer(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.blue.withOpacity(0.2),
                                          ),
                                          duration: Duration(milliseconds: 300),
                                          width: double.infinity,
                                          height: isExpanded1 ? 4.h : 30.h,
                                          child: isExpanded1
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Purchase info',
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.arrow_right,
                                                        size: 20.sp,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 4.h,
                                                        width: double.infinity,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Purchase info',
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .arrow_drop_down_sharp,
                                                              size: 20.sp,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      Container(
                                                        height: 20.h,
                                                        width: double.infinity,
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              height: 20.h,
                                                              width: 35.w,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Date of manufacturing",
                                                                    style: TextStyle(
                                                                        fontSize: 10
                                                                            .sp,
                                                                        color: Colors
                                                                            .grey),
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Date of purchase",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                10.sp,
                                                                            color: Colors.grey),
                                                                      ),
                                                                      Text(
                                                                        "01 Jan 1990",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                10.sp),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    "Present Value",
                                                                    style: TextStyle(
                                                                        fontSize: 10
                                                                            .sp,
                                                                        color: Colors
                                                                            .grey),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 20.h,
                                                              width: 35.w,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Type of purchase",
                                                                    style: TextStyle(
                                                                        fontSize: 10
                                                                            .sp,
                                                                        color: Colors
                                                                            .grey),
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                        "Purchase price",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                10.sp,
                                                                            color: Colors.grey),
                                                                      ),
                                                                      Text(""),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    "End of life(in years)",
                                                                    style: TextStyle(
                                                                        fontSize: 10
                                                                            .sp,
                                                                        color: Colors
                                                                            .grey),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      GestureDetector(
                                        onTap: toggleContainerSize2,
                                        child: AnimatedContainer(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color:
                                                  Colors.blue.withOpacity(0.2),
                                            ),
                                            duration:
                                                Duration(milliseconds: 300),
                                            width: double.infinity,
                                            height: isExpanded2 ? 4.h : 30.h,
                                            child: isExpanded2
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Service info',
                                                          style: TextStyle(
                                                            fontSize: 12.sp,
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.arrow_right,
                                                          size: 20.sp,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: 4.h,
                                                          width:
                                                              double.infinity,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                'Service info',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                ),
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .arrow_drop_down,
                                                                size: 20.sp,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 2.h,
                                                        ),
                                                        Container(
                                                          height: 20.h,
                                                          width:
                                                              double.infinity,
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                height: 10.h,
                                                                width: 35.w,
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          "Last Service Date",
                                                                          style: TextStyle(
                                                                              fontSize: 10.sp,
                                                                              color: Colors.grey),
                                                                        ),
                                                                        Text(
                                                                          "08 May 2023",
                                                                          style:
                                                                              TextStyle(fontSize: 10.sp),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      "Warranty End Date",
                                                                      style: TextStyle(
                                                                          fontSize: 10
                                                                              .sp,
                                                                          color:
                                                                              Colors.grey),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                height: 10.h,
                                                                width: 35.w,
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Next Service Date",
                                                                      style: TextStyle(
                                                                          fontSize: 10
                                                                              .sp,
                                                                          color:
                                                                              Colors.grey),
                                                                    ),
                                                                    // Column(
                                                                    //   children: [
                                                                    //     Text("Purchase price",style: TextStyle(fontSize: 10.sp,color: Colors.grey),),
                                                                    //     Text(""),
                                                                    //   ],
                                                                    // ),
                                                                    Text(
                                                                      "AMC End Date",
                                                                      style: TextStyle(
                                                                          fontSize: 10
                                                                              .sp,
                                                                          color:
                                                                              Colors.grey),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      GestureDetector(
                                        onTap: toggleContainerSize3,
                                        child: AnimatedContainer(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.blue.withOpacity(0.2),
                                          ),
                                          duration: Duration(milliseconds: 300),
                                          width: double.infinity,
                                          height: isExpanded3 ? 4.h : 30.h,
                                          child: isExpanded3
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Documents',
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.arrow_right,
                                                        size: 20.sp,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 4.h,
                                                        width: double.infinity,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Documents',
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              size: 20.sp,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      Container(
                                                          height: 20.h,
                                                          width:
                                                              double.infinity,
                                                          child: Center(
                                                            child: Text(
                                                                "No Documents Available!!!"),
                                                          )
                                                          // Row(crossAxisAlignment: CrossAxisAlignment.start,
                                                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          //   children: [
                                                          //     Container(
                                                          //       height: 20.h,
                                                          //       width: 35.w,
                                                          //       child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          //         children: [
                                                          //           Text("Date of manufacturing",style: TextStyle(fontSize: 10.sp,color: Colors.grey),),
                                                          //           Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                          //             children: [
                                                          //               Text("Date of purchase",style: TextStyle(fontSize: 10.sp,color: Colors.grey),),
                                                          //               Text("01 Jan 1990",style: TextStyle(fontSize: 10.sp),),
                                                          //             ],
                                                          //           ),
                                                          //           Text("Present Value",style: TextStyle(fontSize: 10.sp,color: Colors.grey),),
                                                          //         ],),
                                                          //     ),
                                                          //     Container(
                                                          //       height: 20.h,
                                                          //       width: 35.w,
                                                          //       child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          //         children: [
                                                          //           Text("Type of purchase",style: TextStyle(fontSize: 10.sp,color: Colors.grey),),
                                                          //           Column(
                                                          //             children: [
                                                          //               Text("Purchase price",style: TextStyle(fontSize: 10.sp,color: Colors.grey),),
                                                          //               Text(""),
                                                          //             ],
                                                          //           ),
                                                          //           Text("End of life(in years)",style: TextStyle(fontSize: 10.sp,color: Colors.grey),),
                                                          //         ],),
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                          )
                                                    ],
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text("PM Works"),
                      //         SizedBox(
                      //           height: 2.h,
                      //         ),
                      //         Container(
                      //           height: 5.h,
                      //           width: double.infinity,
                      //           decoration: BoxDecoration(
                      //             border: Border.all(
                      //                 color: Colors.grey.withOpacity(0.6)),
                      //             borderRadius: BorderRadius.circular(10),
                      //           ),
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: Text("Vikas"),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     Column(
                      //       children: [
                      //         Container(
                      //           height: 5.h,
                      //           child: ElevatedButton(
                      //             onPressed: () {
                      //               Navigator.push(
                      //                         context,
                      //                         MaterialPageRoute(builder: (context) => AddNewPM()),
                      //                       );
                      //             },
                      //             style: ButtonStyle(backgroundColor:
                      //             MaterialStateProperty
                      //                 .all(Theme.of(
                      //                 context)
                      //                 .primaryColor),),
                      //             child: Row(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: [Icon(Icons.add), Text("Add new PM")],
                      //             ),
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           height: 1.h,
                      //         ),
                      //         InkWell(
                      //           child: Container(
                      //             height: 5.h,
                      //             width: double.infinity,
                      //             decoration: BoxDecoration(
                      //               border: Border.all(
                      //                   color: appThemeColor),
                      //               borderRadius: BorderRadius.circular(10),
                      //             ),
                      //             child: Padding(
                      //               padding: const EdgeInsets.all(8.0),
                      //               child: Center(child: Text("See History",style: TextStyle(color: appThemeColor),)),
                      //             ),
                      //           ),
                      //           onTap: (){
                      //             Navigator.push(
                      //               context,
                      //               MaterialPageRoute(builder: (context) => SeeHistoryPage()),
                      //             );
                      //           },
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
