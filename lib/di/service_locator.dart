import 'package:behivecompanion/data/services/parse_controller.dart';
import 'package:behivecompanion/data/repositories/auth/auth_repository.dart';
import 'package:behivecompanion/data/repositories/auth/auth_repository_impl.dart';
import 'package:behivecompanion/data/services/services_controller.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt();

GetIt injectDependencies() {
  serviceLocator.registerSingleton<ServicesController>(ServicesController(ParseController()));
  return serviceLocator;
}
