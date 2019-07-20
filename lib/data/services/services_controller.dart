import 'package:behivecompanion/data/services/parse_controller.dart';

class ServicesController {
  final ParseController parseController;

  ServicesController(this.parseController) {
    parseController.initializeParse();
  }
}
