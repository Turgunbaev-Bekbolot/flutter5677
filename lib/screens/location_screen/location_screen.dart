import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/screens/location_screen/bloc/location_bloc.dart';
import 'package:rick_and_morty_app/screens/location_screen/custom_button.dart';
import 'package:rick_and_morty_app/screens/location_screen/location_info.dart';
import 'package:rick_and_morty_app/screens/widgets/search_widget.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 54, right: 16),
        child: BlocConsumer<LocationBloc, LocationState>(
          bloc: locationBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LocationFetchedState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchContainer(hintText: 'Найти локацию'),
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text(
                        'Всего локаций: ${state.locationModel!.length}',
                        style: TextStyle(
                          color: Color(0xff828282),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  Expanded(
                    flex: 3,
                    child: ListView.builder(
                      itemCount: state.locationModel!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => LocationInfo(
                                          discription: state
                                                  .locationModel?[index]
                                                  .dimension ??
                                              'test',
                                          image: state
                                              .locationModel![index].residents
                                              .toString(),
                                        ))));
                          },
                          child: CustomButton(
                            isText: true,
                            location: state.locationModel![index].type!,
                            image: state.locationModel![index].residents
                                .toString(),
                            measurement:
                                state.locationModel![index].name.toString(),
                          ),
                        );
                      },
                      scrollDirection: Axis.vertical,
                    ),
                  ),
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
