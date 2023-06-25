// import 'dart:html';
//
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:flutter/services.dart' show ByteData, rootBundle;
//
// import 'product.dart';
//
// class ProductRepository {
//   Future<List<Product>> fetchProductsFromDatabase() async {
//     final databasePath = await getDatabasesPath();
//     final databaseFile = join(databasePath, 'marketplace.db');
//
//     // Check if the database file exists, if not, copy it from assets
//     // if (!await databaseExists(databaseFile)) {
//     //   ByteData data = await rootBundle.load('assets/your_database_name.db');
//     //   List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//     //   await File(databaseFile).writeAsBytes(bytes);
//     // }
//
//     final database = await openDatabase(databaseFile, version: 1);
//
//     final products = await database.rawQuery('SELECT * FROM products');
//
//     final productList = products.map((productMap) {
//       return Product(
//         title: productMap['title'] as String,
//         description: productMap['description'] as String,
//         price: (productMap['price'] as num).toDouble(),
//         image: productMap['image'] as String,
//       );
//     }).toList();
//
//     await database.close();
//
//     return productList;
//   }
// }
