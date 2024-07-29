import 'package:get/get.dart';

class GetXAndObxCounterController extends GetxController{
  RxInt counter=0.obs;
  void increment(){
    counter++;
  }
  void decrement(){
    counter--;

  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}