import 'package:get/get.dart';

class Controller extends GetxController {
  List<int> counters = [];

  void incrementCount({required int btnNum}) {
    counters[btnNum]++;
    update();
  }

  void decrementCount({required int btnNum}) {
    counters[btnNum]--;
    update();
  }
}
