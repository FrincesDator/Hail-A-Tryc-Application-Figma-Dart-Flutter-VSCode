import 'package:flutter/material.dart';

class UserCredentials extends ChangeNotifier {
  String? _username;
  String? _password;

  String? get username => _username;
  String? get password => _password;

  void setCredentials(String username, String password) {
    _username = username;
    _password = password;
    notifyListeners();
  }
}
