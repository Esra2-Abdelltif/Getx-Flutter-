
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/main.dart';
import 'package:getx/view/widget/custom_button.dart';

class SuperScreen extends StatelessWidget {
  const SuperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Super Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${sharedPreferences!.getString("id")}"),
            const SizedBox(height: 20,),

            CustomButton(
              text: "Sing Out",
              onTap: () {
                sharedPreferences!.clear();
                Get.offAllNamed("/");
              },
            ),


          ],
        ),
      ),
    );
  }
}

