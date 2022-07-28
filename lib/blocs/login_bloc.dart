import 'dart:async';

import 'package:untitled2/validators/validation.dart';

class LoginBloC {
  StreamController _usernameController = new StreamController();
  StreamController _passwordController = new StreamController();

  Stream get usernameStream => _usernameController.stream;
  Stream get passwordStream => _passwordController.stream;

  // example core code
  // Stream getUserNameStram() {
  //   return _usernameController.stream;
  // }

  bool isValidInfo(String username, String password) {
    if (!Validations.isValidUser(username)) {
      _usernameController.sink.addError("Account is not exit");
      return false;
    }

    _usernameController.sink.add("ok");

    if (!Validations.isValidPass(password)) {
      _passwordController.sink.addError("Password is invalid");
      return false;
    }

    _passwordController.sink.add("ok");

    return true;
  }

  void dispose() {
    _usernameController.close();
    _passwordController.close();
  }
}
