import 'dart:math';
import 'package:http/http.dart' as http;
import 'product.dart';
import 'dart:convert';
class ApiService {
  static const baseUrl = 'https://marketplace-1-b3203472.deta.app';
  static const List<String> images = ['assets/images/Adam Farrell.png', 'assets/images/Alyssa Mendez.png', 'assets/images/Amanda Brooks.png', 'assets/images/Annette Harper.png', 'assets/images/Ashley Fisher.png', 'assets/images/Ashley Smith.png', 'assets/images/Brad Stewart.png', 'assets/images/Brian Ferrell.png', 'assets/images/Brittany Berry.png', 'assets/images/Christy Jones.png', 'assets/images/Cindy Wilkins.png', 'assets/images/David Warner.png', 'assets/images/Deanna Johnson.png', 'assets/images/Debra Duncan.png', 'assets/images/Diana Willis.png', 'assets/images/Dustin Cox.png', 'assets/images/Elizabeth Paul.png', 'assets/images/Emily Chase.png', 'assets/images/Eric Reynolds.png', 'assets/images/Jacob Garza.png', 'assets/images/Jason Simon.png', 'assets/images/Jean Edwards DDS.png', 'assets/images/Jeffrey Mack.png', 'assets/images/Jerry Scott.png', 'assets/images/Jody Shea.png', 'assets/images/John Ortiz.png', 'assets/images/Judith Gay.png', 'assets/images/Kathy Garrison.png', 'assets/images/Kenneth Davis.png', 'assets/images/Kimberly Clarke.png', 'assets/images/Lance Soto.png', 'assets/images/Marie Brown.png', 'assets/images/Mark Lawrence.png', 'assets/images/Michael Campbell.png', 'assets/images/Michael Wiggins.png', 'assets/images/Nathan Lowe.png', 'assets/images/Nathan Lyons.png', 'assets/images/Olivia Gonzalez.png', 'assets/images/Patrick Ryan.png', 'assets/images/Peter Smith.png', 'assets/images/Robert Gomez.png', 'assets/images/Ronald Brown.png', 'assets/images/Sarah English.png', 'assets/images/Selena Rogers.png', 'assets/images/Stephanie Peterson.png', 'assets/images/Steven Mason.png', 'assets/images/Summer Hill.png', 'assets/images/Susan Schmidt.png', 'assets/images/Susan Thompson.png', 'assets/images/Teresa Williams.png', 'assets/images/Thomas Hansen.png', 'assets/images/Thomas Kane.png', 'assets/images/Wayne Blackwell.png', 'assets/images/Wendy Colon.png'];
  // Function to make a GET request to fetch product data
  static var random = Random();
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/search?query=&skip=0&limit=300'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return List<Product>.from(jsonData.map((data) => Product.fromJson(data,images[random.nextInt(images.length)])));
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
      String isNegotiable
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
      }),
      headers: {'Content-Type': 'application/json'},
    );
    print({
      "id": id,
      "category": category,
      "location": location,
      "title": title,
      "description": description,
      "price": price,
      "isNegotiable": isNegotiable,
      "isFeatured": "true",
      "isPromoted": "true",
    });
    // print(jsonDecode(response.body));
    if (response.statusCode != 204) {
      throw Exception('Failed to edit product');
    }
  }

}