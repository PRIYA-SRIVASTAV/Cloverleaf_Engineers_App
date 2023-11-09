import 'package:cloverleaf_project/constant/colorConstant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.5.h,
      width: 1.5.h,
      decoration: BoxDecoration(
        color: isActive ? Colors.grey.shade400 : Colors.white,
        border: Border.all(color:appThemeColor),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
