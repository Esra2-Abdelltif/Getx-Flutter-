import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/view/widget/custom_button.dart';

class ChangeThemes extends StatelessWidget {
  const ChangeThemes({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomButton(
      text: "Change Themes",
      onTap: () {
      if(Get.isDarkMode){
        Get.changeTheme(ThemeData.light());
      }
      else{
        Get.changeTheme(ThemeData.dark());
      }
      },
    );
  }
}
