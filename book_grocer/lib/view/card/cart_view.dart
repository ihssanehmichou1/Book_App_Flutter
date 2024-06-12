import 'package:flutter/material.dart';
import '../checkout/Checkout_View.dart';
import '../wishlist/wishlist_view.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  // Example list of cart items
  List<Map<String, dynamic>> cartItems = [
    {
      'title': 'Cookery',
      'author': 'John Doe',
      'price': 19.99,
      'image': 'assets/img/b4.jpg',
    },
    {
      'title': 'The Heart of Hell',
      'author': 'Mitch weiss',
      'price': 24.99,
      'image': 'assets/img/h1.jpg',
    },
  ];

  List<Map<String, dynamic>> wishlistItems = [];

  void addToCart(Map<String, dynamic> item) {
    setState(() {
      cartItems.add(item);
    });
  }

  void addToWishlist(Map<String, dynamic> item) {
    setState(() {
      wishlistItems.add(item);
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void navigateToCheckout(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CheckoutView(cartItems: cartItems)),
    );
  }

  void navigateToWishlist(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WishlistView(wishlistItems: wishlistItems)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.favorite),
        //     onPressed: () {
        //       navigateToWishlist(context);
        //     },
        //   ),
        // ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        item['image'],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'],
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Author: ${item['author']}',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '\$${item['price']}',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.green[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          removeItem(index);
                        },
                        child: const Text('Remove from Cart'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          navigateToCheckout(context);
                        },
                        child: const Text('Checkout'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
