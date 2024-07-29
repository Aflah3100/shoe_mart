import 'package:hive_flutter/adapters.dart';
import 'package:shoe_mart/database/models/sneaker_model/hive_sneaker_model.dart';

 //Cart-Box-Functions
class CartDb {
  //Singelton
  CartDb._internal();
  static final CartDb instance = CartDb._internal();
  factory CartDb() => instance;
  static const _boxName = 'cart-box';

 

  Future<dynamic> addToCart({required HiveSneakerModel sneaker}) async {
    try {

      Box<HiveSneakerModel> cartBox = await Hive.openBox(_boxName);

      final String productid = '${sneaker.id}\\${sneaker.size}';

      if (cartBox.containsKey(productid)) {
        HiveSneakerModel? sneaker = cartBox.get(productid);

        sneaker!.count += 1;
        cartBox.put(productid, sneaker);
        return 1;
      } else {
        cartBox.put(productid, sneaker);
        return 0;
      }


    
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

  Future<dynamic> clearAll() async {
    Box<HiveSneakerModel> cartBox = await Hive.openBox(_boxName);
    cartBox.clear();
  }
}
