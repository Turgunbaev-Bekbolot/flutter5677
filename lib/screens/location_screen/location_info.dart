import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/screens/location_screen/bloc/location_bloc.dart';
import 'package:rick_and_morty_app/screens/personages_screen/personage_information.dart';
import 'package:rick_and_morty_app/screens/personages_screen/personage_widgets.dart';

class LocationInfo extends StatefulWidget {
  final String image;
  final String discription;

  const LocationInfo({
    Key? key,
    required this.image,
    required this.discription,
  }) : super(key: key);

  @override
  State<LocationInfo> createState() => _LocationInfoState();
}

class _LocationInfoState extends State<LocationInfo> {
  late LocationBloc locationBloc;

  @override
  void initState() {
    locationBloc = LocationBloc();
    locationBloc.add(GetLocationEvent());
    super.initState();
  }

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
      body: BlocConsumer<LocationBloc, LocationState>(
        bloc: locationBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LocationFetchedState) {
            return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 298,
                  child: Image.network(
                    'https://static.wikia.nocookie.net/rickandmorty/images/4/43/Snake_Planet.png/revision/latest?cb=20191217203922',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 251),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Земля С-137',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
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
                            Container(
                              margin:
                                  EdgeInsets.only(top: 1, left: 5, right: 5),
                              width: 2,
                              height: 2,
                              color: Color(0xff828282),
                            ),
                            Text(
                              'Измерение С-137',
                              style: TextStyle(
                                color: Color(0xff828282),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          width: MediaQuery.of(context).size.width * 0.9147,
                          height: 80,
                          child: Text(
                            widget.discription,
                            style: TextStyle(
                              color: Color(0xff0B1E2D),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Text(
                          'Персонажи',
                          style: TextStyle(
                            color: Color(0xff0B1E2D),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(0),
                            scrollDirection: Axis.vertical,
                            itemCount: state.locationModel!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              PersonageInformation())));
                                },
                                child: Personage(
                                  text: 'Рик Санчез',
                                  text2: 'Человек, Мужской',
                                  image: 'rick',
                                  isPersonage: false,
                                  isAlive: '',
                                  isIcon: true,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
