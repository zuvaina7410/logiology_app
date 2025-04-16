class Product {
  final int id;
  final String title;
  final num price;
  final num rating;
  final String thumbnail;

  Product(
    {
    required this.id, 
    required this.title, 
    required this.price, 
    required this.rating, 
    required this.thumbnail
    }
    );
factory Product.fromJson(Map<String, dynamic> json){
  return Product(
    id: json['id'], 
    title: json['title'], 
    price: json['price'], 
    rating: json['rating'], 
    thumbnail: json['thumbnail']
    );
} 
  
}