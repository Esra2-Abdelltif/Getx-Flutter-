import 'package:get/get.dart';

class GetXAndObxCounterController extends GetxController{
  RxInt counter=0.obs;
  void increment(){
    counter++;
  }
  void decrement(){
    counter--;

  }
}