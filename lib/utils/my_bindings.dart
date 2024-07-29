import 'package:get/get.dart';
import 'package:getx/controller/counter_controller/get_x_and_obx%20_counter_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(GetXAndObxCounterController());
  }
}