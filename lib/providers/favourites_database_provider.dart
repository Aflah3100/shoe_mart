import 'package:flutter/material.dart';

class FavouritesDatabaseProvider with ChangeNotifier {
  final List<String> _favouritesIdList = [];

  void addSneakerIdToFavouriteList({required String sneakerId}) {
    _favouritesIdList.add(sneakerId);
    notifyListeners();
  }

  void addProductsIdsToFavouritesList({required List<String> productIdList}) {
    _favouritesIdList.clear();
    _favouritesIdList.addAll(productIdList);
    notifyListeners();
  }

  void deleteProductFromFavouritesList({required String id}) {
    _favouritesIdList.removeWhere((productId) => productId == id);
    notifyListeners();
  }

  List<String> getFavouritesIdList() {
    return _favouritesIdList;
  }
}
