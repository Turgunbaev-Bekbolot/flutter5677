import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/screens/location_screen/location_info.dart';

class CustomButton extends StatelessWidget {
  final String location;
  final String image;
  final bool? isText;
  final String? allLocation;
  final String measurement;

  const CustomButton({
    required this.image,
    required this.location,
    this.isText,
    Key? key,
    this.allLocation,
    required this.measurement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9147,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9147,
            height: 68,
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(20),
              ),
              border: Border.all(
                width: 1,
                color: Colors.grey.shade300,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location,
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'Мир',
                        style: TextStyle(
                          color: Color(0xff828282),
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 1, left: 5, right: 5),
                        child: Container(
                          width: 2,
                          height: 2,
                          color: Color(0xff828282),
                        ),
                      ),
                      Text(
                        measurement,
                        style: TextStyle(
                          color: Color(0xff828282),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
