import 'package:flutter/material.dart';
import 'package:flutter_tech_days/providers/account_provider.dart';
import 'package:flutter_tech_days/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ProviderScope extends StatelessWidget {
  const ProviderScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: child,
    );
  }
}
