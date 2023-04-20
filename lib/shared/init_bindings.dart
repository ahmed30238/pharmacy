import 'package:get/get.dart';
import 'package:pharmacy/controller/get.dart';

class InitBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(Controller());
  }
}