import 'package:flutter/cupertino.dart';

class CartManager with ChangeNotifier {
  List<Map<String, dynamic>> cartItems = [];
  List<Map<String, dynamic>> wishlistItems = [];

  void addToCart(Map<String, dynamic> item) {
    cartItems.add(item);
    notifyListeners();
  }

  void addToWishlist(Map<String, dynamic> item) {
    wishlistItems.add(item);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }
}
