import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Personage extends StatelessWidget {
  final String text;
  final String text2;
  final String image;
  final bool isPersonage;
  final String isAlive;
  final bool? isIcon;

  const Personage({
    Key? key,
    required this.text,
    required this.text2,
    required this.image,
    required this.isPersonage,
    required this.isAlive,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isPersonage
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(200.r)),
                margin: const EdgeInsets.only(bottom: 0),
                width: 120.w,
                height: 122.h,
                child: ClipRRect(
                  child: Image.network(image),
                  borderRadius: BorderRadius.circular(200.r),
                ),
              ),
              Text(
                isAlive,
                style: TextStyle(
                  color: Color(0xff43D049),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Color(0xff0B1E2D),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                text2,
                style: TextStyle(
                  color: Color(0xff828282),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        : Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10, bottom: 27),
                width: 74.w,
                height: 74.h,
                child: Image.network(image),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isAlive,
                      style: TextStyle(
                        color: Color(0xff43D049),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        text,
                        style: TextStyle(
                          color: Color(0xff0B1E2D),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      text2,
                      style: TextStyle(
                        color: Color(0xff828282),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              isIcon!
                  ? Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 20,
                    )
                  : SizedBox(),
            ],
          );
  }
}
