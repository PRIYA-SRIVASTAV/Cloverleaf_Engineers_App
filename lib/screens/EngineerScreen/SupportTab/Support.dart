import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/prefsConstant.dart';
import '../../../constant/stringsConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/post_work_reason_controller.dart';
import '../../../controller/work_order_list_controller.dart';
import '../../../model/WorkOrderModel.dart';
import '../../../utils/helperMethods.dart';
import '../Drawer/customDrawer.dart';


class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  Uri dialnumber=Uri(scheme: 'tel',path: '1234567890');
  callnumber()async{
    await launchUrl(dialnumber);
  }
  directCall()async{
    await FlutterPhoneDirectCaller.callNumber('1234567890');
  }
  bool isExpanded1 = true;
  bool isExpanded2 = true;
  bool isExpanded3 = true;
  bool isExpanded4 = true;
  bool isExpanded5 = true;
  String? dropdownvalue;
  String? dropdownvalueName;
  TextEditingController ReasonController = TextEditingController();
  late GetWorkOrderListModel get_work_order_status2;
  bool is_status2_work_list_load = false;

  @override
  void dispose() {
    ReasonController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    get_work_order_status2_method();
  }

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

  void toggleContainerSize4() {
    setState(() {
      isExpanded4 = !isExpanded4;
    });
  }

  void toggleContainerSize5() {
    setState(() {
      isExpanded5 = !isExpanded5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text(
                "Support",
                style: dashboardStyle,
              ),
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu), // Icon to represent the drawer
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Open the drawer
                  },
                ),
              ),
              backgroundColor: appThemeColor,
            ),
            drawer: const AppDrawer(),
            backgroundColor: appThemeColor,
            body: Container(
              // height: double.infinity,
              // width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child:is_status2_work_list_load
                  ? Container(
                height: 80.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.h),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ Container(
                            height: 5.h,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return  get_work_order_status2
                                        .data!.isNotEmpty
                                        ? Unable_to_solve_dialog(context, index)
                                    : Dialog(
                                        child: Container(
                                          height: 30.h,
                                          child: Stack(
                                            // alignment: Alignment.topRight,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 20.h,
                                                    color: Colors.red,
                                                    child: Image.asset("assets/images/pending data not available.jpeg"),
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      "${get_work_order_status2.message.toString()}",
                                                      style: GoogleFonts.lato(
                                                          fontSize: 12.sp,
                                                          fontWeight: FontWeight.w600,
                                                        color: Colors.red
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Positioned(
                                                right: 2,
                                                top: 2,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .pop();
                                                  },
                                                  child: const Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: CircleAvatar(
                                                      key: Key(
                                                          'closeIconKey'),
                                                      radius: 15,
                                                      backgroundColor:
                                                          Colors.white,
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
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.support_agent_sharp),
                                  Text("Support required",style: GoogleFonts.lato(
                                      fontSize: 12.sp,
                                      fontWeight:
                                      FontWeight.w600),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          InkWell(
                            onTap: (){
                              callnumber();
                            },
                            child: Container(
                              height: 5.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: appThemeColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: appThemeColor,
                                      ),
                                      Text(
                                        "Contact to support",
                                          style: GoogleFonts.lato(
                                              fontSize: 12.sp,
                                              fontWeight:
                                              FontWeight.w400,color: appThemeColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Center(
                              child: Text(
                            "FAQ",
                                style: GoogleFonts.lato(
                                    fontSize: 14.sp,
                                    fontWeight:
                                    FontWeight.w600,
                                color: appThemeColor
                                ),
                          ),),
                          Divider(
                            color: appThemeColor,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          GestureDetector(
                            onTap: toggleContainerSize1,
                            child: AnimatedContainer(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: appThemeColor.withOpacity(0.2),
                              ),
                              duration: Duration(milliseconds: 300),
                              width: double.infinity,
                              height: isExpanded1 ? 4.h : 30.h,
                              child: isExpanded1
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Lorem Ipsum',
                                            style: GoogleFonts.lato(
                                                fontSize: 12.sp,
                                                fontWeight:
                                                FontWeight.w600),
                                          ),
                                          Icon(
                                            Icons.arrow_right,
                                            size: 20.sp,
                                          )
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
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
                                                  'Lorem Ipsum',
                                                  style: GoogleFonts.lato(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                                Icon(
                                                  Icons.arrow_drop_down_sharp,
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
                                            child: Text(
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                                                textAlign: TextAlign.justify,
                                              style: GoogleFonts.lato(
                                                  fontSize: 12.sp,
                                                  fontWeight:
                                                  FontWeight.w400),),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          GestureDetector(
                            onTap: toggleContainerSize2,
                            child: AnimatedContainer(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: appThemeColor.withOpacity(0.2),
                              ),
                              duration: Duration(milliseconds: 300),
                              width: double.infinity,
                              height: isExpanded2 ? 4.h : 30.h,
                              child: isExpanded2
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Lorem Ipsum',
                                            style: GoogleFonts.lato(
                                                fontSize: 12.sp,
                                                fontWeight:
                                                FontWeight.w600),
                                          ),
                                          Icon(
                                            Icons.arrow_right,
                                            size: 20.sp,
                                          )
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
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
                                                  'Lorem Ipsum',
                                                  style: GoogleFonts.lato(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                                Icon(
                                                  Icons.arrow_drop_down_sharp,
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
                                            child: Text(
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                                                textAlign: TextAlign.justify,
                                              style: GoogleFonts.lato(
                                                  fontSize: 12.sp,
                                                  fontWeight:
                                                  FontWeight.w400),),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          GestureDetector(
                            onTap: toggleContainerSize3,
                            child: AnimatedContainer(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: appThemeColor.withOpacity(0.2),
                              ),
                              duration: Duration(milliseconds: 300),
                              width: double.infinity,
                              height: isExpanded3 ? 4.h : 30.h,
                              child: isExpanded3
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Lorem Ipsum',
                                            style: GoogleFonts.lato(
                                                fontSize: 12.sp,
                                                fontWeight:
                                                FontWeight.w600),
                                          ),
                                          Icon(
                                            Icons.arrow_right,
                                            size: 20.sp,
                                          )
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
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
                                                  'Lorem Ipsum',
                                                  style: GoogleFonts.lato(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                                Icon(
                                                  Icons.arrow_drop_down_sharp,
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
                                            child: Text(
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                                                textAlign: TextAlign.justify,
                                              style: GoogleFonts.lato(
                                                  fontSize: 12.sp,
                                                  fontWeight:
                                                  FontWeight.w400),),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          GestureDetector(
                            onTap: toggleContainerSize4,
                            child: AnimatedContainer(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: appThemeColor.withOpacity(0.2),
                              ),
                              duration: Duration(milliseconds: 300),
                              width: double.infinity,
                              height: isExpanded4 ? 4.h : 30.h,
                              child: isExpanded4
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Lorem Ipsum',
                                            style: GoogleFonts.lato(
                                                fontSize: 12.sp,
                                                fontWeight:
                                                FontWeight.w600),
                                          ),
                                          Icon(
                                            Icons.arrow_right,
                                            size: 20.sp,
                                          )
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
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
                                                  'Lorem Ipsum',
                                                  style: GoogleFonts.lato(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                                Icon(
                                                  Icons.arrow_drop_down_sharp,
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
                                            child: Text(
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                                                textAlign: TextAlign.justify,
                                              style: GoogleFonts.lato(
                                                  fontSize: 12.sp,
                                                  fontWeight:
                                                  FontWeight.w400),),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          GestureDetector(
                            onTap: toggleContainerSize5,
                            child: AnimatedContainer(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: appThemeColor.withOpacity(0.2),
                              ),
                              duration: Duration(milliseconds: 300),
                              width: double.infinity,
                              height: isExpanded5 ? 4.h : 30.h,
                              child: isExpanded5
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Lorem Ipsum',
                                            style: GoogleFonts.lato(
                                                fontSize: 12.sp,
                                                fontWeight:
                                                FontWeight.w600),
                                          ),
                                          Icon(
                                            Icons.arrow_right,
                                            size: 20.sp,
                                          )
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
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
                                                  'Lorem Ipsum',
                                                  style: GoogleFonts.lato(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                                Icon(
                                                  Icons.arrow_drop_down_sharp,
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
                                            child: Text(
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                                                textAlign: TextAlign.justify,
                                              style: GoogleFonts.lato(
                                                  fontSize: 12.sp,
                                                  fontWeight:
                                                  FontWeight.w400),),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: 1,
                  ),
                ),
              )
                  : Center(
                child: CircularProgressIndicator(
                  color: appThemeColor,
                ),
              ),
            ),
          );
  }

  Widget Unable_to_solve_dialog(context,index) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Dialog(
          child: Container(
            height: 35.h,
            child: Stack(
              // alignment: Alignment.topRight,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(3.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Support Required",
                            style: GoogleFonts.lato(
                                fontSize: 14.sp, color: appThemeColor, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 2.w, right: 2.w),
                            child: DropdownButton(
                              value: dropdownvalue,
                              menuMaxHeight: 50.h,
                              borderRadius: BorderRadius.circular(7),
                              elevation: 10,
                              underline: const SizedBox(),
                              isExpanded: true,
                              hint: const Text('Select Work order'),
                              items: get_work_order_status2.data!.map((item) {
                                return DropdownMenuItem(
                                  value: item.workId.toString(),
                                  child: Row(
                                    children: [
                                      Text("Work-id"),
                                      SizedBox(
                                        width: 2.h,
                                      ),
                                      Text(
                                        "#${item.workId.toString()}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? val) {
                                setState(
                                      () {
                                    dropdownvalue = val!;
                                    var a = get_work_order_status2.data
                                        !.indexWhere(
                                            (e) => e.workId.toString() == val);
                                    dropdownvalueName =
                                        get_work_order_status2.data![a].subject;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextFormField(
                          controller: ReasonController,
                          maxLength: 100,
                          decoration: InputDecoration(counterStyle: GoogleFonts.rubik(fontSize: 10.sp,color: Colors.grey),
                              suffixIcon: Icon(Icons.note_alt),
                              border: UnderlineInputBorder(),
                              hintText: "Enter reason",
                              hintStyle: GoogleFonts.lato(fontWeight:FontWeight.w600,color: Colors.grey,fontSize: 12.sp)
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Center(
                          child: SizedBox(
                            height: 5.h,
                            width: 40.w,
                            child: ElevatedButton(
                              onPressed: () async {
                                await post_work_reason_controller()
                                    .post_work_reason_controller_method(
                                    get_work_order_status2
                                        .data![index].workId
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
                                style:  GoogleFonts.lato(
                                    fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w600),
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


  void get_work_order_status2_method() async {
    get_work_order_status2 = await work_order_list_controller()
        .work_order_list_pending_controller_method(Work_order_status2);
    setState(() {
      is_status2_work_list_load = true;
    });
  }
}
