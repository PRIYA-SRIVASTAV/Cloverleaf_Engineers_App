import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../Constants/textstyleConstants.dart';

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    super.key,
    required this.image,
    required this.title1,
    required this.title2,
  });

  final String image, title1, title2;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              title1,
              style: titleStyle,
            ),
          ),
          SizedBox(height: 2.h,),
          Container(
            height: 40.h,
            width: 80.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(image), fit: BoxFit.contain),
            ),
          ),
          SizedBox(height: 2.h,),
          Text(title2, style: titleStyle),
        ]
      //   Column(
      //     children: [
      //       Stack(
      //         children: [
      //           SizedBox(
      //             height: 100.h,
      //             child: Column(
      //               children: [
      //                 Stack(
      //                   children: [
      //                     Positioned(
      //                        top: 15.h,
      //                        left: 3.w,
      //                        right: 3.w,
      //                       child: Center(
      //                         child: Text(
      //                           title1,
      //                           style: titleStyle,
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 Stack(
      //                   children: [
      //                     Positioned(
      //                       top: 20.h,
      //                       left: 3.w,
      //                       right: 3.w,
      //                       child: Center(
      //                         child: Text(title2, style: titleStyle),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Positioned(
      //             top: 25.h,
      //             left: 10.w,
      //             child: Container(
      //               height: 40.h,
      //               width: 80.w,
      //               decoration: BoxDecoration(
      //                 image: DecorationImage(
      //                     image: AssetImage(image), fit: BoxFit.contain),
      //               ),
      //             ),
      //           ),
      //         ],
      //       )
      //     ],
      //   ),
    );
  }
}
