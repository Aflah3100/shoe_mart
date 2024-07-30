import 'package:hive_flutter/hive_flutter.dart';
import 'package:shoe_mart/database/models/sneaker_model/hive_sneaker_model.dart';

//Favourites-Box-Functions

class FavouritesDb {
  FavouritesDb._internal();
  static FavouritesDb instance = FavouritesDb._internal();
  factory FavouritesDb() => instance;

  static const _boxName = 'favourites-box';

  Future<dynamic> addToFavourites({required HiveSneakerModel sneaker}) async {
    try {
      Box<HiveSneakerModel> box =
          await Hive.openBox<HiveSneakerModel>(_boxName);

      box.put(sneaker.id, sneaker);

      return true;
    } catch (e) {
      return e;
    }
  }

  Future<List<HiveSneakerModel>> fetchFavouritesProducts() async {
    Box<HiveSneakerModel> box = await Hive.openBox<HiveSneakerModel>(_boxName);

    return box.values.toList();
  }

  Future<dynamic> deleteFavouritesProduct({required String productId}) async {
    try {
      Box<HiveSneakerModel> box =
          await Hive.openBox<HiveSneakerModel>(_boxName);

      box.delete(productId);

      return true;
    } catch (e) {
      return e;
    }
  }

  //Experimental-Function
  Future<dynamic> clearAll() async {
    Box<HiveSneakerModel> cartBox = await Hive.openBox(_boxName);
    cartBox.clear();
  }
}
