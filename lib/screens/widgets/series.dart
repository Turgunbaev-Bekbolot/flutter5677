import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Series extends StatelessWidget {
  final String text;
  final bool? isColor;
  final bool? isCont;

  const Series({
    Key? key,
    required this.text,
    this.isColor = false,
    this.isCont = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 30.w),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: isColor! ? Color(0xff0B1E2D) : Color(0xffBDBDBD),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          isCont!
              ? Container(
                  width: 70.w,
                  height: 2.h,
                  color: Color(0xff0B1E2D),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
