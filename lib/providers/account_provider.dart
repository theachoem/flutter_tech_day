import 'package:flutter/material.dart';

class AccountProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  void signIn() {
    _isSignedIn = true;
  }
}
