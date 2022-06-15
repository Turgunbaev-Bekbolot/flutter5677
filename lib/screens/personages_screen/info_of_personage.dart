import 'package:flutter/material.dart';

class InfoOfPersonage extends StatelessWidget {
  final String text;
  final String text2;
  final bool? isBool;
  final String? race;
  final Widget? cont;

  const InfoOfPersonage({
    Key? key,
    required this.text,
    required this.text2,
    this.isBool,
    this.cont,
    this.race,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 150,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Color(0xff828282),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  text2,
                  style: TextStyle(
                    color: Color(0xff0B1E2D),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          cont!,
          isBool!
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Расса',
                      style: TextStyle(
                        color: Color(0xff828282),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      race!,
                      style: TextStyle(
                        color: Color(0xff0B1E2D),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              : const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
