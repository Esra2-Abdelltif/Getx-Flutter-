import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';
import 'package:getx/view/screens/route_management/route_management.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp((DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),
  )));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(

       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RouteManagement(),
      getPages: [
        GetPage(name: "/Next2Screen",page:()=>NextScreenTwo() ),
    GetPage(name: "/NextScreen",page:()=>NextScreen() ),

      ],
    );
  }
}
