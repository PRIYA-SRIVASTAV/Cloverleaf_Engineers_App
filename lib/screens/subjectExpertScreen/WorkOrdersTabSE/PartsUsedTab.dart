import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../controller/Get_Add_Parts_list_controller.dart';
import '../../../model/GetAddPartsListModel.dart';

class PartsUsedTab extends StatefulWidget {
  var work_id;

  PartsUsedTab({required this.work_id, super.key});

  @override
  State<PartsUsedTab> createState() => _PartsUsedTabState();
}

class _PartsUsedTabState extends State<PartsUsedTab> {
  late GetAddPartsListModel get_SE_add_parts_list;
  bool is_load_SE_add_parts_list = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_SE_add_parts_list_method();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: is_load_SE_add_parts_list
          ? Column(
              children: [
                if (get_SE_add_parts_list.data!.isNotEmpty) ...[
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Parts Id",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w600, fontSize: 12.sp),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            "Parts Name",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w600, fontSize: 12.sp),
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
                    itemCount: get_SE_add_parts_list.data?.length,
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
                                  get_SE_add_parts_list.data![i].partsId
                                      .toString(),
                                  style: GoogleFonts.rubik(fontSize: 10.sp),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  get_SE_add_parts_list.data![i].partsName
                                      .toString(),
                                  style: GoogleFonts.rubik(fontSize: 10.sp),
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
                        "${get_SE_add_parts_list.message.toString()}",
                        style: GoogleFonts.lato(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ],
            )
          : Center(
              child: CircularProgressIndicator(
                color: appThemeColor,
              ),
            ),
    );
  }

  void get_SE_add_parts_list_method() async {
    get_SE_add_parts_list = await Get_Add_Parts_list_controller()
        .Get_Add_SE_Parts_list_controller_method(widget.work_id);
    setState(() {
      is_load_SE_add_parts_list=true;
    });
  }
}
