import 'dart:convert';
import 'dart:developer';

import 'package:dashboard_admin/core/URL/url.dart';
import 'package:dashboard_admin/models/product_model.dart';
import 'package:dashboard_admin/services/store_token.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ProductService {
  static Future<String?> _getToken() async {
    return await StoreToken().getToken();
  }

  static Future<ProductResponse> fetchAllProduct() async {
    final token = await _getToken();
    try {
      final url = Uri.parse('$URL/products/my-products');
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      log('Product response: ${response.body}');
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return ProductResponse.fromJson(responseData);
      } else {
        log('Failed to fetch products: ${response.statusCode}');
        return ProductResponse(success: false, data: null);
      }
    } catch (e) {
      log('Error to fetch Product by service: $e');
      return ProductResponse(success: false, data: null);
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      log('Picked image: ${pickedFile.path}');
    } else {
      log('No image selected.');
    }
  }
  Future<void> uploadImage() async {
    try {
      final token = await _getToken();
      final url = Uri.parse('$URL/products');
      final request = http.MultipartRequest('POST', url);
      request.headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'multipart/form-data',
      });

      final imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageFile != null) {
        request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
      } else {
        log('No image selected.');
        return;
      }

      final response = await request.send();
      if (response.statusCode == 200) {
        log('Image uploaded successfully');
      } else {
        log('Failed to upload image: ${response.statusCode}');
      }
    } catch (e) {
      log('Error uploading image: $e');
    }
  }
}
