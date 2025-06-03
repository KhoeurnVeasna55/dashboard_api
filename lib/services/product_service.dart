import 'dart:convert';
import 'dart:developer';

import 'package:dashboard_admin/core/URL/url.dart';
import 'package:dashboard_admin/models/product_model.dart';
import 'package:dashboard_admin/services/store_token.dart';
import 'package:http/http.dart' as http;

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
}