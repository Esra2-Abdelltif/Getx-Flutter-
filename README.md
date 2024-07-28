# Getx Flutter Package

GetX is an extra-light and powerful solution for Flutter. It combines high-performance state management, intelligent dependency injection, and route management quickly and practically.

## ⚡ Installation

To install getx Package, follow these steps

1. Add the package to your project's dependencies in the `pubspec.yaml` file:
   
   ```yaml
   dependencies:
      get: ^4.6.6
    ``` 
3. Run the following command to fetch the package:
    ``` 
    flutter pub get
    ``` 
## ⚡ Usage

1. Add "Get" before your MaterialApp, turning it into GetMaterialApp:
   
    ```
   void main() => runApp(GetMaterialApp(home: Home()));
    ```
## ⚡ Route management 

1. Navigate to a new screen::
   
    ```
   Get.to(NextScreen());
    ```   
2. To go to the next screen and no option to go back to the previous screen (for use in SplashScreens, login screens, etc.):
   
    ```
   Get.off(NextScreen());
    ```
3. To close snackbars, dialogs, bottomsheets, or anything you would normally close with Navigator.pop(context):
   
    ```
   Get.back();
    ```
 4. To go to the next screen and cancel all previous routes (useful in shopping carts, polls, and tests)
   
    ```
    Get.offAll(NextScreen());
    ```
 5. Navigate to new screen with name. See more details on named routes here

    ```
    Get.toNamed('/details');
    ```

## ⚡ State management 
Get has two different state managers: the simple state manager (we'll call it GetBuilder) and the reactive state manager (GetX/Obx).

## 📍 GetBuilder State management
1. create GetBuilderrController class extends GetxController:
 
    ```
   class GetBuilderCounterController extends GetxController {
     int counter=0;
     void increment(){
      counter++;
      update();
     }
   }
    
    ```
    upate() is required to change state
      
3. And in the UI, when you want to show that value and update the screen whenever the values changes, simply do this:
   
    ```
   GetBuilder<GetBuilderCounterController>(
    init: GetBuilderCounterController() ,
    builder: (controller){
        return Text("${controller.counter}"));
     }
    )

    ```
 ## 📍 Obx State management
1. create ObxrController class extends GetxController:
 
    ```
   class ObxCounterController extends GetxController {
     RxInt counter=0.obs;
     void increment(){
      counter++;
     }
   }
    ```
      
3. And in the UI, when you want to show that value and update the screen whenever the values changes, simply do this:
   
    ```
    final ObxCounterController controller =Get.put(GetXAndObxCounterController());

    Obx(() => Text("${controller.counter.value}"));
    
    ```    
   
## 📍 GetX State management
1. create GetXrController class extends GetxController:
 
    ```
   class GetXrController extends GetxController {
     RxInt counter=0.obs;
     void increment(){
      counter++;
     }
   }
    
    ```
     
3. And in the UI, when you want to show that value and update the screen whenever the values changes, simply do this:
   
    ```
   GetBuilder<GetXrController>(
    init: GetXrController() ,
    builder: (controller){
        return Text("${controller.counter.value}"));
     }
    )

    ```

