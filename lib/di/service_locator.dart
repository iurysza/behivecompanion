import 'package:behivecompanion/data/ParseController.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt();

void setup() {

  sl.registerSingleton(ParseController());
}
