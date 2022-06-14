import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/screens/epizodes_screen/custom_epizods.dart';
import 'package:rick_and_morty_app/screens/epizodes_screen/epizodes_screen.dart';
import 'package:rick_and_morty_app/screens/personages_screen/info_of_personage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonageInformation extends StatelessWidget {
  const PersonageInformation({
    Key? key,
  }) : super(key: key);

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
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 375.w,
                  height: 218.h,
                  child: Image.asset(
                    'assets/images/mootrick.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 138.h, left: 123.w),
                  width: 146,
                  height: 146,
                  decoration: BoxDecoration(
                    border: Border.all(width: 8, color: Colors.white),
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Image.asset('assets/images/rick.png'),
                ),
              ],
            ),
            Text(
              'Рик Санчез',
              style: TextStyle(
                color: Color(0xff0B1E2D),
                fontSize: 34.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'живой',
              style: TextStyle(
                color: Color(0xff43D049),
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 20,
              ),
              child: SizedBox(
                width: 343.w,
                height: 80.h,
                child: Text(
                  'Главный протагонист мультсериала «Рик и Морти». Безумный ученый, чей алкоголизм,безрассудность и социопатия заставляют беспокоиться семью его дочери.',
                  style: TextStyle(
                    height: 1.5,
                    color: Color(0xff0B1E2D),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            InfoOfPersonage(
              text: 'Пол',
              text2: 'Мужской',
              isBool: true,
              cont: SizedBox(),
            ),
            InfoOfPersonage(
              text: 'Место рождения',
              text2: 'Земля С-137',
              cont: SizedBox(
                width: 90,
              ),
              isBool: false,
            ),
            InfoOfPersonage(
              text: 'Местоположение',
              text2: 'Земля (Измерение подменны)',
              cont: SizedBox(),
              isBool: false,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width,
              height: 2,
              color: Color(0xffF2F2F2),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Эпизоды',
                    style: TextStyle(
                      color: Color(0xff0B1E2D),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => EpizodesScreen())));
                    },
                    child: Text(
                      'Все эпизоды',
                      style: TextStyle(
                        color: Color(0xff828282),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomEpizods(
              text: 'Серия 1',
              text2: 'Пилот',
              textData: '2 декабря 2013',
              image: 'one',
            ),
            CustomEpizods(
              text: 'Серия 2',
              text2: 'Пёс-газонокосильщик',
              textData: '9 декабря 2013',
              image: 'two',
            ),
            CustomEpizods(
              text: 'Серия 3',
              text2: 'Анатомический парк',
              textData: '16 декабря 2013',
              image: 'three',
            ),
          ],
        ),
      ),
    );
  }
}
