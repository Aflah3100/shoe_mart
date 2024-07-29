import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/database/functions/cart_box/cart_db.dart';
import 'package:shoe_mart/database/models/sneaker_model/hive_sneaker_model.dart';
import 'package:shoe_mart/models/sneaker_model.dart';
import 'package:shoe_mart/providers/database_provider.dart';
import 'package:shoe_mart/screens/product_display_screen/product_display_screen.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.width,
    required this.height,
    required this.hiveSneaker,
  });

  final double width;
  final double height;
  final HiveSneakerModel hiveSneaker;

  @override
  Widget build(BuildContext context) {
    final databaseNotifier = context.read<CartDatabaseProvider>();
    return Container(
      width: width,
      height: height * 0.12,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
      child: Row(
        children: [
          //Sneaker-Image-Container
          SizedBox(
            width: width * 0.25,
            height: height * 0.12,
            child: Stack(
              children: [
                //sneaker-image
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SizedBox.expand(
                      child: Image.network(
                    hiveSneaker.imageUrl[0],
                    fit: BoxFit.contain,
                  )),
                ),
                //Delete-Icon
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: width * 0.10,
                    height: height * 0.03,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0)),
                    ),
                    child: Center(
                        child: IconButton(
                            onPressed: () async {
                              String productId = CartDb.instance.getProductId(
                                  sneakerId: hiveSneaker.id,
                                  sneakerSize: hiveSneaker.selectedSize);
                              final result = await CartDb.instance
                                  .deleteCartProduct(productId: productId);
                              if (result is bool) {
                                //Deletion-Success
                                databaseNotifier.deleteSneakerFromCartList(
                                    sneakerId: hiveSneaker.id,
                                    sneakerSize: hiveSneaker.selectedSize);
                              }
                            },
                            icon: const Icon(
                              Ionicons.trash_outline,
                              color: Colors.white,
                              size: 19.0,
                            ))),
                  ),
                ),
              ],
            ),
          ),

          //Snaker-Description-Container
          GestureDetector(
            onTap: () {
              final sneakerModel = SneakerModel(
                  id: hiveSneaker.id,
                  name: hiveSneaker.name,
                  category: hiveSneaker.category,
                  imageUrl: hiveSneaker.imageUrl,
                  oldPrice: hiveSneaker.oldPrice,
                  sizes: hiveSneaker.sizes,
                  price: hiveSneaker.price,
                  description: hiveSneaker.description,
                  title: hiveSneaker.title);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => ScreenProductDisplay(
                          sneaker: sneakerModel,
                          tabIndex: hiveSneaker.tabIndex)));
            },
            child: Container(
              width: width * 0.55,
              height: height * 0.12,
              padding: EdgeInsets.only(
                  top: height * 0.01,
                  bottom: height * 0.01,
                  left: width * 0.035),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Sneaker-Title
                  Text(
                    hiveSneaker.name,
                    maxLines: 1,
                    style: appTextStyle(
                        fontSize: 20.0,
                        fontColor: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  //Sneaker-Description
                  Text(
                    maxLines: 1,
                    hiveSneaker.category,
                    style: appTextStyle(
                        fontSize: 18.0,
                        fontColor: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      //Sneaker-Price
                      Text(
                        '\$ ${hiveSneaker.price} ',
                        style: appTextStyle(
                            fontSize: 18.0,
                            fontColor: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      //Sneaker-Size
                      Text(
                        'Size:  ${hiveSneaker.selectedSize}',
                        style: appTextStyle(
                            fontSize: 18.0,
                            fontColor: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),

          //Sneaker-Count-Container
          Container(
            height: height,
            width: width * 0.10,
            padding: EdgeInsets.symmetric(vertical: height * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //minus-button
                SneakerCountButton(
                  width: width,
                  height: height,
                  icon: const Icon(
                    Ionicons.remove,
                    color: Colors.white,
                    size: 20,
                  ),
                  onTap: () async {
                    final productId = CartDb.instance.getProductId(
                        sneakerId: hiveSneaker.id,
                        sneakerSize: hiveSneaker.selectedSize);
                    CartDb.instance.decrementProductCount(productId: productId);
                    databaseNotifier.addProductsToCartList(
                        productList: await CartDb.instance.fetchCartProducts());
                  },
                  color: Colors.grey,
                ),
                //Sneaker-count-text
                Text(
                  hiveSneaker.count.toString(),
                  style: appTextStyle(
                      fontSize: 20.0,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                //sneaker-add-button
                SneakerCountButton(
                  width: width,
                  height: height,
                  icon: const Icon(
                    Ionicons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                  onTap: () async {
                    final productId = CartDb.instance.getProductId(
                        sneakerId: hiveSneaker.id,
                        sneakerSize: hiveSneaker.selectedSize);
                    CartDb.instance.incrementProductCount(productId: productId);
                    databaseNotifier.addProductsToCartList(
                        productList: await CartDb.instance.fetchCartProducts());
                  },
                  color: Colors.black,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SneakerCountButton extends StatelessWidget {
  const SneakerCountButton({
    super.key,
    required this.width,
    required this.height,
    required this.icon,
    required this.onTap,
    required this.color,
  });

  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.05,
        height: height * 0.02,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(5.0)),
        child: Center(child: icon),
      ),
    );
  }
}
