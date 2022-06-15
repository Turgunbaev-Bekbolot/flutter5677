import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/screens/epizodes_screen/bloc/epizod_bloc.dart';
import 'package:rick_and_morty_app/screens/epizodes_screen/show_epizod_screen.dart';
import 'package:rick_and_morty_app/screens/widgets/custom_series.dart';
import 'package:rick_and_morty_app/screens/widgets/search_widget.dart';
import 'package:rick_and_morty_app/screens/widgets/series.dart';

class EpizodesScreen extends StatefulWidget {
  const EpizodesScreen({Key? key}) : super(key: key);

  @override
  State<EpizodesScreen> createState() => _EpizodesScreenState();
}

class _EpizodesScreenState extends State<EpizodesScreen> {
  late EpizodBloc epizodBloc;

  @override
  void initState() {
    epizodBloc = EpizodBloc();
    epizodBloc.add(GetEpizodEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<EpizodBloc, EpizodState>(
        bloc: epizodBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is EpizodFetchedState) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9147,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xffF2F2F2),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: SearchContainer(
                      hintText: 'Найти эпизод',
                      hasSuffixIcon: false,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 20,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.epizodModel!.length,
                        itemBuilder: (context, index) {
                          return Series(
                              text: state.epizodModel![index].episode!);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 11,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: state.epizodModel!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        ShowEpizodScreen())));
                          },
                          child: CustomSeries(
                            text: state.epizodModel![index].episode!,
                            text2: state.epizodModel![index].name!,
                            textData:
                                state.epizodModel![index].airDate!.toString(),
                            image: state.epizodModel![index].id.toString(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
