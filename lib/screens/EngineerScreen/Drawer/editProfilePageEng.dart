import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/colorConstant.dart';
import '../../../controller/Get_Profile_Details_controller.dart';
import '../../../controller/Update_profile_detail_controller.dart';
import '../../../model/GetprofilePageModel.dart';

class editProfilePagePage extends StatefulWidget {
  const editProfilePagePage({super.key});

  @override
  State<editProfilePagePage> createState() => _editProfilePagePageState();
}

class _editProfilePagePageState extends State<editProfilePagePage> {
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
  bool is_load_profile_details_data = false;

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
          get_profile_details_data.data!.image.toString(),
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
        backgroundColor: appThemeColor,
        title: Text(
          'Profile',
          style: GoogleFonts.lato(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: appThemeColor,
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          color: Colors.white,
        ),
        child: is_load_profile_details_data
            ? Padding(
                padding: EdgeInsets.only(
                    left: 4.h, right: 4.h, bottom: 4.h, top: 0.5.h),
                child: Column(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          imageWidget(),
                          Positioned(
                            bottom: 0.h,
                            right: 0.h,
                            child: InkWell(
                              onTap: () {
                                getProfileImage(ImageSource.gallery);
                              },
                              child: Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.blue.shade900,
                                size: 28.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Expanded(
                      child: ListView(
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
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: appThemeColor, width: 0.25.h),
                              ),
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
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: appThemeColor, width: 0.25.h),
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
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: appThemeColor, width: 0.25.h),
                              ),
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
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: appThemeColor, width: 0.25.h),
                              ),
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
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: appThemeColor, width: 0.25.h),
                              ),
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
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: appThemeColor, width: 0.25.h),
                              ),
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
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: appThemeColor, width: 0.25.h),
                              ),
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
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: appThemeColor, width: 0.25.h),
                              ),
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
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: appThemeColor, width: 0.25.h),
                              ),
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
                                  color: Colors.black54), border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: appThemeColor, width: 0.25.h),
                              ),
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
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
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
                                            profileImage,
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
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
      ),
    );
  }

  void get_profile_details_data_method() async {
    get_profile_details_data = await get_profile_details_controller()
        .get_profile_details_controller_method();
    nameController.text = get_profile_details_data.data!.name.toString();
    phoneController.text = get_profile_details_data.data!.phone.toString();
    address1Controller.text =
        get_profile_details_data.data!.address1.toString();
    address2Controller.text =
        get_profile_details_data.data!.address2.toString();
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
}
