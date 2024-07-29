import 'package:flutter/material.dart';
import 'package:shoe_mart/database/models/sneaker_model/hive_sneaker_model.dart';

class DatabaseProvider with ChangeNotifier {
  List<HiveSneakerModel> cartList = [];


  void addSneakerToCartList({required HiveSneakerModel sneaker}){
    cartList.add(sneaker);
    notifyListeners();

  }

  void addProductsToCartList({required List<HiveSneakerModel> productList}){
    cartList.clear();
    cartList.addAll(productList);
    notifyListeners();
  }

  List<HiveSneakerModel> getCartList() {
    return cartList;
  }
}
