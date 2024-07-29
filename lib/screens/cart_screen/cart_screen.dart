import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/database/functions/cart_box/cart_db.dart';
import 'package:shoe_mart/database/models/sneaker_model/hive_sneaker_model.dart';
import 'package:shoe_mart/providers/database_provider.dart';
import 'package:shoe_mart/screens/cart_screen/widgets/cart_product_card.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        //Top-heading
        title: Text(
          'My Cart',
          style: appTextStyle(
              fontSize: 35.0,
              fontColor: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            //Cart-Product-Card
            CartProductCard(width: width, height: height),

            //Checkout-Button
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: width,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: Text(
                    'Proceed to Checkout',
                    style: appTextStyle(
                        fontSize: 23.0,
                        fontColor: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
