import 'package:flutter/material.dart';
import 'package:flutter_tech_days/providers/theme_provider.dart';
import 'package:flutter_tech_days/views/home/home_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: buildTheme(dark: false),
      darkTheme: buildTheme(dark: true),
      home: HomeView(),
    );
  }

  ThemeData buildTheme({
    required bool dark,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.black,
      brightness: dark ? Brightness.dark : Brightness.light,
      dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
    );

    final defaultTheme = dark
        ? ThemeData.dark(useMaterial3: true)
        : ThemeData.light(useMaterial3: true);

    return defaultTheme.copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surfaceContainer,
      textTheme: GoogleFonts.quicksandTextTheme(defaultTheme.textTheme),
    );
  }
}
