
class Product{
  final String name;
  final String price;
  final String image;
  final String desc;
  final String ratings;
  final String Category;


const  Product(
  this.name, this.price, this.desc,this.image,this.ratings,this.Category);

factory Product.fromJson(Map<String,dynamic> json){
  return Product(json['title'], json['price'].toString(), json['description'], json['image'], json["rating"]['rate'].toString(),json['category']);
}

}