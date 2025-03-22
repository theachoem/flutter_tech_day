import 'package:flutter/material.dart';
import 'package:flutter_tech_days/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: const HomePage(title: 'Flutter Tech Day'),
    );
  }
}
