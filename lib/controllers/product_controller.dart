import 'package:dashboard_admin/models/product_model.dart';
import 'package:dashboard_admin/services/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final Rx<ProductResponse> _productRes = Rx<ProductResponse>(
    ProductResponse(success: false, data: null),
  );


  ProductResponse get productRes => _productRes.value;
  RxBool isLoading = false.obs;
  Future<void> fetchAllProduct() async {
    isLoading.value = true;
    final data = await ProductService.fetchAllProduct();
    _productRes.value = data;
    isLoading.value = false;
  }
}
