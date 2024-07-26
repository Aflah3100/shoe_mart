import 'package:hive_flutter/adapters.dart';
import 'package:shoe_mart/database/models/sneaker_model/hive_sneaker_model.dart';

class CartDb {
  CartDb._internal();
  static final CartDb instance = CartDb._internal();
  factory CartDb() => instance;
  static const _boxName = 'cart-box';

  //Cart-Box-Functions

  Future<dynamic> addToCart({required HiveSneakerModel sneaker}) async {
    try {
      Box<HiveSneakerModel> cartBox = await Hive.openBox(_boxName);

      cartBox.put(sneaker.id, sneaker);

      return true;
    } catch (e) {
      return e;
    }
  }

  Future<List<HiveSneakerModel>> fetchCartProducts() async {
    Box<HiveSneakerModel> cartBox = await Hive.openBox(_boxName);
    return cartBox.values.toList();
  }

  Future<dynamic> deleteCartProduct({required String id}) async {
    try {
      Box<HiveSneakerModel> cartBox = await Hive.openBox(_boxName);

      cartBox.delete(id);
    } catch (e) {
      return e;
    }
  }
}
