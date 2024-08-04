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
    Get.toNamed('/NextScreen');
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
## ⚡ Dependency management 

Get has a simple and powerful dependency manager that allows you to retrieve the same class as your Bloc or Controller with just 1 lines of code, no Provider context, no inheritedWidget:
 ```
Controller controller = Get.put(Controller()); // Rather Controller controller = Controller();
 ```
## ⚡ Bindings
Bindings are classes where we can declare our dependencies and then ‘bind’ them to the routes. However, this means that we can only use it when using GetX for route management.

1. start by creating a class that implements Bindings class.

 ```
 class HomeBinding implements Bindings {}
 ```

2. need to override the dependencies() method, where we’ll insert all our dependencies.

 ```
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<Controller1>(Controller1());
    Get.put<Controller2>(Controller2());
  }
}

 ```

3. we can ‘bind’ these dependencies to our routes.
 ```
 GetMaterialApp( // remember this?
  initialRoute: "/",
  getPages: [
    GetPage(name: "/", page: () => HomePage(), binding: HomeBinding()), // here!
  ],
 );
 
 Get.to(HomePage(), binding: HomeBinding()); // or like this!
 Get.toNamed("/", binding: HomeBinding()); // and this!
 ```
We can also set a Binding to create the dependencies as soon as the app starts, by declaring it as initialBinding.
 ```
GetMaterialApp(
  initialRoute: "/",
  initialBinding: HomeBinding(), // here!
);
```

GetX also provides BindingsBuilder that lets us use bindings without creating a separate class.
 ```
GetMaterialApp(
  initialRoute: "/",
  initialBinding: BindingsBuilder(() { // like this!
    Get.put(Controller());
  }),
);
 ```

4. to use access the dependencies, we can simply use Get.find.
 ```
class HomePage extends StatelessWidget {

  Controller controller = Get.find(); // it'll work!

}
 ```

## ⚡ Controller Life cycle
when extende from GetxController the GetxController have method
 ```
import 'package:get/get.dart';

class CountController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
 ```
- Update(): Using this, widgets can listen to the changes made by the methods defined in controller. It is similar to notifyListeners in providers

- onInit() : is equivalent the initState() in Stateful call when enter the page .

- onReady() : is call when the build widget is finished .

- onClose() : is equivalent the dispose() in Stateful.

## ⚡ GetPage Middleware
The GetPage has now new property that takes a list of GetMiddleWare and run them in the specific order.
Note: When GetPage has a Middlewares, all the children of this page will have the same middlewares automatically.
 ```
class MiddlewareClass extends GetMiddleware{
 
 // Priority 
// The Order of the Middlewares to run can be set by the priority in the GetMiddleware.
   @override
  int? get priority => 1;

//Redirect
//This function will be called when the page of the called route is being searched for. It takes RouteSettings as a result to redirect to. Or give it null and there will be no redirecting.
  bool myVar=false;
  @override
  RouteSettings? redirect(String? route) {
    if(myVar == true) return const RouteSettings(name: "/route");

  }
}
 ```
## ⚡ GetView
Is a const Stateless Widget that has a getter controller for a registered Controller, that's all.
 ```
class AwesomeController extends GetController {
   final String title = 'My Awesome View';
 }

  // ALWAYS remember to pass the `Type` you used to register your controller!
 class AwesomeView extends GetView<AwesomeController> {
   @override
   Widget build(BuildContext context) {
     return Container(
       padding: EdgeInsets.all(20),
       child: Text(controller.title), // just call `controller.something`
     );
   }
 }
```
## ⚡ GetxService
This class is like a GetxController, it shares the same lifecycle ( onInit(), onReady(), onClose()). But has no "logic" inside of it. It just notifies GetX Dependency Injection system, that this subclass can not be removed from memory.
So is super useful to keep your "Services" always reachable and active with Get.find().
 ```
Future<void> main() async {
  await initServices(); /// AWAIT SERVICES INITIALIZATION.
  runApp(SomeApp());
}

/// Is a smart move to make your Services intiialize before you run the Flutter app.
/// as you can control the execution flow (maybe you need to load some Theme configuration,
/// apiKey, language defined by the User... so load SettingService before running ApiService.
/// so GetMaterialApp() doesnt have to rebuild, and takes the values directly.
void initServices() async {
  print('starting services ...');
  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  await Get.putAsync(SettingsService()).init();
  print('All services started...');
}

class SettingsService extends GetxService {
  void init() async {
    print('$runtimeType delays 1 sec');
    await 1.delay();
    print('$runtimeType ready!');
  }
}
```
## ⚡ Translations 
Translations are kept as a simple key-value dictionary map. To add custom translations, create a class and extend Translations.
 ```
  import 'package:get/get.dart';
class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World',
        },
        'de_DE': {
          'hello': 'Hallo Welt',
        }
      };
}
 ```
1. Using translations
 ```
Using translations
 ```
2.Locales
Pass parameters to GetMaterialApp to define the locale and translations.
 ```
return GetMaterialApp(
    translations: Messages(), // your translations
    locale: Locale('en', 'US'), // translations will be displayed in that locale
    fallbackLocale: Locale('en', 'UK'), // specify the fallback locale in case an invalid locale is selected.
);
 ```
3. Change locale
Call Get.updateLocale(locale) to update the locale. Translations then automatically use the new local
 ```
var locale = Locale('en', 'US');
Get.updateLocale(locale);
 ```
4. System locale
To read the system locale, you could use Get.deviceLocale.
 ```
return GetMaterialApp(
    locale: Get.deviceLocale,
);
 ```

## ⚡Dialog Getx
    ```
    Get.defaultDialog();
    ```
## ⚡Dialog Getx
    ```
    Get.snackbar(title, message);
    ```  
## ⚡BottomSheet
    ```
    Get.bottomSheet(Widget ());
    ```  
 ## ⚡Get.arguments
    give the current args from currentScreen
    ```
    Get.toNamed("/screen",arguments:{ "name":"Esraa"   } );
    
    //Controller
    class ArgumentsController extends GetxController{
    String? name;
    @override
    void onInit(){
    name=Get.arguments["name"];
    super.onInit();
    }
    }
  ```  



