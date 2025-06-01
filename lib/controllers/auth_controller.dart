import 'dart:developer';
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/auth_service_api.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final userModel = [UserModel].obs;
  final currentUser = ''.obs;
  final token = '';

  Future<bool> login(String email, String password) async {
    try {
      isLoading.value = true;
      final result = await AuthServiceApi().login(email, password);
      return result;
    } catch (e) {
      log(' Error during login: $e');
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fecthUser(String token) async {
    try {
      isLoading.value = true;
    } catch (e) {
      log('error to fetch User $e');
    } finally {
      isLoading.value = false;
    }
  }
}
