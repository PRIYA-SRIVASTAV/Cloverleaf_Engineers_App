import 'dart:io';
import 'package:cloverleaf_project/controller/Get_Profile_Details_controller.dart';
import 'package:cloverleaf_project/controller/Update_profile_detail_controller.dart';
import 'package:cloverleaf_project/screens/EngineerScreen/Drawer/test_payroll_ui.dart';
import 'package:cloverleaf_project/screens/commonScreens/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constant/prefsConstant.dart';
import '../../../utils/helperMethods.dart';
import 'Eng_FAQ_Page.dart';
import 'Leave_Request_calender.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/is_update_active_controller.dart';
import '../../../model/GetLeaveCalenderModel.dart';
import '../../../model/GetprofilePageModel.dart';
import '../../../utils/helperWidget.dart';
import 'editProfilePageEng.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String? support_number;
  directCall() async {
   await launchUrl(
        Uri(scheme: 'tel',path: "${support_number}"),
        mode: LaunchMode.externalApplication
    );
   // await FlutterPhoneDirectCaller.callNumber(support_number!);
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  late GetProfileDetailsModel get_profile_details_data;
  late GetLeaveCalendarModel get_Leave_calendar_data;
  bool is_load_Leave_calendar_data = false;
  bool is_load_profile_details_data = false;
  bool on_leave_status = false;

  @override
  void initState() {
    getPref().then((value) {
      if (mounted) {
        setState(() {
          support_number = value.getString(KEYSUPPORTNUMBER);
        });
      }
    });
    get_profile_details_data_method();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  File? profileImage;
  Widget imageWidget() {
    return profileImage == null
        ? Container(
            height: 20.h,
            width: 20.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: get_profile_details_data.data!.image!.isEmpty ||
                      get_profile_details_data.data!.image!.toString() == "" ||
                      get_profile_details_data.data!.image == null
                  ? Image.asset(
                      "assets/images/3135715.png",
                      fit: BoxFit.fill,
                    )
                  : Image.network(
                      get_profile_details_data.data!.image!,
                      fit: BoxFit.fill,
                    ),
            ),
          )
        : Container(
            height: 20.h,
            width: 20.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.file(
                profileImage!,
                fit: BoxFit.cover,
              ),
            ),
          );
  }

  void tapButton() async {
    on_leave_status = !on_leave_status;
  }

  @override
  Widget build(BuildContext context) {
    return is_load_profile_details_data
        ? Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 18.h,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: appThemeColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Settings', style: dashboardStyle),
                        InkWell(
                          onTap: () {
                            directCall();
                          },
                          child: Column(
                            children: [
                              Icon(Icons.support_agent_outlined,color: Colors.white,size: 28.sp,),
                              Text("Support",style: GoogleFonts.lato(color: Colors.white),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: imageWidget(),
                    ),
                    SizedBox(
                      height:2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person_outline_sharp,
                                color: appThemeColor,
                              ),
                              SizedBox(
                                width: 2.h,
                              ),
                              Text(
                                "${get_profile_details_data.data!.name}",
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.mail_outline_outlined,
                                color: appThemeColor,
                              ),
                              SizedBox(
                                width: 2.h,
                              ),
                              Text(
                                get_profile_details_data.data!.email.toString(),
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone_android,
                                color: appThemeColor,
                              ),
                              SizedBox(
                                width: 2.h,
                              ),
                              Text(
                                get_profile_details_data.data!.phone.toString(),
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => editProfilePagePage(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: profileListLeadingContainer(
                            Icon(
                              Icons.settings_suggest_outlined,
                              color: Colors.white,
                              size: 14.sp,
                            ),
                            context),
                        title: Text(
                          "Edit Profile",
                          style: profileOptionsStyle,
                        ),
                        trailing: profileListTrailingContainer(
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 14.sp,
                            ),
                            context),
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return EventCalendarScreen();
                          },
                        );
                      },
                      child: ListTile(
                        leading: profileListLeadingContainer(
                            Icon(
                              Icons.holiday_village_outlined,
                              color: Colors.white,
                              size: 14.sp,
                            ),
                            context),
                        title: Text(
                          "Apply Leave",
                          style: profileOptionsStyle,
                        ),
                        trailing: profileListTrailingContainer(
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 14.sp,
                            ),
                            context),
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Eng_Payout_list()),
                        );
                      },
                      child: ListTile(
                        leading: profileListLeadingContainer(
                            Icon(
                              Icons.payment_outlined,
                              color: Colors.white,
                              size: 14.sp,
                            ),
                            context),
                        title: Text(
                          "PayOut",
                          style: profileOptionsStyle,
                        ),
                        trailing: profileListTrailingContainer(
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 14.sp,
                            ),
                            context),
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Eng_FAQ_Page(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: profileListLeadingContainer(
                            Icon(
                              Icons.question_answer_outlined,
                              color: Colors.white,
                              size: 14.sp,
                            ),
                            context),
                        title: Text(
                          "FAQ",
                          style: profileOptionsStyle,
                        ),
                        trailing: profileListTrailingContainer(
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 14.sp,
                            ),
                            context),
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    InkWell(
                      onTap: () async {
                        await is_update_active_controller()
                            .is_update_ENG_active_controller_method(false);
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        await preferences.clear();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (c) => Login_Page()),
                            (route) => false);
                      },
                      child: ListTile(
                        leading: profileListLeadingContainer(
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 14.sp,
                            ),
                            context),
                        title: Text(
                          "Logout",
                          style: profileOptionsStyle,
                        ),
                        trailing: profileListTrailingContainer(
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 14.sp,
                            ),
                            context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
  }

  void get_profile_details_data_method() async {
    get_profile_details_data = await get_profile_details_controller()
        .get_profile_details_controller_method();
    nameController.text = get_profile_details_data.data!.name.toString();
    phoneController.text = get_profile_details_data.data!.phone.toString();
    print(get_profile_details_data);
    if (get_profile_details_data.status.toString() == "true") {
      setState(() {
        is_load_profile_details_data = true;
      });
    }
  }
}
