import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchContainer extends StatelessWidget {
  final String hintText;
  final bool hasSuffixIcon;

  const SearchContainer({
    Key? key,
    required this.hintText,
    this.hasSuffixIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      decoration: BoxDecoration(
        color: Color(0xffF2F2F2),
        borderRadius: BorderRadius.circular(100),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6267,
        height: 24,
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 15.h),
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xff5B6975),
            ),
            suffixIcon: hasSuffixIcon
                ? SizedBox(
                    width: 10,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 2,
                          height: 24,
                          color: Color(0xffBDBDBD),
                        ),
                        SizedBox(
                          width: 16,
                          height: 17,
                          child: Image.asset('assets/images/lamp.png'),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xffBDBDBD),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
