import 'dart:io';
import 'package:cloverleaf_project/controller/Get_Profile_Details_controller.dart';
import 'package:cloverleaf_project/controller/Update_profile_detail_controller.dart';
import 'package:cloverleaf_project/screens/EngineerScreen/Drawer/test_payroll_ui.dart';
import 'package:cloverleaf_project/screens/commonScreens/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'Leave_Request_calender.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/is_update_active_controller.dart';
import '../../../model/GetLeaveCalenderModel.dart';
import '../../../model/GetprofilePageModel.dart';
import '../../../utils/helperWidget.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  late GetProfileDetailsModel get_profile_details_data;
  late GetLeaveCalendarModel get_Leave_calendar_data;
  bool is_load_Leave_calendar_data = false;
  bool is_load_profile_details_data = false;
  bool on_leave_status = false;
  final noteController = TextEditingController();

  @override
  void initState() {
    get_profile_details_data_method();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();
    dateController.dispose();
    noteController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

  File? profileImage;

  Future getProfileImage(ImageSource source) async {
    try {
      final profileImage = await ImagePicker().pickImage(source: source);
      if (profileImage == null) return;

      final profileImageTemporary = File(profileImage.path);

      setState(() {
        this.profileImage = profileImageTemporary;
      });
    } catch (e) {
      print("Failed to pick image : $e");
    }
  }

  Widget imageWidget() {
    return profileImage == null
        ? Container(
            height: 20.h,
            width: 50.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/3135715.png"),
              ),
            ),
          )
        : Container(
            height: 30.h,
            width: 60.w,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                profileImage!,
                fit: BoxFit.cover,
              ),
            ),
          );
  }

  Widget editProfile(context) {
    return Dialog(
      child: Container(
        height: 80.h,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 2.h, right: 2.h, bottom: 4.h, top: 4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contact Details",
                      style: GoogleFonts.lato(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: appThemeColor),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Name",
                      style: GoogleFonts.lato(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      cursorColor: appThemeColor,
                      controller: nameController,
                      style: GoogleFonts.lato(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Email",
                      style: GoogleFonts.lato(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "${get_profile_details_data.data!.email.toString()}",
                      style: GoogleFonts.lato(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Mobile No.",
                      style: GoogleFonts.lato(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      cursorColor: appThemeColor,
                      style: GoogleFonts.rubik(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                      onTap: () {},
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        counterText: "",
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          child: Text(
                            "+91",
                            style: GoogleFonts.rubik(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54),
                          ),
                        ),
                      ),
                      controller: phoneController,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Address 1:",
                      style: GoogleFonts.lato(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      cursorColor: appThemeColor,
                      style: GoogleFonts.lato(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                      controller: address1Controller,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Address 2:",
                      style: GoogleFonts.lato(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      cursorColor: appThemeColor,
                      style: GoogleFonts.lato(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                      controller: address2Controller,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "City/Town:",
                      style: GoogleFonts.lato(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      cursorColor: appThemeColor,
                      style: GoogleFonts.lato(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                      controller: cityController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "State/Province:",
                      style: GoogleFonts.lato(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      cursorColor: appThemeColor,
                      style: GoogleFonts.lato(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                      controller: stateController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Zip/Postal Code:",
                      style: GoogleFonts.lato(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      cursorColor: appThemeColor,
                      style: GoogleFonts.lato(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                      controller: zipController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Update Password",
                      style: GoogleFonts.lato(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: appThemeColor),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Old Password",
                      style: GoogleFonts.lato(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      controller: oldPasswordController,
                      cursorColor: appThemeColor,
                      style: GoogleFonts.lato(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility),
                        hintText: "Enter Old Password",
                        hintStyle: GoogleFonts.lato(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "New Password",
                      style: GoogleFonts.lato(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      controller: newPasswordController,
                      cursorColor: appThemeColor,
                      style: GoogleFonts.lato(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility),
                        hintText: "Enter New Password",
                        hintStyle: GoogleFonts.lato(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Confirm Password",
                      style: GoogleFonts.lato(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      controller: confirmPasswordController,
                      cursorColor: appThemeColor,
                      style: GoogleFonts.lato(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility),
                        hintText: "Enter Confirm Password",
                        hintStyle: GoogleFonts.lato(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 5.h,
                          width: 25.w,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              side: BorderSide.none,
                              shape: const StadiumBorder(),
                            ),
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.lato(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 5.h,
                          width: 25.w,
                          child: ElevatedButton(
                            onPressed: () async {
                              await update_profile_detail_controller()
                                  .update_profile_detail_controller_method(
                                      nameController.text,
                                      phoneController.text,
                                      address1Controller.text,
                                      address2Controller.text,
                                      cityController.text,
                                      stateController.text,
                                      zipController.text,
                                      oldPasswordController.text,
                                      newPasswordController.text,
                                      confirmPasswordController.text,
                                      context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: appThemeColor,
                              side: BorderSide.none,
                              shape: const StadiumBorder(),
                            ),
                            child: Text(
                              "Update",
                              style: GoogleFonts.lato(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
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
                      child: Stack(
                        children: [
                          imageWidget(),
                          Positioned(
                            bottom: 0.h,
                            right: 1.5.h,
                            child: InkWell(
                              onTap: () {
                                getProfileImage(ImageSource.gallery);
                              },
                              child: Icon(
                                Icons.camera_alt_rounded,
                                color: appThemeColor,
                                size: 28.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                      height: 2.h,
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return editProfile(context);
                          },
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
    get_profile_details_data = await get_profile_details_controller().get_profile_details_controller_method();
    nameController.text = get_profile_details_data.data!.name.toString();
    phoneController.text = get_profile_details_data.data!.phone.toString();
    address1Controller.text = get_profile_details_data.data!.address1.toString();
    address2Controller.text = get_profile_details_data.data!.address2.toString();
    cityController.text = get_profile_details_data.data!.city.toString();
    stateController.text = get_profile_details_data.data!.state.toString();
    zipController.text = get_profile_details_data.data!.zipCode.toString();
    print(get_profile_details_data);
    if (get_profile_details_data.status.toString() == "true") {
      setState(() {
        is_load_profile_details_data = true;
      });
    }
  }

// void get_Leave_calendar_data_method() async {
//   get_Leave_calendar_data = await Get_Leave_calendar_controller()
//       .Get_Leave_calendar_controller_method();
//   print("/////////////// ${get_Leave_calendar_data}");
//   //noteController.text = get_Leave_calendar_data.data.note.toString();
//   setState(() {
//     if (get_Leave_calendar_data.status.toString() == "true") {
//       on_leave_status = true;
//       is_load_Leave_calendar_data = true;
//     } else {
//       on_leave_status = false;
//       is_load_Leave_calendar_data = true;
//     }
//   });
// }
}
