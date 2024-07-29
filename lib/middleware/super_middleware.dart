import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuperMiddleware extends GetMiddleware{
  @override
  int? get priority => 1;

  bool myVar=false;
  @override
  RouteSettings? redirect(String? route) {
    if(myVar == true) return const RouteSettings(name: "/super");

  }
}