import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/view/widget/custom_button.dart';

class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Show SnackBar",
      onTap: () {
        Get.snackbar("SnackBar title", "How Are you !",
            duration: const Duration(seconds: 1),
            snackPosition: SnackPosition.BOTTOM,
            // backgroundColor: Colors.grey,
            colorText: Colors.blue);
      },
    );
  }
}
