import 'package:cloverleaf_project/constant/colorConstant.dart';
import 'package:flutter/material.dart';

class PayoutSE extends StatefulWidget {
  const PayoutSE({super.key});

  @override
  State<PayoutSE> createState() => _PayoutSEState();
}

class _PayoutSEState extends State<PayoutSE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PayoutPage"), backgroundColor: appThemeColor),
    );
  }
}
