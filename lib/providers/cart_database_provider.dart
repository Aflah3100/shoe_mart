import 'package:flutter/material.dart';
import 'package:shoe_mart/database/models/sneaker_model/hive_sneaker_model.dart';

class CartDatabaseProvider with ChangeNotifier {
  final List<HiveSneakerModel> _cartList = [];
  bool _isCartEmpty = true;

  void addProductsToCartList({required List<HiveSneakerModel> productList}) {
    if (productList.isNotEmpty) {
      _cartList.clear();
      _cartList.addAll(productList);
      _isCartEmpty = false;
      notifyListeners();
    }
  }

  void deleteSneakerFromCartList(
      {required String sneakerId, required String sneakerSize}) {
    _cartList.removeWhere((sneakerModel) =>
        sneakerModel.id == sneakerId &&
        sneakerModel.selectedSize == sneakerSize);
    if (_cartList.isEmpty) {
      _isCartEmpty = true;
    }
    notifyListeners();
  }

  List<HiveSneakerModel> getCartList() {
    return _cartList;
  }

  bool isCartEmpty() => _isCartEmpty;
}
