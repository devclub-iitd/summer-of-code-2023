class Product {
  final String id;
  final String title;
  final String description;
  final String category;
  final int price;
  final String image;
  final bool isNegotiable;
  final String location;
  const Product({
    required this.id,
    required this.category,
    required this.location,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.isNegotiable,
  });
  factory Product.fromJson(Map<String, dynamic> json,String image) {
    return Product(
      id: json['_id']['\$oid'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toInt(),
      image: image,
      location: json['location'],
      isNegotiable: json['isNegotiable'],
      category: json['category'],
    );
  }
  @override
  bool operator ==(other) {
    return (other is Product) && (other.id == id);
  }
}