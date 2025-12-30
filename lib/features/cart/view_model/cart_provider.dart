import 'package:flutter/material.dart';
import 'package:sample_app/features/products_listing/model/product_model.dart';

class CartProvider with ChangeNotifier {
  List<ProductModel> cartItems = [];

  void addToCart(ProductModel product) {
    cartItems.add(product);
    notifyListeners();
  }

  void deleteFromCart(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }
}
