import 'package:flutter/material.dart';

class WishlistManager with ChangeNotifier {
  List<Map<String, dynamic>> _wishlist = [];

  List<Map<String, dynamic>> get wishlist => _wishlist;

  void addToWishlist(Map<String, dynamic> item) {
    _wishlist.add(item);
    notifyListeners();
  }

  void removeFromWishlist(Map<String, dynamic> item) {
    _wishlist.remove(item);
    notifyListeners();
  }
}
