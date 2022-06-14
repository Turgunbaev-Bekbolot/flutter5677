import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/screens/epizodes_screen/epizodes_screen.dart';
import 'package:rick_and_morty_app/screens/location_screen/location_screen.dart';
import 'package:rick_and_morty_app/screens/personages_screen/personage_screen.dart';
import 'package:rick_and_morty_app/screens/setting_screen/setting_screen.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      print(index);
      _selectedIndex = index;
    });
  }

  List<Widget> _bottomBarItems = const [
    PersonageScreen(),
    LocationScreen(),
    EpizodesScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomBarItems.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                'assets/images/rect1.png',
                color: Colors.blue,
              ),
            ),
            icon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                'assets/images/rect1.png',
                color: Color(0xffBDBDBD),
              ),
            ),
            label: "Персонажи",
          ),
          BottomNavigationBarItem(
            activeIcon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                'assets/images/rect2.png',
                color: Colors.blue,
              ),
            ),
            icon: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(
                'assets/images/rect2.png',
                color: Color(0xffBDBDBD),
              ),
            ),
            label: "Локации",
          ),
          BottomNavigationBarItem(
            activeIcon: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(
                'assets/images/rect3.png',
                color: Colors.blue,
              ),
            ),
            icon: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(
                'assets/images/rect3.png',
                color: Color(0xffBDBDBD),
              ),
            ),
            label: "Эпизоды",
          ),
          BottomNavigationBarItem(
            activeIcon: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(
                'assets/images/rect4.png',
                color: Colors.blue,
              ),
            ),
            icon: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(
                'assets/images/rect4.png',
                color: Color(0xffBDBDBD),
              ),
            ),
            label: "Настройки",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
        iconSize: 50,
        unselectedIconTheme: IconThemeData(
          color: Colors.green,
          opacity: 1.0,
          // size: 30,
        ),
        selectedIconTheme: IconThemeData(
          color: Colors.black,
          opacity: 1.0,
          size: 30,
        ),
      ),
    );
  }
}
