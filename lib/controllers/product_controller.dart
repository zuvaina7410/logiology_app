import 'dart:convert';

import 'package:get/get.dart';
import 'package:logiology/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  
// var productList = <Product>[].obs;
// var isLoading = true.obs; 

var allProducts = <Product>[].obs;
var filteredProducts = <Product>[].obs;

 // Store filters
  var selectedCategory = ''.obs;
  var selectedTag = ''.obs;
  var maxPrice = 0.0.obs;

@override
  void onInit() {
   
    fetchProducts();
    super.onInit();
  }

   void fetchProducts() async {
   final url = Uri.parse("https://dummyjson.com/products");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List<Product> products = (jsonData['products'] as List)
            .map((e) => Product.fromJson(e))
            .toList();

        allProducts.value = products;
        filteredProducts.value = products; // show all initially
      } else {
        Get.snackbar("Error", "Failed to load products");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    }
  }

  void setFilters({String? category, String? tag, double? price}) {
    selectedCategory.value = category ?? '';
    selectedTag.value = tag ?? '';
    maxPrice.value = price ?? 0.0;
    applyFilters();
  }

    void applyFilters() {
    filteredProducts.value = allProducts.where((product) {
      final matchCategory = selectedCategory.value.isEmpty ||
          product.category.toLowerCase() == selectedCategory.value.toLowerCase();

      final matchTag = selectedTag.value.isEmpty ||
          product.tags.any((t) => t.toLowerCase() == selectedTag.value.toLowerCase());

      final matchPrice = maxPrice.value == 0.0 ||
          product.price <= maxPrice.value;

      return matchCategory && matchTag && matchPrice;
    }).toList();
  }

 

}