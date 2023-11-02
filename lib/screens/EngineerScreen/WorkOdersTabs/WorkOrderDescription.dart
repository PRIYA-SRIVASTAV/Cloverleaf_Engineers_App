import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/prefsConstant.dart';
import '../../../constant/stringsConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/Get_Add_Parts_list_controller.dart';
import '../../../controller/Get_Parts_List_Controller.dart';
import '../../../controller/post_work_parts_controller.dart';
import '../../../controller/post_work_reason_controller.dart';
import '../../../controller/update_wo_status_Controller.dart';
import '../../../controller/work_order_list_controller.dart';
import '../../../model/GetAddPartsListModel.dart';
import '../../../model/GetPartsModel.dart';
import '../../../model/WorkOrderModel.dart';
import '../../../utils/helperMethods.dart';


class WorkOrderDescriptionPage extends StatefulWidget {
  var index;

  WorkOrderDescriptionPage({required this.index, super.key});

  @override
  State<WorkOrderDescriptionPage> createState() =>
      _WorkOrderDescriptionPageState();
}

class _WorkOrderDescriptionPageState extends State<WorkOrderDescriptionPage> {
  TextEditingController ReasonController = TextEditingController();
  TextEditingController othersController = TextEditingController();
  late GetWorkOrderListModel get_work_order_status2;
  late GetPartsModel get_parts_list_data;
  late GetAddPartsListModel get_add_parts_list;
  bool is_status2_work_list_load = false;
  bool is_load_parts_list = false;
  bool is_load_add_parts_list = false;
  List<Dat> CustumAddedPartsList = [];
  String? selectedValue;
  String? dropdownvalue;
  String? dropdownvalueName;

  @override
  void initState() {
    super.initState();
    get_work_order_status2_method();
    get_Parts_List_method();
  }

