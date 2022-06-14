import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 150, top: 220),
      child: InkWell(
        onTap: () {},
        child: Icon(
          Icons.play_circle_fill,
          color: Color(0xff22A2BD),
          size: 110,
        ),
      ),
    );
  }
}
