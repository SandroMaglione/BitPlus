class LoginValidator {
  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  bool isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  // TODO: Impl isValidPassword()
  bool isValidPassword(String password) {
    return true;
    // return _passwordRegExp.hasMatch(password);
  }
}
