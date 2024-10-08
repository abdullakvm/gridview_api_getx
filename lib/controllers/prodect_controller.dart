import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductController extends GetxController {
  var productList = <Welcome>[].obs;
  var filteredList = <Welcome>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  // Fetch products from API
  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  // Filter products based on category
  void filterByCategory(String category) {
    if (category == 'All') {
      filteredList.assignAll(productList); // Show all products
    } else {
      // Filter the productList by matching category name
      filteredList.assignAll(productList.where((p) => p.category.toLowerCase() == category.toLowerCase()).toList());
    }
  }
}
