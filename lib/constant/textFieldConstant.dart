import 'package:cloverleaf_project/constant/testStyleConstant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'colorConstant.dart';


TextEditingController reasonController = TextEditingController();
TextEditingController hourSpent = TextEditingController();
TextEditingController searchController = TextEditingController();
var maxLength;
var minLines;

Widget textFieldContainer(controller, context, text, icons) {
  return TextFormField(
    onChanged: (value) {
      // setState(() {
      //   textValue = value;
      // });
    },
    onTap: () {},
    controller: controller,
    decoration: InputDecoration(
      prefixIcon: Icon(icons, color: appThemeColor),
      label: Text(
        text,
        style: textFieldTitleStyle,
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appThemeColor, width: 2.5.w),
          borderRadius: BorderRadius.circular(5)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}

Widget customTextField() {
  return TextField(
    controller: reasonController,
    decoration: InputDecoration(
      hintText: "Enter breakdown reason",
      hintStyle: TextStyle(fontSize: 10.sp, color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}

Widget hourSpentTextField() {
  return TextField(
    controller: hourSpent,
    textAlign: TextAlign.center,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(10.h, 10.0, 10.0, 10.0),
      hintText: "HH  :  MM",
      hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
      ),
    ),
  );
}

Widget searchTextField() {
  return TextField(
    controller: searchController,
    decoration: InputDecoration(
      hintText: 'Search Work Order',
      suffixIcon: IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => searchController.clear(),
      ),
      prefixIcon: IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {},
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  );
}

Widget workRequestTextFieldForm(controller, maxLength, maxLines) {
  return TextField(
    maxLength: maxLength,
    maxLines: maxLines,
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
