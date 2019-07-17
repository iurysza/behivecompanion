import 'package:behivecompanion/data/ParseController.dart';
import 'package:behivecompanion/data/repositories/AuthRepository.dart';
import 'package:behivecompanion/data/repositories/AuthRepositoryImpl.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt();

void setup() {
  serviceLocator.registerSingleton<ParseController>(ParseController());
  serviceLocator.registerSingleton<AuthRepository>(AuthRepositoryImpl());
}
