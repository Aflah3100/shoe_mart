import 'package:flutter/material.dart';
import 'package:shoe_mart/database/models/sneaker_model/hive_sneaker_model.dart';

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
