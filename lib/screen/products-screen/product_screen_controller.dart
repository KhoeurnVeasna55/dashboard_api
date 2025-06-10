import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
// ignore: depend_on_referenced_packages
import 'package:mime/mime.dart';
import 'package:dashboard_admin/screen/products-screen/create_prdouct_screen.dart';
import 'package:dashboard_admin/screen/products-screen/product_page.dart';

class ProductScreenController extends GetxController {
  // Reactive Index for Tab Control
  final RxInt currentIndex = 0.obs;

  // Product Fields
  final Rx<File?> pickedImage = Rx<File?>(null);
  final RxString selectedCategory = RxString('');

  late TextEditingController productNameController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  late TextEditingController moreDetailsController;

  final screens = [ProductPage(), CreateProductScreen()];

  @override
  void onInit() {
    productNameController = TextEditingController();
    descriptionController = TextEditingController();
    priceController = TextEditingController();
    moreDetailsController = TextEditingController();
    super.onInit();
  }

  void toggleChange(int index) {
    currentIndex.value = index;
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    }
  }

  Future<void> uploadProduct() async {
    final uri = Uri.parse('https://your-api-url.com/api/upload');
    final request = http.MultipartRequest('POST', uri);

    if (pickedImage.value != null) {
      final mimeType = lookupMimeType(pickedImage.value!.path)?.split('/');
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          pickedImage.value!.path,
          contentType: MediaType(mimeType![0], mimeType[1]),
        ),
      );
    }

    request.fields['product_name'] = productNameController.text;
    request.fields['description'] = descriptionController.text;
    request.fields['price'] = priceController.text;
    request.fields['category'] = selectedCategory.value;
    request.fields['more_details'] = moreDetailsController.text;

    final response = await request.send();

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Product created successfully');
    } else {
      Get.snackbar('Error', 'Failed to create product');
    }
  }

  void submitProduct() {
    if (productNameController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Product Name is required.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (selectedCategory.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Category is required.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Proceed to upload
    uploadProduct();
  }

 
}