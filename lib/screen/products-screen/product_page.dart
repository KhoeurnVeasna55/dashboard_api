import 'package:dashboard_admin/controllers/product_controller.dart';
import 'package:dashboard_admin/screen/products-screen/product_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ProductController productController = Get.find();
    final ProductScreenController _productScreenController = Get.find();

    final List headerTabel = [
      'Image',
      'ID',
      'Title',
      'Categoty',
      'Brand',
      'Published',
      'Action',
    ];

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;

          return SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),

                  isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Theme.of(context).canvasColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Search',
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: theme.iconTheme.color,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(LucideIcons.plus),
                                    label:  Text('Create',style: Theme.of(context).textTheme.titleMedium,),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(LucideIcons.download),
                                    label: const Text('Excel'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Products',
                                style: theme.textTheme.titleLarge,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth * 0.2,
                                    height: 50,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Theme.of(
                                          context,
                                        ).canvasColor,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: BorderSide.none,
                                        ),
                                        hintText: 'Search',
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: theme.iconTheme.color,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      _productScreenController.toggleChange(1);
                                    },
                                    icon:  Icon(LucideIcons.plus, color: Colors.white,),
                                    label:  Text('Create',style: Theme.of(context).textTheme.titleSmall,),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    icon:  Icon(LucideIcons.download,color: Colors.white,),
                                    label:  Text('Excel',style: Theme.of(context).textTheme.titleSmall,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                  const SizedBox(height: 20),
                  Expanded(
                    child: isMobile
                        ? Obx(() {
                            final products =
                                productController.productRes.data?.products ??
                                [];
                            return ListView.builder(
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                final product = products[index];
                                return Card(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: ListTile(
                                    title: Text(product.name ?? ''),
                                    subtitle: Text(
                                      'Category: ${product.categoryId}\nPrice: \$${product.price} | Stock: ${product.stock}',
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.blue,
                                          ),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          })
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(
                                width: MediaQuery.of(context).size.width *0.87,
                                decoration: BoxDecoration(
                                  color: Color(0xFF171A3B),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Obx(() {
                                  if (productController.isLoading.isTrue) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  final data =
                                      productController.productRes.data;
                                  if (data == null || data.products.isEmpty) {
                                    return const Center(
                                      child: Text('No products found.'),
                                    );
                                  }

                                  final productdata = data.products;

                                  return DataTable(
                                    columnSpacing: 20,
                                    columns: headerTabel
                                        .map(
                                          (title) =>
                                              DataColumn(label: Text(title)),
                                        )
                                        .toList(),
                                    rows: productdata.map<DataRow>((product) {
                                      return DataRow(
                                        cells: [
                                          DataCell(
                                            product.images.isNotEmpty &&
                                                    product.images.first.url !=
                                                        null
                                                ? Image.network(
                                                    product.images.first.url!,
                                                    width: 40,
                                                    height: 40,
                                                  )
                                                : const Icon(
                                                    Icons.image_not_supported,
                                                  ),
                                          ),
                                          DataCell(
                                            Text(product.id?.toString() ?? ''),
                                          ),
                                          DataCell(Text(product.name ?? '')),
                                          DataCell(
                                            Text(
                                              product.categoryId?.toString() ??
                                                  '',
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              product.brand?.name ?? 'Unknown',
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              product.isActive == true
                                                  ? 'Yes'
                                                  : 'No',
                                            ),
                                          ),
                                          DataCell(
                                            Row(
                                              children: [
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.edit,
                                                    color: Colors.blue,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                  );
                                }),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
