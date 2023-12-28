import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../constant/colorConstant.dart';
import '../../constant/stringsConstant.dart';
import '../../constant/testStyleConstant.dart';
import '../../utils/helperWidget.dart';
import '../commonScreens/Login_Page.dart';
import 'dotIndicator.dart';
import 'onBoardContent.dart';
import 'onBoardData.dart';

class OnBoardingPage1 extends StatefulWidget {
  const OnBoardingPage1({super.key});

  @override
  State<OnBoardingPage1> createState() => _OnBoardingPage1State();
}

class _OnBoardingPage1State extends State<OnBoardingPage1> {
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Onboarding_BackGround(),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 65.h,
                    child: PageView.builder(
                      itemCount: onBoardData.length,
                      controller: pageController,
                      onPageChanged: (index) {
                        setState(() {
                          pageIndex = index;
                        });
                      },
                      itemBuilder: (context, index) => OnBoardContent(
                        image: onBoardData[index].image,
                        title1: onBoardData[index].title1,
                        title2: onBoardData[index].title2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  pageIndex == 3
                      ? SizedBox(
                          width: 40.w,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColor),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login_Page()),
                              );
                            },
                            child: Text(
                              "Get Started",
                              style: GoogleFonts.lato(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                              onBoardData.length,
                              (index) => Padding(
                                padding: EdgeInsets.only(right: 4.w),
                                child: DotIndicator(isActive: index == pageIndex),
                              ),
                            )
                          ],
                        ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h, left: 3.h, right: 3.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login_Page(),
                              ),
                            );
                          },
                          child: Text(
                            skip,
                            style: GoogleFonts.lato(
                                fontSize: 12.sp, color: appThemeColor),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login_Page(),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            color: appThemeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
