import 'package:flutter/material.dart';
import 'package:flutter_tech_days/core/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  Future<void> addToCart(ProductModel product) async {
    await Future.delayed(Duration(milliseconds: 500));

    _products.add(product);
    notifyListeners();
  }
}
