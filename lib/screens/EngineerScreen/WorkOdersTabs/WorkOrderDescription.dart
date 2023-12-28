import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/testStyleConstant.dart';
import 'Tab2FAB_forPartsList.dart';
import 'Tab1_WO_Desc_Page.dart';

class WorkOrderDescriptionPage extends StatefulWidget {
  var list_index;
  var Work_id;

  WorkOrderDescriptionPage(
      {required this.list_index, required this.Work_id, super.key});

  @override
  State<WorkOrderDescriptionPage> createState() =>
      _WorkOrderDescriptionPageState();
}

class _WorkOrderDescriptionPageState extends State<WorkOrderDescriptionPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        initialIndex: widget.list_index,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Text(
              "Work Order # ${widget.Work_id}",
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
                                Tab1_WO_Desc(
                                    Tab_index1: widget.list_index,
                                    Work_id: widget.Work_id),
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
        ),
      ),
    );
  }
}
