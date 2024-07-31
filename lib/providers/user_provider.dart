import 'package:flutter/material.dart';
import 'package:shoe_mart/utils/utils.dart';

class UserProvider with ChangeNotifier {
  Logintype _logintype = Logintype.sigin;
  bool _showPassword = false;
  String _errorString = '';

  void setLoginType(Logintype type) {
    _logintype = type;
    notifyListeners();
  }

  Logintype getLoginType() => _logintype;

  void setErrorString({required String error}) {
    _errorString = error;
    notifyListeners();
  }

  void setShowPassword({required bool val}) {
    _showPassword = val;
    notifyListeners();
  }

  bool getShowPassword() => _showPassword;

  String getErrorString() => _errorString;
}
