import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gridview_api_getx/controllers/prodect_controller.dart';

import '../models/product_model.dart';

class ProductGridView extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filtered Products')),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (productController.filteredList.isEmpty) {
          return Center(child: Text('No products found in this category.'));
        }
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: productController.filteredList.length,
          itemBuilder: (context, index) {
            final product = productController.filteredList[index];
            return ProductCard(product: product);
          },
        );
      }),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Welcome product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.image,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('\$${product.price.toString()}'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 16),
                SizedBox(width: 5),
                Text(product.rating.rate.toString()),
                SizedBox(width: 5),
                Text('(${product.rating.count} reviews)'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
