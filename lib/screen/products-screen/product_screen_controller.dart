
import 'package:dashboard_admin/screen/products-screen/create_prdouct_screen.dart';
import 'package:dashboard_admin/screen/products-screen/product_page.dart';
import 'package:get/get.dart';

class ProductScreenController extends GetxController{
  final _currentIndex = 0.obs;
  RxInt get currentIndex => _currentIndex;

  final screens = [
    ProductPage(),
    CreateProductScreen()
  ];

  void toggleChange(int index){
    _currentIndex.value = index;
  }
}