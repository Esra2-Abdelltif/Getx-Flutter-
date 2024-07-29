import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/main.dart';

class AuthMiddleware extends GetMiddleware{
  @override
  int? get priority => 2;
  @override
  RouteSettings? redirect(String? route) {
   if(sharedPreferences!.getString("role")=="user") return const RouteSettings(name: "/home");
   if(sharedPreferences!.getString("role")=="admin") return const RouteSettings(name: "/admin");

  }
}