import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/counter_controller/get_x_and_obx _counter_controller.dart';

class ObxCounterScreen extends StatelessWidget {
   ObxCounterScreen({super.key});
final GetXAndObxCounterController controller =Get.put(GetXAndObxCounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Obx Counter Screen"),),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(()=> Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  controller.increment();
                }, icon:const Icon(Icons.add,size: 40,)),
                const SizedBox(width: 20,),
                Text("${controller.counter.value}",style:const TextStyle(fontSize: 40),),
                const SizedBox(width: 20,),

                IconButton(onPressed: (){
                  controller.decrement();

                }, icon:const Icon(Icons.remove,size: 40,)),



              ],))

          ],
        ),
      ),
    );
  }
}
