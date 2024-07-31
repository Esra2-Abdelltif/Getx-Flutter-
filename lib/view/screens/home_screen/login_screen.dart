import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/local/local_controller.dart';
import 'package:getx/main.dart';
import 'package:getx/services/setting_service.dart';
import 'package:getx/view/widget/custom_button.dart';

class LoginScreen extends GetView<SettingService> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //SettingService c=Get.find();
    MyLocalController localController =Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("home_key".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButton(
                    text: "اللفة العربية",
                    onTap: () {
                      localController.changeLang("ar");
                  
                      print("${localController.initialLang}");
                  
                    },
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: CustomButton(
                    text: "English",
                    onTap: () {
                      localController.changeLang("en");
                      print("${localController.initialLang}");
                  
                    },
                  ),
                ),
              ],
            ),


            const SizedBox(height: 20,),
            GetX<SettingService>(
                builder: (controller){
                  return   Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){
                          controller.increase();
                        }, icon:const Icon(Icons.add,size: 40,)),
                        const SizedBox(width: 20,),
                        Text("${controller.counter}"),
                        const SizedBox(width: 20,),

                        IconButton(onPressed: (){
                          controller.decrement();
                        }, icon:const Icon(Icons.remove,size: 40,)),

                      ],
                    ),
                  );
                })
            ,
            const SizedBox(height: 20,),
            CustomButton(
              text: "Admin",
              onTap: () {
                sharedPreferences!.setString("role", "admin");
                Get.offNamed("/admin");

              },
            ),
            const SizedBox(height: 20,),
            CustomButton(
              text: "Login",
              onTap: () {
                sharedPreferences!.setString("role", "user");
                sharedPreferences!.setString("id", "1");

                Get.offNamed("/home");

              },
            ),
            const SizedBox(height: 20,),
            CustomButton(
              text: "Home",
              onTap: () {
                Get.toNamed("/NextScreen");

              },
            ),


          ],
        ),
      ),
    );
  }
}
