import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/screens/setting_screen/edit_profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Настройки',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/morty.png',
                  width: 80.w,
                  height: 80.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Oleg Belotserkovsky',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Rick',
                      style: TextStyle(
                        color: Color(0xff828282),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => EditProfile())));
              },
              child: Container(
                margin: EdgeInsets.only(top: 20.h),
                alignment: Alignment.center,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Редактировать',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 55.h,
                bottom: 25.h,
              ),
              child: Text(
                'Внешний вид',
                style: TextStyle(
                  color: Color(0xff828282),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/group.png',
                  color: Colors.black,
                  width: 25.w,
                  height: 25.h,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Темная тема',
                      style: TextStyle(
                        color: Color(0xff0B1E2D),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Включена',
                      style: TextStyle(
                        color: Color(0xff828282),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xff0B1E2D),
                  size: 17,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: const Divider(
                thickness: 1,
              ),
            ),
            Text(
              'О приложении',
              style: TextStyle(
                color: Color(0xff828282),
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.h),
              width: 343.w,
              height: 60.h,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.',
                      style: TextStyle(
                        color: Color(0xff0B1E2D),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Text(
                'Версия приложения',
                style: TextStyle(
                  color: Color(0xff828282),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              'Rick & Morty v1 0.0',
              style: TextStyle(
                color: Color(0xff0B1E2D),
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
