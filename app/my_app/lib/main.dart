// import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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
  void getproduct(var prd) {
    currentProduct = prd;
    notifyListeners();
  }

  var cart = [];
  void toggleCart(var input) {
    if (cart.contains(input)) {
      cart.remove(input);
    } else {
      cart.add(input);
    }
    notifyListeners();
  }

  var wishlist = [];
  void toggleWishList(var input) {
    if (wishlist.contains(input)) {
      wishlist.remove(input);
    } else {
      wishlist.add(input);
    }
    notifyListeners();
  }

  var products = [
    ["Title", "Description", "Price", 'assets/images/0000.png'],
    ["Title", "Description", "Price", 'assets/images/0000.png'],
    ["Title", "Description", "Price", 'assets/images/0000.png'],
    ["title", "Des", "Price", "assets/images/0001.png"],
    ["title", "Des", "Price", "assets/images/0001.png"],
    ["title", "Des", "Price", "assets/images/0001.png"],
    ["title", "Des", "Price", "assets/images/0001.png"]
  ];

  var featuredProducts = [0, 1, 2, 5];
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
      case 2:
        page = WishListPage();
        break;
      case 3:
        page = ListProductPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
        appState.getproduct(-1);
      });
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Daymarket: Solution to everything.'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sell),
              label: 'Sell',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          onTap: onItemTapped,
        ),
      );
    });
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
    if (appState.currentProduct == -1) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BigCard(),
              SizedBox(height: 10),
              SizedBox(height: 150, child: BannerView()),
              SizedBox(
                height: 200.0,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: appState.featuredProducts.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: GestureDetector(
                      onTap: () {
                        appState.getproduct(appState.featuredProducts[index]);
                      },
                      child: SizedBox(
                        width: 120,
                        height: 100,
                        child: Column(
                          children: [
                            Stack(
                              children: <Widget>[
                                Container(
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  alignment: Alignment.center,
                                  height: 100,
                                  child: Image.asset(
                                    appState.products[
                                        appState.featuredProducts[index]][3],
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: TextButton(
                                      onPressed: () {
                                        appState.toggleWishList(
                                            appState.featuredProducts[index]);
                                      },
                                      child: ((appState.wishlist.contains(
                                                  appState.featuredProducts[
                                                      index])) ==
                                              true)
                                          ? Icon(Icons.favorite)
                                          : Icon(
                                              Icons.favorite_border_outlined)),
                                )
                              ],
                            ),
                            Text(appState
                                .products[appState.featuredProducts[index]][0]),
                            Text(appState
                                .products[appState.featuredProducts[index]][1]),
                            Text(appState
                                .products[appState.featuredProducts[index]][2]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              for (var i = 0; i < appState.products.length; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      appState.getproduct(i);
                    },
                    child: Row(children: [
                      Image.asset(
                        appState.products[i][3],
                        height: 50,
                        width: 50,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(appState.products[i][0]),
                              Text(appState.products[i][2]),
                            ],
                          ),
                          Text(appState.products[i][1])
                        ],
                      )
                    ]),
                  ),
                ),
            ],
          ),
        ),
      );
    } else {
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

class BannerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final style = theme.textTheme.displayMedium!.copyWith(
    //   color: theme.colorScheme.onPrimary,
    // );
    final PageController controller = PageController();
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      controller: controller,
      children: <Widget>[
        Image.asset(
          'assets/images/adv.png',
          height: 70,
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/adv.png',
          height: 70,
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/adv.png',
          height: 70,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var products = appState.products;
    var currentProduct = appState.currentProduct;
    var addOrRemoveCart = "Hell";
    var addOrRemoveWish = "Hell";
    if (appState.cart.contains(currentProduct)) {
      addOrRemoveCart = "Remove From Cart";
    } else {
      addOrRemoveCart = "Add To Cart";
    }
    if (appState.wishlist.contains(currentProduct)) {
      addOrRemoveWish = "Remove From Wishlist";
    } else {
      addOrRemoveWish = "Add To Wishlist";
    }
    return Column(
      children: [
        Image.asset(appState.products[currentProduct][3]),
        Text(products[currentProduct][0]),
        Text(products[currentProduct][1]),
        Text(products[currentProduct][2]),
        ElevatedButton(
            onPressed: () {
              appState.toggleCart(currentProduct);
            },
            child: Text(addOrRemoveCart)),
        ElevatedButton(
            onPressed: () {
              appState.toggleWishList(currentProduct);
            },
            child: Text(addOrRemoveWish)),
      ],
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.cart.isEmpty) {
      return Center(
        child: Text('No items added yet.'),
      );
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.cart.length} item in cart:'),
        ),
        for (var pair in appState.cart)
          Row(
            children: [
              Image.asset(
                appState.products[pair][3],
                height: 50,
                width: 50,
              ),
              Text(appState.products[pair][0]),
              ElevatedButton(
                  onPressed: () {
                    appState.toggleCart(pair);
                  },
                  child: Text("Remove")),
            ],
          ),
      ],
    );
  }
}

class WishListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.wishlist.isEmpty) {
      return Center(
        child: Text('Your wishlist is empty now.'),
      );
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.wishlist.length} wishes:'),
        ),
        for (var pair in appState.wishlist)
          Row(
            children: [
              Image.asset(
                appState.products[pair][3],
                height: 50,
                width: 50,
              ),
              Text(appState.products[pair][0]),
              ElevatedButton(
                  onPressed: () {
                    appState.toggleWishList(pair);
                  },
                  child: Text("Remove")),
            ],
          ),
      ],
    );
  }
}

class ListProductPage extends StatefulWidget {
  @override
  State<ListProductPage> createState() => _ListProductPageState();
}

class _ListProductPageState extends State<ListProductPage> {
  bool negotiable = false;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    // Build a Form widget using the _formKey created above.
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Submit the form to sell your product!...'),
          ),
          Column(
            children: [
              Text('Title :   '),
              SizedBox(
                width: 150,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Wingardium Leviosa'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Category :   '),
                    SizedBox(
                      width: 150,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Wingardium Leviosa'),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Price :   '),
                    SizedBox(
                      width: 150,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Rs. '),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text('Location :   '),
              SizedBox(
                width: 150,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Hogwarts'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text('Description :   '),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'A series of magic...'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Is the price negotiable ?      '),
                Switch(
                  value: negotiable, // watch the !
                  onChanged: (bool val) => setState(
                    () {
                      negotiable = val;
                    },
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
