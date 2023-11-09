import 'package:cloverleaf_project/controller/Login_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../constant/colorConstant.dart';
import '../../constant/testStyleConstant.dart';
import '../../utils/helperWidget.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Onboarding_BackGround(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 20.h
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                      width: 40.w,
                      child:
                          Image.asset('assets/images/Cloverleaf-gif-video.gif'),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "CLOVERLEAF",
                      style: appTitleStyle,
                    ),
                    Text(
                      "BUILDING THE FUTURE OF MACHINE SERVICE",
                      style: appSubTitleStyle,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Login to your Account',
                        style: GoogleFonts.lato(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    textFieldContainer(EmailController, context, "Email", Icons.email_outlined),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextFormField(
                      cursorColor: appThemeColor,
                      onChanged: (value) {
                        // setState(() {
                        //   textValue = value;
                        // });
                      },
                      onTap: () {},
                      obscureText: _obscureText,
                      controller: PasswordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: GoogleFonts.lato(color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                          color: appThemeColor,
                          onPressed: _togglePasswordVisibility,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: appThemeColor, width: 0.5.w),
                            borderRadius: BorderRadius.circular(5)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      height: 6.h,
                      width: 50.w,
                      child: FloatingActionButton(
                        onPressed: () async {
                          Login_Controller().Login_controller_method(
                              EmailController.text,
                              PasswordController.text,
                              context);
                        },
                        backgroundColor: appThemeColor,
                        shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Sign In",
                          style: TextStyle(fontSize: 20.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