  @override
  void dispose() {
    super.dispose();
    othersController.dispose();
    ReasonController.dispose();
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
          child: is_status2_work_list_load
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
                              text: 'Parts',
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
                            if (is_status2_work_list_load == true) ...[
                              get_work_order_status2.data.isNotEmpty
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CarouselSlider(
                                          options: CarouselOptions(
                                            height: 20.h,
                                            autoPlay: true,
                                            autoPlayInterval:
                                                Duration(seconds: 5),
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
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              child: Image.asset(
                                                  "assets/images/asset_1.png"),
                                            ),
                                            Container(
                                              height: 20.h,
                                              width: double.infinity,
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              child: Image.asset(
                                                  "assets/images/asset_2.webp"),
                                            ),
                                            Container(
                                              height: 20.h,
                                              width: double.infinity,
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              child: Image.asset(
                                                  "assets/images/asset_3.jpg"),
                                            ),
                                            Container(
                                              height: 20.h,
                                              width: double.infinity,
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              child: Image.asset(
                                                  "assets/images/asset_4.jpg"),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 30.h,
                                                width: 35.w,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Asset Name",
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          "${get_work_order_status2.data[widget.index].asset.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color:
                                                                  Colors.grey),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Subject",
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          "${get_work_order_status2.data[widget.index].subject.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color:
                                                                  Colors.grey),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Location",
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          "${get_work_order_status2.data[widget.index].loc.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color:
                                                                  Colors.grey),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Description",
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          "${get_work_order_status2.data[widget.index].desc.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color:
                                                                  Colors.grey),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Status",
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        "${get_work_order_status2.data[widget.index].woStatus.toString()}",
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color: Colors.red),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Priority",
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        "${get_work_order_status2.data[widget.index].priority.toString()}",
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color:
                                                                Colors.orange),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Category",
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        "${get_work_order_status2.data[widget.index].category.toString()}",
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
                                        Container(
                                          height: 17.h,
                                          width: 40.h,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Support required"),
                                                  SizedBox(
                                                    width: 25.w,
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        shape:
                                                            MaterialStateProperty
                                                                .all(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Theme.of(
                                                                        context)
                                                                    .primaryColor),
                                                      ),
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return Unable_to_solve_dialog(
                                                                context);
                                                          },
                                                        );
                                                      },
                                                      child: Text(
                                                        "Reason",
                                                        style: TextStyle(
                                                            fontSize: 10.sp),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Work order completed?"),
                                                  SizedBox(
                                                    width: 25.w,
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        shape:
                                                            MaterialStateProperty
                                                                .all(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Theme.of(
                                                                        context)
                                                                    .primaryColor),
                                                      ),
                                                      onPressed: () async {
                                                        var Work_id;
                                                        await getPref()
                                                            .then((value) {
                                                          value.setString(
                                                              KEYWORKID,
                                                              get_work_order_status2
                                                                  .data[widget
                                                                      .index]
                                                                  .workId
                                                                  .toString());
                                                        });
                                                        await getPref()
                                                            .then((value) {
                                                          Work_id =
                                                              value.getString(
                                                                  KEYWORKID);
                                                        });
                                                        await update_wo_status_Controller()
                                                            .update_wo_status_completed_Controller_method(
                                                                Work_id,
                                                                context);
                                                      },
                                                      child: Text(
                                                        "Submit",
                                                        style: TextStyle(
                                                            fontSize: 10.sp),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          //color: Colors.grey,
                                        )
                                      ],
                                    )
                                  : Center(
                                      child: Text(
                                          "${get_work_order_status2.message.toString()}"),
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
                                    if (is_load_add_parts_list) ...[
                                      if (get_add_parts_list
                                          .data.isNotEmpty) ...[
                                        Container(
                                          height: 55.h,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount:
                                                get_add_parts_list.data.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return ListTile(
                                                leading: Text(
                                                  get_add_parts_list
                                                      .data[index].partsId
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                title: Text(
                                                  get_add_parts_list
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
                                                "${get_add_parts_list.message.toString()}"),
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
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: SizedBox(
                                    height: 8.h,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          CircleBorder(
                                            side: BorderSide.none,
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Theme.of(context).primaryColor),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return get_parts_list_data
                                                    .data.isNotEmpty
                                                ? Add_Parts_popup(context)
                                                : Dialog(
                                                    child: Text(
                                                        "${get_parts_list_data.message.toString()}"),
                                                  );
                                          },
                                        );
                                      },
                                      child: Icon(
                                        Icons.add,
                                        size: 32.sp,
                                      ),
                                    ),
                                  ),
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

  void get_work_order_status2_method() async {
    get_work_order_status2 = await work_order_list_controller()
        .work_order_list_pending_controller_method(Work_order_status2);
    get_add_parts_list_method();
    setState(() {
      is_status2_work_list_load = true;
    });
  }

  void get_add_parts_list_method() async {
    get_add_parts_list = await Get_Add_Parts_list_controller()
        .Get_Add_Parts_list_controller_method(
            get_work_order_status2.data[widget.index].workId.toString());
    setState(() {
      is_load_add_parts_list = true;
    });
  }

  void get_Parts_List_method() async {
    get_parts_list_data =
        await Get_Parts_List_Controller().Get_Parts_List_Controller_method();
    CustumAddedPartsList = get_parts_list_data.data;
    var a = [Dat(name: "others", id: 0)];
    CustumAddedPartsList.addAll(a);

    setState(() {
      is_load_parts_list = true;
    });
  }

  Widget Unable_to_solve_dialog(context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Dialog(
          child: Container(
            height: 30.h,
            child: Stack(
              // alignment: Alignment.topRight,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Support Required",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: appThemeColor),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        TextFormField(
                          controller: ReasonController,
                          maxLength: 100,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.note_alt),
                              border: UnderlineInputBorder(),
                              hintText: "Enter reason"),
                        ),
                        SizedBox(height: 3.h),
                        Center(
                          child: SizedBox(
                            height: 5.h,
                            width: 50.w,
                            child: ElevatedButton(
                              onPressed: () async {
                                await post_work_reason_controller()
                                    .post_work_reason_controller_method(
                                        get_work_order_status2
                                            .data[widget.index].workId
                                            .toString(),
                                        ReasonController.text,
                                        context);
                                ReasonController.clear();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: appThemeColor,
                                side: BorderSide.none,
                                shape: const StadiumBorder(),
                              ),
                              child: Text(
                                "Ask to callback",
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              ),
                            ),
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
      },
    );
  }

  Widget Add_Parts_popup(context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Dialog(
          child: Container(
            height: 30.h,
            child: Stack(
              // alignment: Alignment.topRight,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 2.h, right: 2.h, bottom: 1.h, top: 3.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Add new parts",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: appThemeColor),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 5.w, right: 5.w),
                            child: DropdownButton(
                              value: dropdownvalue,
                              menuMaxHeight: 50.h,
                              borderRadius: BorderRadius.circular(7),
                              elevation: 10,
                              underline: const SizedBox(),
                              isExpanded: true,
                              hint: const Text('Parts'),
                              items: CustumAddedPartsList.map((item) {
                                return DropdownMenuItem(
                                  value: item.id.toString(),
                                  child: Text(item.name.toString()),
                                );
                              }).toList(),
                              onChanged: (String? val) {
                                setState(
                                  () {
                                    dropdownvalue = val!;
                                    var a = CustumAddedPartsList.indexWhere(
                                        (e) => e.id.toString() == val);
                                    dropdownvalueName =
                                        CustumAddedPartsList[a].name;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        if (dropdownvalue == "0") ...[
                          TextFormField(
                            onTap: () {},
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.note_alt_outlined),
                            ),
                            controller: othersController,
                          ),
                        ],
                        SizedBox(height: 4.h),
                        Center(
                          child: SizedBox(
                            height: 5.h,
                            width: 30.w,
                            child: ElevatedButton(
                              onPressed: () async {
                                post_work_parts_controller()
                                    .post_work_parts_controller_method(
                                        get_work_order_status2
                                            .data[widget.index].workId
                                            .toString(),
                                        dropdownvalue,
                                        dropdownvalueName,
                                        context)
                                    .whenComplete(
                                        () => get_work_order_status2_method());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: appThemeColor,
                                side: BorderSide.none,
                                shape: const StadiumBorder(),
                              ),
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              ),
                            ),
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
      },
    );
  }
}
