import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/utils/my_bindings.dart';
import 'package:getx/view/screens/counter_screen/get_builder_counter_screen.dart';
import 'package:getx/view/widget/custom_button.dart';

class RouteManagement extends StatelessWidget {
   RouteManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Route Management"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CustomButton(
              text: "Page One",
              onTap: () {

                /// Navigator.push(context, MaterialPageRoute(builder: (context) => route,),);
                // Get.to(Route());

                /// Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => route,),);
                // Get.to(Route());

                ///To close snackbars, dialogs, bottomsheets, or anything you would normally close with Navigator.pop(context):
                //    Get.back();

                /// To go to the next screen and cancel all previous routes (useful in shopping carts, polls, and tests)
                // Get.offAll(Route());


                /// Navigate to new screen with name. See more details on named routes here
                // Get.toNamed("/NextScreen");
                // Get.offNamed("/NextScreen");
                // Get.offAllNamed("/NextScreen");
                ///To call Binding
                Get.to( GetBuilderCounterScreen(),binding: MyBindings());
              },
            ),


          ],
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          CustomButton(
            text: "NextScreen",
            onTap: () {
              Get.to(const NextScreenTwo());
            },
          ),
        ],),
      )
    );
  }
}
class NextScreenTwo extends StatelessWidget {
  const NextScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: "Next2Screen",
                onTap: () {
                  Get.offAll( RouteManagement());
                },
              ),
            ],),
        )
    );
  }
}
