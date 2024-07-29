import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/database/functions/cart_box/cart_db.dart';
import 'package:shoe_mart/database/models/sneaker_model/hive_sneaker_model.dart';
import 'package:shoe_mart/models/sneaker_model.dart';
import 'package:shoe_mart/providers/database_provider.dart';
import 'package:shoe_mart/providers/product_provider.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.height,
    required this.width,
    required this.sneaker,
  });

  final double height;
  final double width;
  final SneakerModel sneaker;

  @override
  Widget build(BuildContext context) {
    final productNotifier = context.read<ProductProvider>();
    final databaseNotifier = context.read<DatabaseProvider>();
    return GestureDetector(
      onTap: () async {
        // CartDb.instance.clearAll();
        if (productNotifier.getShoeSize().isEmpty) {
          //Shoe-Size-Not-Selected
          Fluttertoast.showToast(
            msg: 'Please Select a Shoe Size',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 15.0,
          );
        } else {
          final selectedSneaker = HiveSneakerModel(
              id: sneaker.id!,
              name: sneaker.name!,
              category: sneaker.category!,
              price: sneaker.price!,
              size: productNotifier.getShoeSize(),
              imageUrl: sneaker.imageUrl[0]);
          //Adding-to-cartdb.
          final result =
              await CartDb.instance.addToCart(sneaker: selectedSneaker);

          if (result is int) {
            if (result ==0) {
              //New Sneaker model object is created 
              databaseNotifier.addSneakerToCartList(sneaker: selectedSneaker);
            }
            Navigator.pop(context);
            productNotifier.clearShoeSize();
            Fluttertoast.showToast(
              msg: 'Added To Cart!!',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 15.0,
            );
          } else {
            Fluttertoast.showToast(
              msg: 'OOPS!! , Some Error Occured',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 15.0,
            );
          }
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: height * 0.01),
        width: width * 0.90,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0), color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Add to Cart",
              style: appTextStyle(
                  fontSize: 20.0,
                  fontColor: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            const Icon(
              Ionicons.bag,
              color: Colors.white,
              size: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
