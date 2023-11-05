import 'dart:io';
import 'package:cloverleaf_project/screens/commonScreens/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../../../constant/colorConstant.dart';
import '../../../../constant/testStyleConstant.dart';
import '../../../../utils/helperWidget.dart';
import '../../../controller/Get_SE_profile_details_controller.dart';
import '../../../controller/Update_profile_detail_controller.dart';
import '../../../model/GetProfileSEModel.dart';
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

  late GetProfileSeDetailsModel get_SE_profile_details_data;
  bool is_load_SE_profile_details_data = false;

  @override
  void initState() {
    get_SE_profile_details_data_method();
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          if (is_load_SE_profile_details_data == true) ...[
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
                            "${get_SE_profile_details_data.data.name}",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.sp),
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
                            "${get_SE_profile_details_data.data.email}",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.sp),
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
                            "${get_SE_profile_details_data.data.phone}",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.sp),
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
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SEeditProfile(context);
                      },
                    );
                  },
                  child: ListTile(
                    leading: profileListLeadingContainer(
                        Icon(
                          Icons.settings_suggest_outlined,
                          color: Colors.white,
                          size: 18.sp,
                        ),
                        context),
                    title: Text(
                      "Edit Profile",
                      style: profileOptionsStyle,
                    ),
                    trailing: profileListTrailingContainer(
                        const Icon(Icons.arrow_forward_ios), context),
                  ),
                ),
                // SizedBox(
                //   height: 1.h,
                // ),
                // ListTile(
                //   leading: profileListLeadingContainer(
                //       Icon(
                //         Icons.holiday_village_outlined,
                //         color: Colors.white,
                //         size: 18.sp,
                //       ),
                //       context),
                //   title: Text(
                //     "Leave Calendar",
                //     style: profileOptionsStyle,
                //   ),
                //   trailing: InkWell(
                //     onTap: () {
                //       showDialog(
                //         context: context,
                //         builder: (context) {
                //           return EventCalendarScreen();
                //         },
                //       );
                //     },
                //     child: profileListTrailingContainer(
                //         const Icon(Icons.arrow_forward_ios), context),
                //   ),
                // ),
                SizedBox(
                  height: 1.h,
                ),
                InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PayoutSE()),
                    );
                  },
                  child: ListTile(
                    leading: profileListLeadingContainer(
                        Icon(
                          Icons.payment_outlined,
                          color: Colors.white,
                          size: 18.sp,
                        ),
                        context),
                    title: Text(
                      "PayOut",
                      style: profileOptionsStyle,
                    ),
                    trailing: profileListTrailingContainer(
                        const Icon(Icons.arrow_forward_ios), context),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                InkWell(
                  onTap: () async {

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
                          size: 18.sp,
                        ),
                        context),
                    title: Text(
                      "Logout",
                      style: profileOptionsStyle,
                    ),
                    trailing: profileListTrailingContainer(
                        const Icon(Icons.arrow_forward_ios), context),
                  ),
                ),
              ],
            ),
          ] else ...[
            Center(
              child: Column(
                children: [
                  CircularProgressIndicator(
                    color: appThemeColor,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget SEeditProfile(context) {
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
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: appThemeColor),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Name",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      get_SE_profile_details_data.data.email.toString(),
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
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
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      onTap: () {},
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        counterText: "",
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          child: Text("+91"),
                        ),
                      ),
                      controller: phoneController,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Address 1:",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
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
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
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
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
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
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
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
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      controller: zipController,
                      decoration: InputDecoration(
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
                          width: 30.w,
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
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.white),
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 5.h,
                          width: 30.w,
                          child: ElevatedButton(
                            onPressed: () async {
                              await update_profile_detail_controller()
                                  .Update_SE_Profile_details_controller_method(
                                      nameController.text,
                                      phoneController.text,
                                      address1Controller.text,
                                      address2Controller.text,
                                      cityController.text,
                                      stateController.text,
                                      zipController.text,
                                      context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: appThemeColor,
                              side: BorderSide.none,
                              shape: const StadiumBorder(),
                            ),
                            child: Text(
                              "Edit",
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
  }

  void get_SE_profile_details_data_method() async {
    get_SE_profile_details_data = await Get_SE_profile_details_controller()
        .get_profile_details_controller_method();
    nameController.text = get_SE_profile_details_data.data.name.toString();
    phoneController.text = get_SE_profile_details_data.data.phone.toString();
    address1Controller.text =
        get_SE_profile_details_data.data.address1.toString();
    address2Controller.text =
        get_SE_profile_details_data.data.address2.toString();
    cityController.text = get_SE_profile_details_data.data.city.toString();
    stateController.text = get_SE_profile_details_data.data.state.toString();
    zipController.text = get_SE_profile_details_data.data.zipCode.toString();
    print(get_SE_profile_details_data);
    if (get_SE_profile_details_data.status.toString() == "true") {
      setState(() {
        is_load_SE_profile_details_data = true;
      });
    }
  }
}
