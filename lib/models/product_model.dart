class Product {
  final int id;
  final String title;
  final num price;
  final num rating;
  final String thumbnail;
  final String category;
  final List<String> tags;

  Product(
    {
    required this.id, 
    required this.title, 
    required this.price, 
    required this.rating, 
    required this.thumbnail,
    required this.category,
    required this.tags,
    }
    );
factory Product.fromJson(Map<String, dynamic> json){
  return Product(
    id: json['id'], 
    title: json['title'], 
    price: json['price'], 
    rating: json['rating'], 
    thumbnail: json['thumbnail'],
    category: json['category'] ?? '',
    tags: List<String>.from(json['tags'] ?? []),
    );
} 
  
}