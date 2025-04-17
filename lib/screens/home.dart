import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology/controllers/product_controller.dart';
//import 'package:logiology/screens/decoration/custom_textfield_decoration.dart';
import 'package:logiology/screens/profile_screen.dart';

class HomePage extends StatelessWidget {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products'),
        actions: [
          Row(
            children: [
              IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                showFilterDialog(context, productController);
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Get.to(() => ProfileScreen());
              },
            ),
          ],
        ),
   
    ],
    ),
      body: Obx(() {
        // return GridView.builder(
        //   padding: EdgeInsets.all(10),
        //   itemCount: productController.productList.length,          
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2, childAspectRatio: 0.7), 
        //   itemBuilder: (context,index){
        //     final product = productController.productList[index];
         return GridView.builder(
            itemCount: productController.filteredProducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2, childAspectRatio: 0.7), 
            itemBuilder: (context, index) {
              final product = productController.filteredProducts[index];
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
  
  void showFilterDialog(BuildContext context, ProductController productController) {

    String? selectedCategory;
    String? selectedTag;
    double? selectedPrice;

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('Filter Products'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Category'),//customInputDecoration('Category',Icons.search_rounded),
            onChanged: (value) => selectedCategory = value,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Tag'),
            onChanged: (value) => selectedTag = value,
          ),
          TextField(
            decoration:InputDecoration(labelText: 'Max Price'),// customInputDecoration('Max Price',Icons.search_rounded),
            keyboardType: TextInputType.number,
            onChanged: (value) =>
                selectedPrice = double.tryParse(value) ?? 0.0,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            productController.setFilters(
              category: selectedCategory,
              tag: selectedTag,
              price: selectedPrice,
            );
            Get.back(); // Close dialog
          },
          child: Text('Apply'),
        ),
      ],
    ),
  );

  }
}