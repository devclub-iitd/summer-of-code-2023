// import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {

  var currentProduct = -1;
  void getproduct(var prd){
    currentProduct = prd;
    notifyListeners();
  }
  var cart = [];
  void toggleCart(var input){
    if(cart.contains(input)){
      cart.remove(input);
    }
    else {
      cart.add(input);
    }
    notifyListeners();
  }



  var products = [["Title","Description","Price",'assets/images/0000.png'],["title","Des","Price","assets/images/0001.png"]];
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
  var appState = context.watch<MyAppState>();
  Widget page;
  switch (selectedIndex) {
    case 0:
      page = GeneratorPage();
      break;
    case 1:
      page = CartPage();
      break;
    default:
      throw UnimplementedError('no widget for $selectedIndex');
  }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth>=600,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.shopping_cart),
                      label: Text('Favorites'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                    appState.getproduct(-1);
                  },
                ),
              ),
              Expanded(
                child: SafeArea(
                  child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                  ),
                )
              ),
            ],
          ),
        );
      }
    );
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    // var pair = appState.current;

    // IconData icon;
    // if (appState.favorites.contains(pair)) {
    //   icon = Icons.favorite;
    // } else {
    //   icon = Icons.favorite_border;
    // }
    if(appState.currentProduct==-1){
      return ListView(
          children: [
            BigCard(),
            SizedBox(height: 10),
            for(var i = 0;i<appState.products.length;i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                onPressed: () {
                  appState.getproduct(i);
                },
                child: Row(children: [
                  Image.asset(appState.products[i][3],height: 50,width: 50,),
                  Column(children: [Row(children: [Text(appState.products[i][0]),Text(appState.products[i][2]),],),Text(appState.products[i][1])],)
                ]),
                          ),
              ),  
          ],
        );
    }else {
      return ProductPage();
    }

  }
}

class BigCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          "DayMarket",
          style: style,
        ),
      ),
    );
  }
}

class ProductPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var products = appState.products;
    var currentProduct = appState.currentProduct;
    var addOrRemove = "Hell";
    if (appState.cart.contains(currentProduct)) {
      addOrRemove = "Remove From Cart";
    } else {
      addOrRemove = "Add To Cart";
    }
    return Column(
      children: [
        Image.asset(appState.products[currentProduct][3],height: 150,width: 150,),
        Text(products[currentProduct][0]),
        Text(products[currentProduct][1]),
        Text(products[currentProduct][2]),
        ElevatedButton(
          onPressed: () {
            appState.toggleCart(currentProduct);
          },
          child:Text(addOrRemove)
        ),
      ],
    );
  }

}

class CartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var appState = context.watch<MyAppState>();

    if (appState.cart.isEmpty){
      return Center(child: Text('No items added yet.'),);
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.cart.length} favorites:'),
        ),
        for (var pair in appState.cart)
          Row(
            children: [
              Image.asset(appState.products[pair][3],height: 50,width: 50,),
              Text(appState.products[pair][0]),
              ElevatedButton(
                onPressed: () {
                appState.toggleCart(pair);
              },
              child:Text("Remove")
              ),
            ],
          ),
      ],
    );
  }
}