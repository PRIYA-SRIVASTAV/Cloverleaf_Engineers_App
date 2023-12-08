import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/stringsConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/get_Work_order_details_controller.dart';
import '../../../controller/work_order_list_controller.dart';
import '../../../model/GetWorkorderdetailsModel.dart';
import '../../../model/WorkOrderModel.dart';
import 'Tab2FAB_forPartsList.dart';
import 'Tab1_WO_Desc_Page.dart';

class WorkOrderDescriptionPage extends StatefulWidget {
  var list_index;
  var Work_id;

  WorkOrderDescriptionPage({required this.list_index,required this.Work_id, super.key});

  @override
  State<WorkOrderDescriptionPage> createState() =>
      _WorkOrderDescriptionPageState();
}

class _WorkOrderDescriptionPageState extends State<WorkOrderDescriptionPage> {
  late GetWorkorderdetailsModel get_work_order_status2;
  bool is_status2_work_list_load = false;

  @override
  void initState() {
    super.initState();
    get_work_order_status2_method();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        initialIndex: widget.list_index,
        child: is_status2_work_list_load
            ? Scaffold(
                appBar: AppBar(
                  elevation: 0.0,
                  title: Text(
                    "Work Order # ${get_work_order_status2.data?.workId.toString()}",
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
                backgroundColor: appThemeColor,
                body: Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 1.h),
                    child: SingleChildScrollView(
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
                              labelStyle: GoogleFonts.lato(
                                  fontSize: 9.5.sp,
                                  fontWeight: FontWeight.w600),
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
                                Tab1_WO_Desc(Tab_index1: widget.list_index,Work_id : widget.Work_id),
                                Tab2FAB(
                                  WorkID: widget.Work_id,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: appThemeColor,
                  ),
                ),
              ),
      ),
    );
  }

  void get_work_order_status2_method() async {
    get_work_order_status2 = await get_Work_order_details_controller()
        .get_Work_order_details_controller_method(widget.Work_id);
    setState(() {
      is_status2_work_list_load = true;
    });
  }
}
