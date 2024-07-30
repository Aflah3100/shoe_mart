import 'package:flutter/material.dart';
import 'package:shoe_mart/database/models/sneaker_model/hive_sneaker_model.dart';

class FavouritesDatabaseProvider with ChangeNotifier {
  final List<HiveSneakerModel> _favouritesList = [];

  void addSneakerToFavouriteList({required HiveSneakerModel sneaker}) {
    _favouritesList.add(sneaker);
    notifyListeners();
  }

  void addProductsToFavouritesList({required List<HiveSneakerModel> productList}) {
    _favouritesList.clear();
    _favouritesList.addAll(productList);
    notifyListeners();
  }

  void deleteProductFromFavouritesList({required String id}) {
    _favouritesList.removeWhere((product) => product.id == id);
    notifyListeners();
  }

  List<HiveSneakerModel> getFavouritesList() {
    return _favouritesList;
  }
}
