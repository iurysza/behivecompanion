import 'package:behivecompanion/data/services/parse_controller.dart';
import 'package:behivecompanion/di/service_locator.dart';

class ServicesController {
  final ParseController parseController;

  ServicesController(this.parseController){
      parseController.initializeParse();
  }
}
