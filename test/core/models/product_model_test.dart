import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tech_days/core/models/product_model.dart';

void main() {
  group('ProductModel.fromJson', () {
    final sampleJson = {
      "id": 1,
      "title": "Test Product",
      "price": 99.99,
      "description": "A great product",
      "image": "https://example.com/product.jpg"
    };

    test('it should create a valid ProductModel', () {
      final product = ProductModel.fromJson(sampleJson);

      expect(product.id, 1);
      expect(product.title, "Test Product");
      expect(product.price, 99.99);
      expect(product.description, "A great product");
      expect(product.image, "https://example.com/product.jpg");
    });
  });

  group('ProductModel#toJson', () {
    final sampleJson = {
      "id": 1,
      "title": "Test Product",
      "price": 99.99,
      "description": "A great product",
      "image": "https://example.com/product.jpg"
    };

    test('it should convert ProductModel to valid JSON', () {
      final product = ProductModel.fromJson(sampleJson);
      final jsonMap = product.toJson();

      expect(jsonMap, sampleJson);
    });
  });
}
