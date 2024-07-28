import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/counter_controller/get_builder_counter_controller.dart';

class GetBuilderCounterScreen extends StatelessWidget {
  const GetBuilderCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Get Builder Counter Screen"),),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<GetBuilderCounterController>(
              init:GetBuilderCounterController() ,
                builder: (controller){
              return  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){
                    controller.increment();
                    }, icon:const Icon(Icons.add,size: 40,)),
                  const SizedBox(width: 20,),
                  Text("${controller.counter}",style:const TextStyle(fontSize: 40),),
                  const SizedBox(width: 20,),

                  IconButton(onPressed: (){
                    controller.decrement();

                  }, icon:const Icon(Icons.remove,size: 40,)),



                ],);
            })
           ,

          ],
        ),
      ),
    );
  }
}
