import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  String _selectedShoeSize = "";

  String getShoeSize() => _selectedShoeSize;

  void setShoeSize(String size) {
    _selectedShoeSize = size;
    notifyListeners();
  }

  void clearShoeSize() {
    _selectedShoeSize = "";
  }


}
