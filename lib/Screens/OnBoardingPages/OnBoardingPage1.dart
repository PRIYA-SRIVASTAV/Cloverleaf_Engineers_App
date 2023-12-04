import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../Constants/colorConstants.dart';
import '../../Constants/stringConstants.dart';
import '../../Constants/textstyleConstants.dart';
import '../../utils/helperWidget.dart';
import '../CommonScreen/LoginPage.dart';
import 'OnBoardContent.dart';
import 'OnBoardData.dart';
import 'dotIndicator.dart';



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
          body:Stack(
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
                    SizedBox(height: 5.h,),
                    pageIndex == 3
                        ? SizedBox(
                      height: 5.5.h,
                      width: 60.w,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(
                                appThemeColor)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const Login_Page()),
                          );
                        },
                        child: Text(
                          getStarted,
                          style: getStartedStyle,
                        ),
                      ),
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          onBoardData.length,
                              (index) => Padding(
                            padding: EdgeInsets.only(
                                right: 4.w),
                            child: DotIndicator(
                                isActive:
                                index == pageIndex),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:5.h,left: 3.h,right: 3.h),
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
                                    builder: (context) => const Login_Page()),
                              );
                            },
                            child: Text(
                              skip,
                              style: skipColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
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
          )
      ),
    );
  }
}
