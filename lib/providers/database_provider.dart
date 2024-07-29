import 'package:flutter/material.dart';
import 'package:shoe_mart/database/models/sneaker_model/hive_sneaker_model.dart';

class DatabaseProvider with ChangeNotifier {
  final List<HiveSneakerModel> _cartList = [];

  void addSneakerToCartList({required HiveSneakerModel sneaker}) {
    _cartList.add(sneaker);
    notifyListeners();
  }

  void addProductsToCartList({required List<HiveSneakerModel> productList}) {
    _cartList.clear();
    _cartList.addAll(productList);
    notifyListeners();
  }

  void deleteSneakerFromCartList({required String sneakerId,required String sneakerSize}) {
    _cartList.removeWhere((sneakerModel) => sneakerModel.id == sneakerId && sneakerModel.selectedSize==sneakerSize);
    notifyListeners();
  }

  List<HiveSneakerModel> getCartList() {
    return _cartList;
  }
}
