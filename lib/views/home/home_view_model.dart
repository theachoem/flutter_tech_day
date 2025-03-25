import 'package:flutter/material.dart';
import 'package:flutter_tech_days/core/apis/products_api.dart';
import 'package:flutter_tech_days/core/models/product_model.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    load();
  }

  List<ProductModel>? _products;
  List<ProductModel>? get products => _products;

  Future<void> load() async {
    _products = await ProductsApi().fetchAll();
    notifyListeners();
  }
}
