import 'dart:convert';
import 'dart:developer';

import 'package:dashboard_admin/core/URL/url.dart';
import 'package:dashboard_admin/screen/auth/login_page.dart';
import 'package:dashboard_admin/services/store_token.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import '../models/user_model.dart';

class AuthServiceApi {
  Future<String?> _getToken() async {
    return await StoreToken().storeToken();
  }

  Future<bool> login(String email, String password) async {
    try {
      final url = Uri.parse('$URL/users/login');
      final response = await http.post(
        url,
        body: jsonEncode({'email': email, 'password': password}),
        headers: {
          'x-api-key': 'my_super_secret_key',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        final token = responseData['token'];
        await StoreToken().createToken(token);
        log('Token: $token');
        return true;
      } else {
        log('error to Login at Authservice ');
        return false;
      }
    } catch (e) {
      log('error to fetch current user');
      return false;
    }
  }

  Future<UserModel> fetchCurrentUser() async {
    final token = await _getToken();

    try {
      final uid = JwtDecoder.decode(token!)['_id'];

      final url = Uri.parse('$URL/users/profile/$uid');
      final response = await http.get(url, headers: {'Bearer Token': token});
      final bool hasExpired = JwtDecoder.isExpired(token);
      if (hasExpired) {
        Get.to(LoginPage());
        Get.snackbar('token Expired', 'Please log in again.');
        return UserModel.empty();
      }
      if (response.statusCode == 200) {
        final Map<String, dynamic> jwtResponsData = jsonDecode(response.body);
        return UserModel.fromJson(jwtResponsData);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      log('error to fetch crrent user $e');
      return UserModel.empty();
    }
  }
}
