// import 'package:cloverleaf_project/controller/Get_Payout_Data_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import '../../../constant/colorConstant.dart';
// import '../../../model/GetPayoutDataModel.dart';
//
// class PayoutPage extends StatefulWidget {
//   const PayoutPage({super.key});
//
//   @override
//   State<PayoutPage> createState() => _PayoutPageState();
// }
//
// class _PayoutPageState extends State<PayoutPage> {
//   late GetPayoutDataModel get_payout_data;
//   bool is_load_payout_data = false;
//
//   @override
//   void initState() {
//     super.initState();
//     get_payout_data_method();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(30.h), // Set the desired height
//         child: AppBar(backgroundColor: appThemeColor,
//           title: Text('Payroll'),
//         ),
//       ),
//       body:
//       // /*is_load_payout_data
//       //     ?*/ Padding(
//       //         padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
//       //         child: /*get_payout_data.data.isNotEmpty
//       //             ?*/ ListView.builder(
//       //                 shrinkWrap: true,
//       //                 physics: const BouncingScrollPhysics(
//       //                     parent: AlwaysScrollableScrollPhysics()),
//       //                 itemCount: 5,
//       //                 itemBuilder: (context, index) {
//       //                   return SizedBox(
//       //                     height: 22.h,
//       //                     child: Card(
//       //                       shape: OutlineInputBorder(
//       //                         borderSide:
//       //                             BorderSide(color: Colors.grey.shade200),
//       //                       ),
//       //                       child: Padding(
//       //                         padding: EdgeInsets.symmetric(
//       //                             horizontal: 2.h, vertical: 2.h),
//       //                         child: Column(
//       //                           crossAxisAlignment: CrossAxisAlignment.start,
//       //                           children: [
//       //                             Row(
//       //                               mainAxisAlignment:
//       //                                   MainAxisAlignment.spaceBetween,
//       //                               children: [
//       //                                 Container(
//       //                                   height:16.h,
//       //                                   width: 30.w,
//       //                                   child: Column(
//       //                                     mainAxisAlignment:
//       //                                         MainAxisAlignment.spaceBetween,
//       //                                     crossAxisAlignment:
//       //                                         CrossAxisAlignment.start,
//       //                                     children: [
//       //                                       Column(
//       //                                         crossAxisAlignment:
//       //                                         CrossAxisAlignment.start,
//       //                                         children: [
//       //                                           Text(
//       //                                             "#12",
//       //                                             style: TextStyle(
//       //                                               fontSize: 16.sp,
//       //                                             ),
//       //                                           ),
//       //                                           Text(
//       //                                             "Work Order Id",
//       //                                             style: TextStyle(
//       //                                                 fontSize: 12.sp,
//       //                                                 color: Colors.grey),
//       //                                           )
//       //                                         ],
//       //                                       ),
//       //                                       Column(
//       //                                         crossAxisAlignment:
//       //                                         CrossAxisAlignment.start,
//       //                                         children: [
//       //                                           Row(
//       //                                             children: [
//       //                                               Icon(Icons.currency_rupee_sharp),
//       //                                               Text(
//       //                                                 "2000.0",
//       //                                                 style: TextStyle(
//       //                                                   fontSize: 16.sp,
//       //                                                 ),
//       //                                               ),
//       //                                             ],
//       //                                           ),
//       //                                           Text(
//       //                                             "Paid Amount",
//       //                                             style: TextStyle(
//       //                                                 fontSize: 12.sp,
//       //                                                 color: Colors.grey),
//       //                                           )
//       //                                         ],
//       //                                       ),
//       //                                       Column(
//       //                                         crossAxisAlignment:
//       //                                         CrossAxisAlignment.start,
//       //                                         children: [
//       //                                           Row(
//       //                                             children: [
//       //                                               Icon(
//       //                                                 Icons.currency_rupee,
//       //                                                 size: 14.sp,
//       //                                               ),
//       //                                               Text(
//       //                                                 "8000.0",
//       //                                                 style: TextStyle(
//       //                                                     fontSize: 16.sp,
//       //                                                     fontWeight:
//       //                                                     FontWeight.bold,
//       //                                                     color: Colors.red
//       //                                                 ),
//       //                                               ),
//       //                                             ],
//       //                                           ),
//       //                                           Text(
//       //                                             "Pending Amount",
//       //                                             style: TextStyle(
//       //                                                 fontSize: 12.sp,
//       //                                                 color: Colors.grey
//       //                                             ),
//       //                                           )
//       //                                         ],
//       //                                       ),
//       //                                     ],
//       //                                   ),
//       //                                 ),
//       //                                 Container(
//       //                                   height: 16.h,
//       //                                   width: 30.w,
//       //                                   child: Column(
//       //                                     crossAxisAlignment:
//       //                                         CrossAxisAlignment.start,
//       //                                     children: [
//       //                                       Column(
//       //                                         crossAxisAlignment:
//       //                                         CrossAxisAlignment.start,
//       //                                         children: [
//       //                                           Row(
//       //                                             children: [
//       //                                               Icon(Icons.currency_rupee_sharp),
//       //                                               Text(
//       //                                                 "10000.0",
//       //                                                 style: TextStyle(
//       //                                                   fontSize: 16.sp,
//       //                                                   color: appThemeColor,
//       //                                                   fontWeight: FontWeight.bold
//       //                                                 ),
//       //                                               ),
//       //                                             ],
//       //                                           ),
//       //                                           Text(
//       //                                             "Total Amount",
//       //                                             style: TextStyle(
//       //                                                 fontSize: 12.sp,
//       //                                                 color: Colors.grey),
//       //                                           )
//       //                                         ],
//       //                                       ),
//       //                                     ],
//       //                                   ),
//       //                                 ),
//       //                               ],
//       //                             ),
//       //                           ],
//       //                         ),
//       //                       ),
//       //                     ),
//       //                   );
//       //                 },
//       //               )
//       //             /*: Center(
//       //                 child: Text("${get_payout_data.message.toString()}")),*/
//       //       )
//       //     /*: Center(
//       //         child: CircularProgressIndicator(color: appThemeColor,),
//       //       ),*/
//     );
//   }
//
//   void get_payout_data_method() async {
//     get_payout_data =
//         await Get_Payout_Data_controller().Get_Payout_Data_controller_method();
//     setState(() {
//       is_load_payout_data = true;
//     });
//   }
// }
//
