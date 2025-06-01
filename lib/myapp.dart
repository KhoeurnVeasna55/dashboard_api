import 'package:dashboard_admin/binding/binding.dart';
import 'package:dashboard_admin/core/theme/theme.dart';
import 'package:dashboard_admin/screen/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialBinding: Binding(),
      theme: AppTheme.darkTheme,
      home: LoginPage(),
    );
  }
}
