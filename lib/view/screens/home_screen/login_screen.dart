import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/main.dart';
import 'package:getx/view/widget/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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


          ],
        ),
      ),
    );
  }
}
