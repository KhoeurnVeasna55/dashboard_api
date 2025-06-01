import 'package:dashboard_admin/controllers/auth_controller.dart';
import 'package:dashboard_admin/myapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await dotenv.load(fileName: ".env");
  Get.put(AuthController());
  runApp(const MyApp());
}
