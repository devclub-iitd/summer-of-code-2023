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
    this.image="https://firebasestorage.googleapis.com/v0/b/myapp-8f3f4.appspot.com/o/Profile%20pic.png?alt=media&token=2a1b52a6-6449-4059-a9db-b4cb83fa1a8a",
    required this.isNegotiable,
  });
  factory Product.fromJson(Map<String, dynamic> json,) {
    return Product(
      id: json['_id']['\$oid'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toInt(),
      image: json.containsKey("img_url")?json['img_url']:"https://firebasestorage.googleapis.com/v0/b/myapp-8f3f4.appspot.com/o/Profile%20pic.png?alt=media&token=2a1b52a6-6449-4059-a9db-b4cb83fa1a8a",
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