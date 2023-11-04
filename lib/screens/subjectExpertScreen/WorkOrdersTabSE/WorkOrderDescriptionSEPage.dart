import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloverleaf_project/screens/subjectExpertScreen/WorkOrdersTabSE/VoiceCallPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/stringsConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/Get_Add_Parts_list_controller.dart';
import '../../../controller/Get_Parts_List_Controller.dart';
import '../../../controller/Get_SE_Work_Order_List_Controller.dart';
import '../../../controller/post_work_parts_controller.dart';
import '../../../model/GetAddPartsListModel.dart';
import '../../../model/GetPartsModel.dart';
import '../../../model/SE_Work_order_model.dart';
import 'VideoCallPage.dart';

class WorkOrderDescriptionSEpage extends StatefulWidget {
  var index;

  WorkOrderDescriptionSEpage({required this.index, super.key});

  @override
  State<WorkOrderDescriptionSEpage> createState() =>
      _WorkOrderDescriptionSEpageState();
}

class _WorkOrderDescriptionSEpageState
    extends State<WorkOrderDescriptionSEpage> {
  List<Dat> CustumAddedPartsList = [];
  String? selectedValue;
  String? dropdownvalue;
  String? dropdownvalueName;
  late GetSeWorkOrderListModel get_SE_work_order_status2;
  late GetPartsModel get_SE_parts_list_data;
  late GetAddPartsListModel get_SE_add_parts_list;
  bool is_status2_SE_work_list_load = false;
  bool is_load_SE_parts_list = false;
  bool is_load_SE_add_parts_list = false;

  @override
  void initState() {
    super.initState();
    get_SE_work_order_status2_method();
    get_SE_parts_list_data_method();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "Work Order Description",
            style: dashboardStyle,
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
        body: Padding(
          padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 1.h),
          child: is_status2_SE_work_list_load
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(25.h),
                        ),
                        child: TabBar(
                          indicator: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(25.h),
                          ),
                          labelColor: Colors.white,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 8.sp),
                          unselectedLabelColor: Colors.grey,
                          tabs: const [
                            Tab(
                              text: 'Order Description',
                            ),
                            Tab(
                              text: 'Parts Used',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 70.h,
                        width: 100.w,
                        child: TabBarView(
                          children: [
                            if (is_status2_SE_work_list_load == true) ...[
                              get_SE_work_order_status2.data.isNotEmpty
                                  ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CarouselSlider(
                                    options: CarouselOptions(
                                      height: 20.h,
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
                                    height: 3.h,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 30.h,
                                          width: 35.w,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Asset Name",
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                  Text(
                                                    get_SE_work_order_status2.data[widget.index].asset.toString(),
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
                                                    "Subject",
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                  Text(
                                                    get_SE_work_order_status2.data[widget.index].subject.toString(),
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
                                                    "Location",
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                  Text(
                                                    get_SE_work_order_status2.data[widget.index].loc.toString(),
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
                                                    "Description",
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                  Text(
                                                    get_SE_work_order_status2.data[widget.index].desc.toString(),
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 20.h,
                                        width: 30.w,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Status",
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                Text(
                                                  get_SE_work_order_status2.data[widget.index].woStatus.toString(),
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.red),
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
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                Text(
                                                  get_SE_work_order_status2.data[widget.index].priority.toString(),
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.orange),
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
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                Text(
                                                  get_SE_work_order_status2.data[widget.index].category.toString(),
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
                                  SizedBox(height: 4.h,),
                                  Container(
                                    height:8.h,
                                    width: 40.h,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Video/Voice Call to Engineer"),
                                            SizedBox(
                                              width: 25.w,
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  shape:
                                                  MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Theme.of(context)
                                                          .primaryColor),
                                                ),
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return CallNowViaVideoAudio(
                                                          context);
                                                    },
                                                  );
                                                },
                                                child: Text(
                                                  "Call now",
                                                  style:
                                                  TextStyle(fontSize: 10.sp),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    //color: Colors.grey,
                                  ),
                                ],
                              )
                                  : Center(
                                child: Text(
                                    "${get_SE_work_order_status2.message.toString()}"),
                              ),
                            ] else ...[
                              Center(
                                child: CircularProgressIndicator(
                                  color: appThemeColor,
                                ),
                              )
                            ],
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      color: appThemeColor,
                                      child: ListTile(
                                        leading: Text(
                                          'Id',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 16.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        title: Text(
                                          'Parts Name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16.sp,
                                              color: Colors.white),
                                        ),
                                        // trailing: Text(
                                        //   'Description',
                                        //   style: TextStyle(
                                        //       fontWeight: FontWeight.w800,
                                        //       fontSize: 14.sp,
                                        //       color: Colors.white),
                                        // ),
                                      ),
                                    ),
                                    if (is_load_SE_add_parts_list) ...[
                                      if (get_SE_add_parts_list
                                          .data.isNotEmpty) ...[
                                        Container(
                                          height: 55.h,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount:
                                            get_SE_add_parts_list.data.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return ListTile(
                                                leading: Text(
                                                  get_SE_add_parts_list
                                                      .data[index].partsId
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                                title: Text(
                                                  get_SE_add_parts_list
                                                      .data[index].partsName
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ] else ...[
                                        Container(
                                          height: 55.h,
                                          child: Center(
                                            child: Text(
                                                "${get_SE_add_parts_list.message.toString()}"),
                                          ),
                                        ),
                                      ]
                                    ] else ...[
                                      Center(
                                        child: CircularProgressIndicator(
                                          color: appThemeColor,
                                        ),
                                      )
                                    ]
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  Widget CallNowViaVideoAudio(context) {
    return Dialog(
      child: Container(
        height: 20.h,
        child: Stack(
          // alignment: Alignment.topRight,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                     onTap: () {
                        Navigator.of(context).push(
                           MaterialPageRoute(
                              builder: (context) => VideoCallPage(callID: "1")),
                        );
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.video_call,
                            size: 34.sp,
                            color: appThemeColor,
                          ),
                          Text("Video call")
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => VoiceCallPage(callID: "1")),
                        );
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.call,
                            size: 34.sp,
                            color: appThemeColor,
                          ),
                          Text("Voice call")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 2,
              top: 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    key: Key('closeIconKey'),
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void get_SE_work_order_status2_method() async {
    get_SE_work_order_status2 = await Get_SE_Work_Order_List_Controller()
        .SE_work_order_list_pending_controller_method(SE_Work_order_status2);
    get_SE_add_parts_list_method();
    setState(() {
      is_status2_SE_work_list_load = true;
    });
  }

  void get_SE_add_parts_list_method() async {
    get_SE_add_parts_list = await Get_Add_Parts_list_controller()
        .Get_Add_SE_Parts_list_controller_method(
        get_SE_work_order_status2.data[widget.index].workId.toString());
    setState(() {
      is_load_SE_add_parts_list = true;
    });
  }

  void get_SE_parts_list_data_method() async {
    get_SE_parts_list_data = await Get_Parts_List_Controller().Get_SE_Parts_List_Controller_method();
    setState(() {
      is_load_SE_parts_list = true;
    });
  }

}
