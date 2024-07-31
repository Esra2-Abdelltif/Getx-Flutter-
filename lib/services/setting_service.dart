import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingService extends GetxService {
  late SharedPreferences sharedPreferences;
RxInt counter=0.obs;
  Future<SettingService> init() async {
    //start Service
    sharedPreferences = await SharedPreferences.getInstance();
    counter.value= sharedPreferences.getInt("counter")??0;
    return this;
  }
  void decrement(){
    counter--;
    sharedPreferences.setInt("counter", counter.value);

  }
  void increase(){
    counter++;
    sharedPreferences.setInt("counter", counter.value);

  }

}
