import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/commands/constans.dart';
import 'package:rick_and_morty_app/screens/auth_screen/sign_in_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    Constans.token = null;
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 375.w,
        child: Image.asset(
          'assets/images/start2.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Future navigate() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => LoginPassword())));
  }
}
