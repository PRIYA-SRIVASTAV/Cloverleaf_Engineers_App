import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/stringsConstant.dart';
import '../../../controller/Get_Add_Parts_list_controller.dart';
import '../../../controller/Get_Parts_List_Controller.dart';
import '../../../controller/post_work_parts_controller.dart';
import '../../../controller/work_order_list_controller.dart';
import '../../../model/GetAddPartsListModel.dart';
import '../../../model/GetPartsModel.dart';
import '../../../model/WorkOrderModel.dart';

class Tab2FAB extends StatefulWidget {
  Tab2FAB({required this.WorkID, super.key});

  var WorkID;

  @override
  State<Tab2FAB> createState() => _Tab2FABState();
}

class _Tab2FABState extends State<Tab2FAB> {
  TextEditingController othersController = TextEditingController();
  bool is_load_add_parts_list = false;
  bool is_load_parts_list = false;
  bool is_status2_work_list_load = false;
  late GetWorkOrderListModel get_work_order_status2;
  late GetPartsModel get_parts_list_data;
  late GetAddPartsListModel get_add_parts_list;
  String? dropdownvalue;
  String? dropdownvalueName;

  @override
  void initState() {
    super.initState();
    get_Parts_List_method();
    get_add_parts_list_method();
    get_work_order_status2_method();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: is_load_parts_list
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (is_load_add_parts_list) ...[
                          if (get_add_parts_list.data!.isNotEmpty) ...[
                            SizedBox(
                              height: 2.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Parts Id",
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      "Parts Name",
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount: get_add_parts_list.data?.length,
                              itemBuilder: (BuildContext context, i) {
                                return Card(
                                  elevation: 3,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.h, horizontal: 1.h),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            get_add_parts_list.data![i].partsId
                                                .toString(),
                                            style: GoogleFonts.rubik(
                                                fontSize: 10.sp),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            get_add_parts_list
                                                .data![i].partsName
                                                .toString(),
                                            style: GoogleFonts.rubik(
                                                fontSize: 10.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ] else ...[
                            Container(
                              height: 55.h,
                              child: Center(
                                child: Text(
                                  "${get_add_parts_list.message.toString()}",
                                  style: GoogleFonts.lato(color: Colors.red),
                                ),
                              ),
                            ),
                          ],
                        ] else ...[
                          Center(
                            child: CircularProgressIndicator(
                              color: appThemeColor,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                color: appThemeColor,
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appThemeColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return get_parts_list_data.data!.isNotEmpty
                  ? Add_Parts_popup(context)
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
                                  child: Image.asset(
                                      "assets/images/pending data not available.jpeg"),
                                ),
                                Center(
                                  child: Text(
                                    "${get_parts_list_data.message.toString()}",
                                    style: GoogleFonts.lato(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red),
                                  ),
                                ),
                              ],
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
        },
        child: Icon(
          Icons.add,
          size: 32.sp,
        ),
      ),
    );
  }

  void get_Parts_List_method() async {
    get_parts_list_data = await Get_Parts_List_Controller()
        .Get_Parts_List_Controller_method(widget.WorkID);
    setState(() {
      is_load_parts_list = true;
    });
  }

  void get_work_order_status2_method() async {
    get_work_order_status2 = await work_order_list_controller()
        .work_order_list_pending_controller_method(Work_order_status6);
    get_add_parts_list_method();
    setState(() {
      is_status2_work_list_load = true;
    });
  }

  void get_add_parts_list_method() async {
    get_add_parts_list = await Get_Add_Parts_list_controller()
        .Get_Add_Parts_list_controller_method(widget.WorkID);
    setState(() {
      is_load_add_parts_list = true;
    });
  }

  Widget Add_Parts_popup(context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Dialog(
          child: Container(
            height: 25.h,
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
                        Text(
                          "Add new parts",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: appThemeColor),
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
                              items: get_parts_list_data.data?.map((item) {
                                return DropdownMenuItem(
                                  value: item.partsId.toString(),
                                  child: Text(item.name.toString()),
                                );
                              }).toList(),
                              onChanged: (String? val) {
                                setState(
                                  () {
                                    dropdownvalue = val!;
                                    var a = get_parts_list_data.data
                                        ?.indexWhere(
                                            (e) => e.partsId.toString() == val);
                                    dropdownvalueName =
                                        get_parts_list_data.data?[a!].name;
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 5.h,
                              width: 30.w,
                              child: ElevatedButton(
                                onPressed: () async {
                                  post_work_parts_controller()
                                      .post_work_parts_controller_method(
                                          widget.WorkID.toString(),
                                          dropdownvalue.toString(),
                                          dropdownvalueName.toString(),
                                          context)
                                      .whenComplete(() =>
                                          get_work_order_status2_method());
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
                          ],
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
