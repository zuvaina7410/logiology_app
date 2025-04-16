import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology/controllers/product_controller.dart';

class HomePage extends StatelessWidget {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products'),),
      body: Obx((){
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: productController.productList.length,          
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.7), 
          itemBuilder: (context,index){
            final product = productController.productList[index];
            return Card(
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Expanded(
                    child: Image.network(product.thumbnail, fit: BoxFit.cover, width: double.infinity),
                  ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("₹${product.price}", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                    child: Text("⭐ ${product.rating}"),
                  ),
                ],
              ),
            );
          },
          );
      })
    );
  }
}