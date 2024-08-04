import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ArgumentsController extends GetxController{
String? name;
@override
  void onInit(){
  name=Get.arguments["name"];

  super.onInit();


}
}