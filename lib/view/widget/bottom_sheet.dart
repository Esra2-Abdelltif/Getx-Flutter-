import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/view/widget/custom_button.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "BottomSheet",
      onTap: () {
        Get.bottomSheet(
            Container(
              height: context.height/3,
              width: context.width,
              color: Colors.white,
              child: const Text("BottomSheetWidget"),
            ),
          //الوقت الي بتظهر فيه
          enterBottomSheetDuration:const Duration(seconds: 4),
          //الوقت الي هتختفي فيه
            exitBottomSheetDuration:const Duration(seconds: 1),
            );
      },
    );
  }
}
