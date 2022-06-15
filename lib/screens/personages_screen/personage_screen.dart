import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/commands/constans.dart';
import 'package:rick_and_morty_app/screens/personages_screen/bloc/personage_bloc.dart';
import 'package:rick_and_morty_app/screens/personages_screen/personage_information.dart';
import 'package:rick_and_morty_app/screens/personages_screen/personage_widgets.dart';
import 'package:rick_and_morty_app/screens/widgets/search_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonageScreen extends StatefulWidget {
  const PersonageScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PersonageScreen> createState() => _PersonageScreenState();
}

class _PersonageScreenState extends State<PersonageScreen> {
  late PersonageBloc personBloc;
  bool isListView = true;
  @override
  void initState() {
    print('1111111 ====== ${Constans.token}');
    personBloc = PersonageBloc();
    personBloc.add(GetPersonageEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 54, left: 15, right: 15),
      child: BlocConsumer<PersonageBloc, PersonageState>(
        bloc: personBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PersonageFetchedState) {
            return Column(
              children: [
                SearchContainer(
                  hintText: 'Найти персонажа',
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ВСЕГО ПЕРСОНАЖЕЙ: ${state.characterModel.length}',
                      style: TextStyle(
                        color: Color(0xff828282),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isListView = !isListView;
                        });
                      },
                      child: const Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: isListView
                        ? ListView.builder(
                            itemCount: state.characterModel.length,
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              PersonageInformation())));
                                },
                                child: Personage(
                                  text: state.characterModel[index].name!,
                                  text2:
                                      '${state.characterModel[index].type! != "" ? state.characterModel[index].type! + "," : ""} ${state.characterModel[index].gender}',
                                  image: state.characterModel[index].image!,
                                  isAlive: state.characterModel[index].status
                                      .toString(),
                                  isPersonage: false,
                                ),
                              );
                            }))
                        : GridView.builder(
                            itemCount: state.characterModel.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
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
                                  text: state.characterModel[index].name
                                      .toString(),
                                  text2:
                                      '${state.characterModel[index].type}, ${state.characterModel[index].gender}',
                                  image: state.characterModel[index].image!,
                                  isAlive: state.characterModel[index].status
                                      .toString(),
                                  isPersonage: true,
                                ),
                              );
                            })),
              ],
            );
          }
          return SizedBox();
        },
      ),
    ));
  }
}
