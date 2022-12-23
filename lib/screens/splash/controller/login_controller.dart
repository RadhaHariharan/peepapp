import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  bool _isOtpSent = false;

  bool get isOtpSent => _isOtpSent;

  void optSent() {
    _isOtpSent = true;
    notifyListeners();
  }
}
