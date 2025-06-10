import 'package:dashboard_admin/screen/products-screen/product_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainProductScreen extends StatelessWidget {
   MainProductScreen({super.key});
  final ProductScreenController _productScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Obx(() => _productScreenController.screens[_productScreenController.currentIndex.value]),
    );
  }
} 