import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/screens/epizodes_screen/info_of_epizod.dart';
import 'package:rick_and_morty_app/screens/widgets/play_button.dart';

class ShowEpizodScreen extends StatelessWidget {
  const ShowEpizodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 298,
              child: Image.asset(
                'assets/images/image.png',
                fit: BoxFit.cover,
              ),
            ),
            InfoOfEpizod(),
            PlayButton(),
          ],
        ),
      ),
    );
  }
}
