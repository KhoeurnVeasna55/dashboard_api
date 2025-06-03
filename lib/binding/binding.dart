import 'package:dashboard_admin/controllers/auth_controller.dart';
import 'package:dashboard_admin/controllers/product_controller.dart';
import 'package:dashboard_admin/screen/products-screen/product_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut(()=> AuthController());
    Get.lazyPut(() => PageController());
    Get.lazyPut(() => ProductController());
    Get.lazyPut(() => ProductScreenController());
  }
}