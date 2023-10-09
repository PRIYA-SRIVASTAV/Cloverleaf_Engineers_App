import 'package:cloverleaf_project/controller/Get_Payout_Data_controller.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../model/GetPayoutDataModel.dart';

class PayoutPage extends StatefulWidget {
  const PayoutPage({super.key});

  @override
  State<PayoutPage> createState() => _PayoutPageState();
}

class _PayoutPageState extends State<PayoutPage> {
  late GetPayoutDataModel get_payout_data;
  bool is_load_payout_data = false;

  @override
  void initState() {
    super.initState();
    get_payout_data_method();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appThemeColor,
        centerTitle: true,
        title: const Text('My Payouts'),
      ),
      body: is_load_payout_data
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
              child: get_payout_data.data.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: get_payout_data.data.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 22.h,
                          child: Card(
                            shape: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.h, vertical: 2.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 3.h,
                                    width: 3.h,
                                    color: Colors.blue.withOpacity(0.3),
                                    child: Center(
                                      child: Text(
                                        "#${get_payout_data.data[index].workId}",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 12.h,
                                        width: 30.w,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Subject",
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                  ),
                                                ),
                                                Text(
                                                  "${get_payout_data.data[index].subject}",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.grey),
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Payout Date",
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                  ),
                                                ),
                                                Text(
                                                  "${get_payout_data.data[index].payoutDate.toString().substring(0, 10)}",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.grey),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 12.h,
                                        width: 30.w,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Amount",
                                                  style: TextStyle(
                                                    fontSize: 16.sp,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.currency_rupee,
                                                      size: 14.sp,
                                                    ),
                                                    Text(
                                                      "${get_payout_data.data[index].payout}",
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: appThemeColor),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text("${get_payout_data.message.toString()}")),
            )
          : Center(
              child: CircularProgressIndicator(color: appThemeColor,),
            ),
    );
  }

  void get_payout_data_method() async {
    get_payout_data =
        await Get_Payout_Data_controller().Get_Payout_Data_controller_method();
    setState(() {
      is_load_payout_data = true;
    });
  }
}
