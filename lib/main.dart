import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List products = [
    {
      "product_name": "Biscuit",
      "product_color": "",
      "is_added": false,
      'price': 12
    },
    {
      "product_name": "Chocolate",
      "product_color": "",
      "is_added": false,
      'price': 12
    },
    {
      "product_name": "Coffee",
      "product_color": "",
      "is_added": false,
      'price': 12
    },
    {
      "product_name": "Lays",
      "product_color": "",
      "is_added": false,
      'price': 12
    },
    {
      "product_name": "Kurkure",
      "product_color": "",
      "is_added": false,
      'price': 12
    },
    {
      "product_name": "Noodles",
      "product_color": "",
      "is_added": false,
      'price': 12
    },
    {
      "product_name": "Pop",
      "product_color": "",
      "is_added": false,
      'price': 12
    },
    {
      "product_name": "Tooth Brush",
      "product_color": "",
      "is_added": false,
      'price': 12
    },
    {
      "product_name": "Rice",
      "product_color": "",
      "is_added": false,
      'price': 12
    },
    {
      "product_name": "Vegetable",
      "product_color": "",
      "is_added": false,
      'price': 12
    },
    {
      "product_name": "Good Day",
      "product_color": "",
      "is_added": false,
      'price': 12
    },
    {
      "product_name": "Maggie",
      "product_color": "",
      "is_added": false,
      'price': 12
    },
  ];
  final List<Map<String, dynamic>> _cart = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: const Text(
          "Catalog",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(
                    cart: _cart,
                  ),
                ),
              );
            },
            icon: Stack(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Text(
                      _cart.length.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            // leading: Container(),
            title: Text(products[index]['product_name'] +
                "   " +
                products[index]['price'].toString()),
            trailing: products[index]['is_added'] == false
                ? TextButton(
                    onPressed: () {
                      products[index]['is_added'] =
                          !products[index]['is_added'];
                      _cart.add({
                        "product_name": products[index]['product_name'],
                        "price": products[index]['price'],
                      });
                      setState(() {});
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )
                : Icon(Icons.done),
          );
        },
      ),
    );
  }
}

int calculateTotal(List<Map<String, dynamic>> cart) {
  int total = 0;
  for(int i=0; i<cart.length; i++) {
    int pp = cart[i]['price'];
    total = total +  pp;
  }
  return total;
}

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cart;
  const CartPage({required this.cart, super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(cart[index]['product_name']),
                );
              },
            ),
          ),
          Text("Total: ${calculateTotal(cart)}")
        ],
      ),
    );
  }
}
