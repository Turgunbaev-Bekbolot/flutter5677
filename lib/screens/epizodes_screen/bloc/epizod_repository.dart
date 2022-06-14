import 'package:rick_and_morty_app/models/epizod_model.dart';
import 'package:rick_and_morty_app/screens/epizodes_screen/bloc/epizod_provider.dart';

class EpizodRaepository {
  Future<List<EpizodModel>> getEpizod() {
    EpizodProvider provider = EpizodProvider();
    return provider.getEpizod();
  }
}
