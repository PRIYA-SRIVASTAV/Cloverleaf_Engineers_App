import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../assetFloatingActionScreens/assetScreen.dart';
import '../assetFloatingActionScreens/newWorkOrderScreen.dart';
import '../assetFloatingActionScreens/partScreen.dart';
import '../workRequestsTab/workRequestDetailPage.dart';

class MyCustomWidget extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget>
    with TickerProviderStateMixin {
  bool isTapped = true;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return FoldableOptions();
  }
}

class FoldableOptions extends StatefulWidget {
  @override
  _FoldableOptionsState createState() => _FoldableOptionsState();
}

class _FoldableOptionsState extends State<FoldableOptions>
    with SingleTickerProviderStateMixin {
  final List options = [
    Icons.settings,
    Icons.work_history_outlined,
    Icons.workspaces_rounded,
    Icons.create_new_folder_outlined,
  ];

  late Animation<Alignment> firstAnim;
  late Animation<Alignment> secondAnim;
  late Animation<Alignment> thirdAnim;
  late Animation<Alignment> fourthAnim;
  late Animation<double> verticalPadding;
  late AnimationController controller;
  final duration = Duration(milliseconds: 190);

  Widget getItem(IconData source) {
    final size = 45.0;
    return GestureDetector(
      // onTap: () {
      //   controller.reverse();
      // },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.blue.shade900,
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Icon(
          source,
          color: Colors.white.withOpacity(1.0),
          size: 20,
        ),
      ),
    );
  }

  Widget buildPrimaryItem(IconData source) {
    final size = 45.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Color(0XFFE95A8B).withOpacity(0.8),
        //     blurRadius: verticalPadding.value,
        //   ),
        // ],
      ),
      child: Icon(
        source,
        color: Colors.white.withOpacity(1),
        size: 20,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: duration);
    controller.forward(); // Start the animation

    final anim = CurvedAnimation(parent: controller, curve: Curves.linear);
    // firstAnim = Tween<Alignment>(begin: Alignment.centerRight, end: Alignment.topRight)
    firstAnim = Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomRight)
            .animate(anim);
    // secondAnim = Tween<Alignment>(begin: Alignment.centerRight, end: Alignment.topLeft)
    secondAnim = Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.bottomRight)
            .animate(anim);
    // thirdAnim = Tween<Alignment>(begin: Alignment.centerRight, end: Alignment.centerLeft)
    thirdAnim = Tween<Alignment>(
            begin: Alignment.centerLeft, end: Alignment.bottomRight)
        .animate(anim);
    // fourthAnim = Tween<Alignment>(begin: Alignment.centerRight, end: Alignment.bottomLeft)
    fourthAnim = Tween<Alignment>(
            begin: Alignment.bottomLeft, end: Alignment.bottomRight)
        .animate(anim);
    // fifthAnim = Tween<Alignment>(begin: Alignment.centerRight, end: Alignment.bottomRight)
    // fifthAnim = Tween<Alignment>(
    //         begin: Alignment.bottomRight, end: Alignment.bottomRight)
    //     .animate(anim);
    verticalPadding = Tween<double>(begin: 0, end: 26).animate(anim);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      // color: Colors.red,
      height: 30.h,
      margin: EdgeInsets.only(right: 15),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Stack(
            children: <Widget>[
              Align(
                alignment: firstAnim.value,
                child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        // return SignUpPage();
                        return floatAssetScreen();
                      }));
                    },
                    child: getItem(options.elementAt(0))),
              ),
              Align(
                alignment: secondAnim.value,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      // return SignUpPage();
                      return newWorkOrderFloatBtn();
                    }));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 37, top: verticalPadding.value),
                    child: getItem(options.elementAt(1)),
                  ),
                ),
              ),
              Align(
                alignment: thirdAnim.value,
                child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        // return SignUpPage();
                        return workRequestDetailPage();
                      }));
                    },
                    child: getItem(options.elementAt(2))),
              ),
              Align(
                alignment: fourthAnim.value,
                child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        // return SignUpPage();
                        return floatPartScreen();
                      }));
                    },
                    child: getItem(options.elementAt(3))),
              ),
              // Align(
              //   alignment: fifthAnim.value,
              //   child: getItem(options.elementAt(4)),
              // ),
              Positioned(
                right: 0.h,
                bottom: 0.h,
                child: GestureDetector(
                  onTap: () {
                    if (controller.isCompleted) {
                      controller.reverse();
                    } else {
                      controller.forward();
                    }
                  },
                  child: buildPrimaryItem(Icons.add),
                ),
              )
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child:
              // ),
            ],
          );
        },
      ),
    );
  }
}
