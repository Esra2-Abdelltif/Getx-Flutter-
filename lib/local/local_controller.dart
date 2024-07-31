import 'dart:ui';

import 'package:get/get.dart';
import 'package:getx/main.dart';

class MyLocalController extends GetxController{
   Locale initialLang =sharedPreferences!.getString("lang")==null?Get.deviceLocale!:Locale("${sharedPreferences!.getString("lang")}");
  void changeLang(String langCode){
    Locale locale =Locale(langCode);
    sharedPreferences!.setString("lang", langCode);
    Get.updateLocale(locale);
  }
}