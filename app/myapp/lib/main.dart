import 'package:flutter/material.dart';
import 'productlist.dart';
import 'product.dart';
import 'storage.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ProductData.products = fetchData();
  print(ProductData.products.length);
  runApp(MarketplaceApp());
}
List<Product> fetchData() {
  List<Product> products = [];

  // Read the CSV file from assets
  rootBundle.loadString('assets/marketplace.csv').then((csvString) {
    List<List<dynamic>> csvData = CsvToListConverter().convert(csvString);

    List<String> fields = csvData[0].cast<String>();
    for (int i = 1; i < csvData.length; i++) {
      List<dynamic> row = csvData[i];

      String title = row[0].toString();
      String description = row[1].toString();
      double price = double.parse(row[2].toString());
      String image = row[3].toString();

      Product product = Product(
        title: title,
        description: description,
        price: price,
        image: image,
      );
      products.add(product);
    }
  });

  return products;
}
class MarketplaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListingScreen(),
    );
  }
}



