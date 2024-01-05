import 'dart:io';
import 'package:cloverleaf_project/controller/is_update_active_controller.dart';
import 'package:cloverleaf_project/screens/commonScreens/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../../../constant/colorConstant.dart';
import '../../../../constant/testStyleConstant.dart';
import '../../../../utils/helperWidget.dart';
import '../../../controller/Get_SE_profile_details_controller.dart';
import '../../../model/GetProfileSEModel.dart';
import 'SE_FAQ_Page.dart';
import 'SEeditProfilePage.dart';
import 'SEpayoutPage.dart';

class AppDrawerSE extends StatefulWidget {
  const AppDrawerSE({super.key});

  @override
  State<AppDrawerSE> createState() => _AppDrawerSEState();
}

class _AppDrawerSEState extends State<AppDrawerSE> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  late GetProfileSeDetailsModel get_SE_profile_details_data;
  bool is_load_SE_profile_details_data = false;

  @override
  void initState() {
    get_SE_profile_details_data_method();
    super.initState();
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
              child: get_SE_profile_details_data.data!.image!.isEmpty ||
                      get_SE_profile_details_data.data!.image!.toString() ==
                          "" ||
                      get_SE_profile_details_data.data!.image == null
                  ? Image.asset(
                      "assets/images/3135715.png",
                      fit: BoxFit.fill,
                    )
                  : Image.network(
                      get_SE_profile_details_data.data!.image!,
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

  @override
  Widget build(BuildContext context) {
    return is_load_SE_profile_details_data == true
        ? Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 15.h,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: appThemeColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Settings', style: dashboardStyle),
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
                      height: 5.h,
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
                                "${get_SE_profile_details_data.data!.name}",
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
                                "${get_SE_profile_details_data.data!.email}",
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
                                "${get_SE_profile_details_data.data!.phone}",
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
                      height: 2.h,
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SEeditProfilePage(),
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
                      height: 1.h,
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SE_Payout_list()),
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
                      height: 1.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SE_FAQ_Page(),
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
                      height: 1.h,
                    ),
                    InkWell(
                      onTap: () async {
                        await is_update_active_controller()
                            .is_update_SE_active_controller_method(false);
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

  void get_SE_profile_details_data_method() async {
    get_SE_profile_details_data = await Get_SE_profile_details_controller()
        .get_profile_details_controller_method();
    nameController.text = get_SE_profile_details_data.data!.name.toString();
    phoneController.text = get_SE_profile_details_data.data!.phone.toString();
    address1Controller.text =
        get_SE_profile_details_data.data!.address1.toString();
    address2Controller.text =
        get_SE_profile_details_data.data!.address2.toString();
    cityController.text = get_SE_profile_details_data.data!.city.toString();
    stateController.text = get_SE_profile_details_data.data!.state.toString();
    zipController.text = get_SE_profile_details_data.data!.zipCode.toString();
    print(get_SE_profile_details_data);
    if (get_SE_profile_details_data.status.toString() == "true") {
      setState(() {
        is_load_SE_profile_details_data = true;
      });
    }
  }
}
