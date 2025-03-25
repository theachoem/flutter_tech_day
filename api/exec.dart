import 'dart:convert';
import 'dart:io';

void main() async {
  final file = File('products.json');

  if (!await file.exists()) {
    print('Error: products.json not found');
    return;
  }

  final content = await file.readAsString();
  final List<dynamic> products = jsonDecode(content);

  final directory = Directory('products');
  if (!await directory.exists()) {
    await directory.create();
  }

  for (int i = 0; i < products.length; i++) {
    final productFile = File('products/${i + 1}.json');
    await productFile.writeAsString(
      jsonEncode(products[i], toEncodable: (item) => item.toString()),
      mode: FileMode.write,
    );
  }

  print('Products split into individual JSON files.');
}
