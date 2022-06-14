import 'package:flutter/material.dart';

class CustomEpizods extends StatelessWidget {
  final String text;
  final String image;
  final String text2;
  final String textData;
  const CustomEpizods({
    Key? key,
    required this.text,
    required this.image,
    required this.text2,
    required this.textData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 17, right: 17),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 7),
            width: 60,
            height: 60,
            child: Image.asset('assets/images/$image.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Color(0xff22A2BD),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text(
                  text2,
                  style: TextStyle(
                    color: Color(0xff0B1E2D),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                textData,
                style: TextStyle(
                  color: Color(0xff828282),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
