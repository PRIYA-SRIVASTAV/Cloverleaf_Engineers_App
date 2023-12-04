import 'package:dmms/Constants/colorConstants.dart';
import 'package:dmms/Screens/CommonScreen/DrawerNavBar.dart';
import 'package:dmms/Screens/workRequestsTab/workRequestDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:sizer/sizer.dart';

class workRequestsPage extends StatefulWidget {
  const workRequestsPage({super.key});

  @override
  State<workRequestsPage> createState() => _workRequestsPageState();
}

class _workRequestsPageState extends State<workRequestsPage> {
  var getResult = 'QR Code Result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Work Request",
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        backgroundColor: appThemeColor,
        actions: [
          IconButton(
              onPressed: () {
                scanQRCode();
              },
              icon: Icon(
                Icons.qr_code_scanner,
                size: 20.sp,
                color: Colors.white,
              ))
        ],
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              )),
        ),
      ),
      drawer: const AppDrawer(),
      backgroundColor: appThemeColor,
      body: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.black54,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search Work Request",
                      hintStyle: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "4 active request",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      workRequestDetailPage()),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Center(
                                            child: Text(
                                          "#21",
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500),
                                        )),
                                        color: Colors.grey.shade300,
                                        height: 3.h,
                                        width: 15.w,
                                      ),
                                      Container(
                                        child: Center(
                                            child: Text(
                                          "Approved",
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        )),
                                        color: appThemeColor,
                                        height: 3.h,
                                        width: 20.w,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Pump problem",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.person_2_outlined,
                                              size: 12.sp,
                                              color: Colors.black54,
                                            ),
                                            SizedBox(
                                              width: 1.h,
                                            ),
                                            Text(
                                              "Requester",
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.clean_hands_outlined,
                                          size: 12.sp,
                                          color: Colors.black54,
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Text(
                                          "Flat bed Diectter",
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54),
                                        )
                                      ],
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
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_month,
                                              color: appThemeColor,
                                              size: 12.sp,
                                            ),
                                            SizedBox(
                                              width: 1.h,
                                            ),
                                            Text(
                                              "29-10-23",
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              "08:42",
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_today,
                                              color: appThemeColor,
                                              size: 12.sp,
                                            ),
                                            SizedBox(
                                              width: 1.h,
                                            ),
                                            Text(
                                              "19-11-23",
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              "08:42",
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });

      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }
}
