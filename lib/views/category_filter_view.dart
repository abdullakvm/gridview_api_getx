import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gridview_api_getx/controllers/prodect_controller.dart';
import 'product_grid_view.dart';


class CategoryFilterView extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                productController.filterByCategory('electronics');
                Get.to(() => ProductGridView()); // Navigate to the filtered products grid view
              },
              child: Text('Electronics'),
            ),
            ElevatedButton(
              onPressed: () {
                productController.filterByCategory('jewelery');
                Get.to(() => ProductGridView());
              },
              child: Text('Jewellery'),
            ),
            ElevatedButton(
              onPressed: () {
                productController.filterByCategory("men's clothing");
                Get.to(() => ProductGridView());
              },
              child: Text('Men\'s Clothing'),
            ),
            ElevatedButton(
              onPressed: () {
                productController.filterByCategory("women's clothing");
                Get.to(() => ProductGridView());
              },
              child: Text('Women\'s Clothing'),
            ),
          ],
        ),
      ),
    );
  }
}
