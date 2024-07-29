import 'package:hive_flutter/adapters.dart';
import 'package:shoe_mart/database/models/sneaker_model/hive_sneaker_model.dart';

//Cart-Box-Functions
class CartDb {
  //Singelton
  CartDb._internal();
  static final CartDb instance = CartDb._internal();
  factory CartDb() => instance;
  static const _boxName = 'cart-box';

  String getProductId(
      {required String sneakerId, required String sneakerSize}) {
    return '$sneakerId\\$sneakerSize';
  }

  Future<dynamic> addToCart({required HiveSneakerModel sneaker}) async {
    try {
      Box<HiveSneakerModel> cartBox = await Hive.openBox(_boxName);

      final String productid = getProductId(
          sneakerId: sneaker.id, sneakerSize: sneaker.selectedSize);

      if (cartBox.containsKey(productid)) {
        HiveSneakerModel? sneaker = cartBox.get(productid);

        sneaker!.count += 1;
        cartBox.put(productid, sneaker);
      } else {
        cartBox.put(productid, sneaker);
      }

      return true;
    } catch (e) {
      return e;
    }
  }

  Future<List<HiveSneakerModel>> fetchCartProducts() async {
    Box<HiveSneakerModel> cartBox = await Hive.openBox(_boxName);

    return cartBox.values.toList();
  }

  Future<dynamic> deleteCartProduct({required String productId}) async {
    try {
      Box<HiveSneakerModel> cartBox = await Hive.openBox(_boxName);

      await cartBox.delete(productId);

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

  Future<dynamic> incrementProductCount({required String productId}) async {
    try {
      Box<HiveSneakerModel> cartBox = await Hive.openBox(_boxName);

      if (cartBox.containsKey(productId)) {
        HiveSneakerModel? sneaker = cartBox.get(productId);
        if (sneaker!.count < 10) {
          sneaker.count += 1;
          cartBox.put(productId, sneaker);
          return true;
        }
      } else {
        return false;
      }
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> decrementProductCount({required String productId}) async {
    try {
      Box<HiveSneakerModel> cartBox = await Hive.openBox(_boxName);

      if (cartBox.containsKey(productId)) {
        HiveSneakerModel? sneaker = cartBox.get(productId);
        if (sneaker!.count > 1) {
          sneaker.count -= 1;
          cartBox.put(productId, sneaker);
          return true;
        }
      } else {
        return false;
      }
    } catch (e) {
      return e;
    }
  }
}
