import 'dart:convert';

import 'package:get/get.dart';
import 'package:logiology/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  
var productList = <Product>[].obs;
var isLoading = true.obs; 

@override
  void onInit() {
   
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var products = data['products'] as List;
        productList.value = products.map((e) => Product.fromJson(e)).toList();
      }



    }catch(e){
      Get.snackbar("Error", "Failed to load products");
    }
    finally {
      isLoading(false);
    }
  }

}