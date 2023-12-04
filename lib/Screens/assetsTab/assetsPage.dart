import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:sizer/sizer.dart';
import '../../Constants/colorConstants.dart';
import '../../Constants/string.dart';
import '../CommonScreen/DrawerNavBar.dart';
import '../CommonScreen/floatingActionBtn.dart';
import 'asstesCardViewPage.dart';
import 'package:google_fonts/google_fonts.dart';

class assetsPage extends StatefulWidget {
  const assetsPage({super.key});

  @override
  State<assetsPage> createState() => _assetsPageState();
}

class _assetsPageState extends State<assetsPage> {
  var getResult = 'QR Code Result';

  final List<Map<String, dynamic>> _allAssets = [
    {
      "id": 1,
      "img": "assets/images/asset_2.webp",
      "name": "EXCELLENCE SERIES-BHT-1650FC",
      "address": "Shopfloor"
    },
    {
      "id": 1,
      "img": "assets/images/asset_2.webp",
      "name": "Printer Slotter with rotary diecutter",
      "address": "Shopfloor"
    },
    {
      "id": 1,
      "img": "assets/images/asset_3.jpg",
      "name": "Flute Laminator",
      "address": "Shopfloor"
    },
    {
      "id": 1,
      "img": "assets/images/asset_4.jpg",
      "name": "Offset Printing machine",
      "address": "Shopfloor"
    },
    {
      "id": 1,
      "img": "assets/images/asset_5.jpg",
      "name": "Flat bed Diecutter",
      "address": "Shopfloor"
    },
    {
      "id": 1,
      "img": "assets/images/asset_2.webp",
      "name": "Folder Gluer",
      "address": "Shopfloor"
    },
  ];

  List<Map<String, dynamic>> _foundAssets = [];

  @override
  void initState() {
    _foundAssets = _allAssets;
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allAssets;
    } else {
      results = _allAssets
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundAssets = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: appThemeColor,
        title: Text(
          assetTitle,
          style: GoogleFonts.roboto(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
          // GoogleFonts.roboto(
        ),
        actions: [
          IconButton(
              onPressed: () {
                scanQRCode();
              },
              icon: Icon(
                Icons.qr_code_scanner,
                size: 20.sp,
                color: Colors.white,
              ),
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
          ),
        ),
      ),
      drawer: const AppDrawer(),
      backgroundColor: appThemeColor,
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            color: Colors.grey.shade300),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) => _runFilter(value),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search, color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search Assets",
                    hintStyle: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500)),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _foundAssets.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 2),
                      child: Container(
                        width: 100.w,
                        height: 15.h,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.1),
                              blurRadius: 20.0, // soften the shadow
                              spreadRadius: 0.0, //extend the shadow
                              offset: const Offset(
                                5.0, // Move to right 10  horizontally
                                5.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AssetCardViewPage(
                                        TabIndex: 0,
                                      )),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 2,
                            key: ValueKey(_foundAssets[index]["id"]),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    child: Image.asset(
                                      _foundAssets[index]['img'],
                                      fit: BoxFit.cover,
                                      width: 20.w,
                                      height: 10.h,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _foundAssets[index]['name'],
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black54),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_city,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          _foundAssets[index]['address'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: MyCustomWidget(),
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
