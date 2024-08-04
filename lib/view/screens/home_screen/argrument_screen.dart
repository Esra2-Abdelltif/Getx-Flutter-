import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/arguments_controller.dart';

class ArgumentsScreen extends StatelessWidget {
  const ArgumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ArgumentsController contoller= Get.put(ArgumentsController());
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text("${contoller.name}"))
        ],

      ),
    );
  }
}
