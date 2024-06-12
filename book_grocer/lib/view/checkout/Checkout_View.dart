import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  const CheckoutView({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var item in cartItems) {
      total += item['price'] as double;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length + 1,
        itemBuilder: (context, index) {
          if (index < cartItems.length) {
            final item = cartItems[index];
            return Card(
              elevation: 4.0,
              margin: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: Image.asset(
                  item['image'] as String,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                title: Text(item['title'] as String),
                subtitle: Text('Price: \$${item['price']}'),
              ),
            );
          } else {
            return Card(
              elevation: 4.0,
              margin: const EdgeInsets.all(16.0),
              child: ListTile(
                title: const Text('Total'),
                trailing: Text('\$$total'),
              ),
            );
          }
        },
      ),
    );
  }
}