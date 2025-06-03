import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'product_screen_controller.dart';

// ignore: must_be_immutable
class CreateProductScreen extends StatelessWidget {
  CreateProductScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _txtProductName = TextEditingController();
  final _txtDescription = TextEditingController();
  final _txtPrice = TextEditingController();
  final _txtMoreDetails = TextEditingController();

  final _categories = ['Electronics', 'Clothing', 'Books'];
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final productScreenController = Get.find<ProductScreenController>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0F2B),
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF171A3B),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                // Header
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => productScreenController.toggleChange(0),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(77),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(LucideIcons.arrowLeft),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Create New Product',
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Form
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildLabel('Product Name', context),
                          buildTextField(_txtProductName, 'Enter product name'),

                          buildLabel('Description', context),
                          buildTextField(_txtDescription, 'Enter description',
                              maxLines: 4),

                          buildLabel('Price', context),
                          buildTextField(_txtPrice, 'Enter price',
                              keyboardType: TextInputType.number),

                          buildLabel('Category', context),
                          DropdownButtonFormField<String>(
                            decoration: inputDecoration(),
                            dropdownColor: Colors.grey[850],
                            iconEnabledColor: Colors.white,
                            hint: const Text('Select category'),
                            items: _categories
                                .map((cat) => DropdownMenuItem(
                                      value: cat,
                                      child: Text(cat),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              selectedCategory = value;
                            },
                          ),

                          const SizedBox(height: 20),
                          buildLabel('Product Image', context),
                          Container(
                            width: double.infinity,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(77),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Icon(
                                LucideIcons.image,
                                size: 40,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                          buildLabel('More Details', context),
                          buildTextField(_txtMoreDetails, 'Enter more details'),

                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4F46E5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Submit form
                                }
                              },
                              child: const Text(
                                'Create Product',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLabel(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.white),
      ),
    );
  }

  Widget buildTextField(
    TextEditingController controller,
    String hintText, {
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: (value) => value == null || value.isEmpty
          ? 'This field cannot be empty'
          : null,
      decoration: inputDecoration(hintText: hintText),
    );
  }

  InputDecoration inputDecoration({String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.white.withAlpha(77),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    );
  }
}
