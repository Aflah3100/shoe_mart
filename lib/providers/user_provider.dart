import 'package:flutter/material.dart';
import 'package:shoe_mart/utils/utils.dart';

class UserProvider with ChangeNotifier {
  Logintype _logintype = Logintype.sigin;
  bool _showPassword = false;
  String _displayString = '';

  void setLoginType(Logintype type) {
    _logintype = type;
    notifyListeners();
  }

  Logintype getLoginType() => _logintype;

  void setDisplayString({required String str}) {
    _displayString = str;
    notifyListeners();
  }

  void setShowPassword({required bool val}) {
    _showPassword = val;
    notifyListeners();
  }

  bool getShowPassword() => _showPassword;

  String getDisplayString() => _displayString;
}
