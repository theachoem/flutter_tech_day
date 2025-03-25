import 'package:flutter/material.dart';
import 'package:flutter_tech_days/app.dart';
import 'package:flutter_tech_days/provider_scope.dart';

void main() async {
  runApp(ProviderScope(
    child: const App(),
  ));
}
