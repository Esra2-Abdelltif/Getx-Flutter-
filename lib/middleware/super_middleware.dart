import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuperMiddleware extends GetMiddleware{
  @override
  // Priority
  // The Order of the Middlewares to run can be set by the priority in the GetMiddleware.
  int? get priority => 1;

  bool myVar=false;
  @override
  RouteSettings? redirect(String? route) {
    if(myVar == true) return const RouteSettings(name: "/super");

  }
}