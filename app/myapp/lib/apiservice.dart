import 'package:http/http.dart' as http;
import 'product.dart';
import 'dart:convert';
class ApiService {
  static const baseUrl = 'https://marketplace-1-b3203472.deta.app';
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/search?query=&skip=0&limit=300'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return List<Product>.from(jsonData.map((data) => Product.fromJson(data)));
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  // Function to make a POST request to add a new product
  static Future<void> addProduct(
      String category,
      String location,
      String title,
      String description,
      String price,
      String isNegotiable,
      String imgurl,
      ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/product'),
      body: jsonEncode({
        "category" :  category,
        "location" : location,
        "title" :  title,
        "description" : description,
        "price" : price,
        "isNegotiable" : isNegotiable,
        "isFeatured": "true",
        "isPromoted":"true",
        "img_url":imgurl,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    print(jsonDecode(response.body));
    print(price);
    if (response.statusCode != 201) {
      throw Exception('Failed to add product');
    }
  }
  // Delete a product
  static Future<void> deleteProduct(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/product/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete product');
    }
  }

// Edit a product
  static Future<void> editProduct(
      String id,
      String category,
      String location,
      String title,
      String description,
      String price,
      String isNegotiable,
      String imgurl,
      ) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/product/$id'),
      body: jsonEncode({
        "id": id,
        "category": category,
        "location": location,
        "title": title,
        "description": description,
        "price": price,
        "isNegotiable": isNegotiable,
        "isFeatured": "true",
        "isPromoted": "true",
        "img_url":imgurl
      }),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 204) {
      throw Exception('Failed to edit product');
    }
  }

}