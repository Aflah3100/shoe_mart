import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/database/functions/cart_box/cart_db.dart';
import 'package:shoe_mart/providers/database_provider.dart';
import 'package:shoe_mart/screens/cart_screen/widgets/cart_product_card.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    CartDb.instance.fetchCartProducts().then((productList) {
      context
          .read<CartDatabaseProvider>()
          .addProductsToCartList(productList: productList);
    });
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: const Color(0xffe2e2e2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
            //Cart-Items-Builder
            Consumer<CartDatabaseProvider>(
              builder: (context, value, child) {
                return (value.getCartList().isNotEmpty)
                    ? ListView.separated(
                        itemBuilder: (ctx, index) {
                          return CartProductCard(
                            width: width,
                            height: height,
                            hiveSneaker: value.getCartList()[index],
                          );
                        },
                        separatorBuilder: (ctx, index) =>
                            SizedBox(height: height * 0.02),
                        itemCount: value.getCartList().length)
                    : Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Cart',
                              style: appTextStyle(
                                  fontSize: 25.0,
                                  fontColor: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Icon(
                              Ionicons.cart_sharp,
                              color: Colors.black54,
                              size: 35.0,
                            ),
                            Text(
                              'is Empty!',
                              style: appTextStyle(
                                  fontSize: 25.0,
                                  fontColor: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
              },
            ),

            Selector<CartDatabaseProvider, bool>(
                builder: (context, value, child) {
                  return //Checkout-Button
                      (!value)
                          ? Align(
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
                          : const SizedBox();
                },
                selector: (context, databaseProvider) =>
                    databaseProvider.isCartEmpty())
          ],
        ),
      )),
    );
  }
}
