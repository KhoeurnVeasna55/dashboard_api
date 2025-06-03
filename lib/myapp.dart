import 'package:dashboard_admin/binding/binding.dart';
import 'package:dashboard_admin/controllers/auth_controller.dart';
import 'package:dashboard_admin/controllers/product_controller.dart';
import 'package:dashboard_admin/core/theme/theme.dart';
import 'package:dashboard_admin/screen/auth/login_page.dart';
import 'package:dashboard_admin/screen/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthController authController = Get.put(AuthController());
  final ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    authController.checkLogin();
    productController.fetchAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialBinding: Binding(),
        theme: AppTheme.darkTheme,
        home: authController.isLogin.isTrue ? MainPage() : LoginPage(),
      ),
    );
  }
}
