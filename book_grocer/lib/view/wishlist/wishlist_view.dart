import 'package:flutter/material.dart';

class WishlistView extends StatelessWidget {
  final List<Map<String, dynamic>> wishlistItems;

  const WishlistView({Key? key, required this.wishlistItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: wishlistItems.isEmpty
          ? Center(
        child: Text(
          'Your wishlist is empty.',
          style: TextStyle(fontSize: 18.0),
        ),
      )
          : ListView.builder(
        itemCount: wishlistItems.length,
        itemBuilder: (context, index) {
          final item = wishlistItems[index];
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
              subtitle: Text('Author: ${item['author']}'),
            ),
          );
        },
      ),
    );
  }
}