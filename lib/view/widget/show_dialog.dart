import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/view/widget/custom_button.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomButton(
      text: "Show Dialog",
      onTap: () {
       Get.defaultDialog(
         title: "Show Dialog",
         middleText: "continue....",
         content: const Column(
           children: [
             Text("continue...."),
             SizedBox(height: 20,),
             Divider()

           ],
         ),
         actions: [
           CustomButton(
             text: "confirm",
             onTap: () {
               Get.back();
             },
           ),
           CustomButton(
             text: "Cancel",
             onTap: () {
               Get.back();
             },
           ),

         ]
         ,

         // cancel: CustomButton(
         //   text: "Cancel",
         //   onTap: () {
         //     Get.back();
         //   },
         // ),
         // confirm: CustomButton(
         //   text: "confirm",
         //   onTap: () {
         //     Get.back();
         //   },
         // ),
       );
      },
    );
  }
}
