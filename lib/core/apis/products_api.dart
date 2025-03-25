import 'dart:convert';

import 'package:flutter_tech_days/core/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsApi {
  String get baseUrl => 'https://theachoem.github.io/flutter_tech_day/api';

  Future<List<ProductModel>?> fetchAll() async {
    try {
      final uri = Uri.parse("$baseUrl/products.json");
      final response = await http.get(uri);
      final json = jsonDecode(response.body);
      return List<ProductModel>.from(json.map((x) => ProductModel.fromJson(x)));
    } catch (e) {
      return null;
    }
  }

  Future<ProductModel?> fetchById(int id) async {
    try {
      final uri = Uri.parse("$baseUrl/products/$id.json");
      final response = await http.get(uri);
      final json = jsonDecode(response.body);

      return ProductModel.fromJson(json);
    } catch (e) {
      return null;
    }
  }
}
