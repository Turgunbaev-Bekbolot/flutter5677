import 'package:flutter/material.dart';

class CustomSeries extends StatelessWidget {
  final String text;
  final String image;
  final String text2;
  final String textData;
  const CustomSeries({
    Key? key,
    required this.text,
    required this.image,
    required this.text2,
    required this.textData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 7, right: 10),
            width: 60,
            height: 60,
            child: Image.network(
                'https://www.looper.com/img/gallery/the-best-episodes-of-rick-and-morty-according-to-imdb/intro-1590084718.jpg'),
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
        ],
      ),
    );
  }
}
