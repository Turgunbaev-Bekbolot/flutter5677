import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/screens/personages_screen/personage_widgets.dart';

class InfoOfEpizod extends StatelessWidget {
  const InfoOfEpizod({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 251),
      width: MediaQuery.of(context).size.width,
      height: 1000,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(26),
          topRight: Radius.circular(26),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 25,
          left: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                top: 60,
                bottom: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'М. Найт',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    ' Шьямал-Инопланетяне!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Серия 4',
                    style: TextStyle(
                      color: Color(0xff22A2BD),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Text(
                'Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.',
                style: TextStyle(
                  color: Color(0xff0B1E2D),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Премьера',
              style: TextStyle(
                color: Color(0xff828282),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '2 декабря 2013',
              style: TextStyle(
                color: Color(0xff0B1E2D),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Персонажи',
              style: TextStyle(
                color: Color(0xff0B1E2D),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Personage(
              text: 'Рик Санчез',
              text2: 'Человек, Мужской',
              image: 'rick',
              isPersonage: false,
              isAlive: '',
            ),
            Personage(
              text: 'Директор Агенства',
              text2: 'Человек, Мужской',
              image: 'director',
              isPersonage: false,
              isAlive: '',
            ),
            Personage(
              text: 'Морти Смит',
              text2: 'Человек, Мужской',
              image: 'morty',
              isPersonage: false,
              isAlive: '',
            ),
            Personage(
              text: 'Саммер Смит',
              text2: 'Человек, Женский',
              image: 'sammer',
              isPersonage: false,
              isAlive: '',
            ),
            Personage(
              text: 'Альберт Эйнштейн',
              text2: 'Человек, Мужской',
              image: 'einshtein',
              isPersonage: false,
              isAlive: '',
            ),
            Personage(
              text: 'Алан Райлс',
              text2: 'Человек, Мужской',
              image: 'alan',
              isPersonage: false,
              isAlive: '',
            ),
          ],
        ),
      ),
    );
  }
}
