import 'package:cloverleaf_project/controller/Get_SE_get_transaction_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/colorConstant.dart';
import '../../../model/GetPayoutSETransactionListModel.dart';

class SEViewDetailsPayout extends StatefulWidget {
  var payout_id;
  var work_id;

  SEViewDetailsPayout(
      {required this.payout_id, required this.work_id, super.key});

  @override
  State<SEViewDetailsPayout> createState() => _SEViewDetailsPayoutState();
}

class _SEViewDetailsPayoutState extends State<SEViewDetailsPayout> {
  bool is_load_SE_transaction_list = false;
  late GetPayoutSeTransactionListModel get_SE_transaction_list;
  bool startAnimation = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
    get_SE_transaction_list_method();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: is_load_SE_transaction_list
          ? Scaffold(
              appBar: AppBar(
                elevation: 0,
                leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios)),
                title: Text(
                  "Work Order Id - #${widget.work_id}",
                  style: GoogleFonts.lato(fontSize: 18.sp),
                ),
                backgroundColor: appThemeColor,
              ),
              backgroundColor: appThemeColor,
              body: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: Colors.white,
                ),
                child: Container(
                  height: 90.h,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        if (get_SE_transaction_list.data!.isNotEmpty) ...[
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Txn Id",
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      "Date",
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Paid Amount",
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp),
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 2.h,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: get_SE_transaction_list.data!.length,
                            itemBuilder: (BuildContext context, i) {
                              return widgetPayoutEngTxn(i);
                            },
                          ),
                        ] else ...[
                          Container(
                            height: 70.h,
                            child: Center(
                              child: Text(
                                "No Transaction data available!!!",style: GoogleFonts.lato(color: Colors.red),
                              ),
                            ),
                          )
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: Colors.white,
                ),
                child: Center(
                  child: CircularProgressIndicator(
                    color: appThemeColor,
                  ),
                ),
              ),
            ),
    );
  }

  Widget widgetPayoutEngTxn(int i) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300 + (i * 500)),
      curve: Curves.easeInOut,
      transform: Matrix4.translationValues(startAnimation ? 0 : 100.h, 0, 0),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.h),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  get_SE_transaction_list.data![i].transactionId.toString(),
                  style: GoogleFonts.rubik(fontSize: 10.sp),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  get_SE_transaction_list.data![i].date.toString(),
                  style: GoogleFonts.rubik(fontSize: 10.sp),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Icon(
                      Icons.currency_rupee_sharp,
                      color: appThemeColor,
                      size: 12.sp,
                    ),
                    Text(
                      get_SE_transaction_list.data![i].amount.toString(),
                      style: GoogleFonts.rubik(fontSize: 10.sp),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void get_SE_transaction_list_method() async {
    get_SE_transaction_list = await Get_SE_get_transaction_list_controller()
        .Get_SE_get_transaction_list_controller_method(widget.payout_id);
    if (get_SE_transaction_list.status.toString() == "true") {
      setState(() {
        is_load_SE_transaction_list = true;
      });
    }
  }
}
