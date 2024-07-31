class LoginFunctions {
  LoginFunctions._internal();
  static LoginFunctions instance = LoginFunctions._internal();
  factory LoginFunctions() => instance;

  dynamic validateEmail(String email) {
    const String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final RegExp regex = RegExp(pattern);

    if (email.isEmpty) {
      return 'Email address cannot be empty';
    } else if (!regex.hasMatch(email)) {
      return 'Enter a valid email address';
    }
    // If the email is valid, return null
    else {
      return true;
    }
  }

  dynamic validatePassword(String password) {
    if (password.isEmpty) {
      return 'Enter a Password';
    } else if (password.length < 8) {
      return 'Password length >=8';
    } else {
      return true;
    }
  }

  dynamic validateName(String name) {
    // Regular expression for a valid name (letters and spaces only)
    const String pattern = r'^[a-zA-Z\s]+$';
    final RegExp regex = RegExp(pattern);

    if (name.isEmpty) {
      return 'Name cannot be empty';
    } else if (!regex.hasMatch(name)) {
      return 'Enter a valid name';
    } else {
      return true;
    }
  }

  dynamic checkEnteredPassword(String password, String confimPassword) {
    if (password != confimPassword) {
      return 'Password\'s doesnt match';
    } else {
      return true;
    }
  }
}
