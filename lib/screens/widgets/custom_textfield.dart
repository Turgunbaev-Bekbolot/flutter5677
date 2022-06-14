import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String text;
  final String text2;
  final TextEditingController textController;

  const CustomTextfield(
      {Key? key,
      required this.text,
      required this.text2,
      required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Color(0xff212121),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 7),
            width: MediaQuery.of(context).size.width * 0.8507,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xffF2F2F2),
            ),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                border: InputBorder.none,
                hintText: text2,
                hintStyle: TextStyle(
                  color: Color(0xff5B6975),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
