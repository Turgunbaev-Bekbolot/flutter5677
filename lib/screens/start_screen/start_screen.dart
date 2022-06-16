import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_app/commands/constans.dart';
import 'package:rick_and_morty_app/screens/auth_screen/sign_in_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/screens/widgets/custom_bottom_bar.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
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
    var box = Hive.box('tokenBox');
    String token = box.get('token', defaultValue: '');
    if (token == '') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => SignInScreen())));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => CustomBottomBar())));
    }
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => SignInScreen())));
  }
}
