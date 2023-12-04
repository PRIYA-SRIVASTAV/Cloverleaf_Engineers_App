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
      height: 2.h,
      width: 4.w,
      decoration: BoxDecoration(
        color: isActive ? Colors.grey.shade400 : Colors.white,
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
