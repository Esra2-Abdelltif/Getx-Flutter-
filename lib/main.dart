import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';
import 'package:getx/local/local.dart';
import 'package:getx/local/local_controller.dart';
import 'package:getx/middleware/auth_middleware.dart';
import 'package:getx/middleware/super_middleware.dart';
import 'package:getx/services/setting_service.dart';
import 'package:getx/view/screens/home_screen/admin_screen.dart';
import 'package:getx/view/screens/home_screen/argrument_screen.dart';
import 'package:getx/view/screens/home_screen/home_screen.dart';
import 'package:getx/view/screens/home_screen/super_screen.dart';
import 'package:getx/view/screens/route_management/route_management.dart';
import 'package:getx/view/screens/home_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
 SharedPreferences? sharedPreferences;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   sharedPreferences= await SharedPreferences.getInstance();
  await initalServices(); ///
  runApp((DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),
  )));

}
Future initalServices() async {
  print('starting services ...');
  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  await Get.putAsync(()=>SettingService().init());
  print('All services started...');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyLocalController controller=Get.put(MyLocalController());
    return GetMaterialApp(
      //لغه الجهاز
      // locale: Get.deviceLocale,
      locale: controller.initialLang,
      translations: MyLocal(),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      // home:   RouteManagement(),
      ///To call Binding
      // initialBinding: MyBindings(),
      getPages: [
        GetPage(name: "/",page:()=> const LoginScreen(),middlewares: [AuthMiddleware(),SuperMiddleware()] ),
        GetPage(name: "/home",page:()=>const HomeScreen() ),
        GetPage(name: "/super",page:()=>const SuperScreen() ),
        GetPage(name: "/admin",page:()=>const AdminScreen() ),

        ///To call Binding
        // GetPage(name: "/Next2Screen",page:()=>const NextScreenTwo(),binding: MyBindings() ),
    GetPage(name: "/NextScreen",page:()=>const NextScreen() ),
        GetPage(name: "/ArgumentsScreen",page:()=>const ArgumentsScreen() ),


      ],
    );
  }
}
