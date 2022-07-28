class Validations {
  static bool isValidUser(String username) {
    return username != null && username.length > 6;
  }

  static bool isValidPass(String password) {
    return password != null && password.length > 8 && password.contains("@");
  }
}
