import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/database/functions/favourites_box/favourites_db.dart';
import 'package:shoe_mart/database/models/sneaker_model/hive_sneaker_model.dart';
import 'package:shoe_mart/models/sneaker_model.dart';
import 'package:shoe_mart/providers/favourites_database_provider.dart';
import '../../../utils/themes/text_styles.dart';

class ShoeDisplayCard extends StatelessWidget {
  const ShoeDisplayCard({
    super.key,
    required this.width,
    required this.height,
    required this.displaySneaker,
    required this.tabIndex,
  });
  final double width;
  final double height;
  final SneakerModel displaySneaker;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    final favouritesDatabaseNotifier =
        context.read<FavouritesDatabaseProvider>();
    FavouritesDb.instance.fetchFavouritesProducts().then((productList) {
      favouritesDatabaseNotifier.addProductsToFavouritesList(
          productList: productList);
    });
    return Card(
      elevation: 10.0,
      shadowColor: Colors.grey,
      child: Container(
        padding: EdgeInsets.all(height * 0.01),
        width: width * 0.55,
        height: height * 0.40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<FavouritesDatabaseProvider>(
              builder: (context, notifier, child) {
                bool isLiked = false;
                final list = notifier.getFavouritesList();
                for (int i = 0; i < list.length; i++) {
                  if (list[i].id == displaySneaker.id) {
                    isLiked = true;
                    break;
                  }
                }
                return //Like-Button
                    IconButton(
                        onPressed: () async {
                          if (!isLiked) {
                            //Not-Liked-Product
                            final hiveSneaker = HiveSneakerModel(
                                id: displaySneaker.id!,
                                name: displaySneaker.name!,
                                category: displaySneaker.category!,
                                imageUrl: displaySneaker.imageUrl,
                                oldPrice: displaySneaker.oldPrice!,
                                sizes: displaySneaker.sizes,
                                price: displaySneaker.price!,
                                description: displaySneaker.description!,
                                title: displaySneaker.title!,
                                tabIndex: tabIndex,
                                selectedSize: '');
                            final result = await FavouritesDb.instance
                                .addToFavourites(sneaker: hiveSneaker);
                            if (result is bool) {
                              //Success-in-adding-to-favourties-cart
                              favouritesDatabaseNotifier
                                  .addSneakerToFavouriteList(
                                      sneaker: hiveSneaker);
                            } else {
                              //Error-in-adding-to-favourties-cart
                              Fluttertoast.showToast(
                                msg: 'OOPS!! , Some Error Occured',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 15.0,
                              );
                            }
                          } else {
                            //Liked-Product
                            final result = await FavouritesDb.instance
                                .deleteFavouritesProduct(
                                    productId: displaySneaker.id!);

                            if (result is bool) {
                              //Success-in-deleting-from-favourite-cart
                              favouritesDatabaseNotifier
                                  .deleteProductFromFavouritesList(
                                      id: displaySneaker.id!);
                            } else {
                              //Error-in-deleting-from-favourite-cart
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
                        icon: (isLiked)
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_outline));
              },
            ),

            //Shoe-Image-Container
            Container(
              width: width * 0.55,
              height: height * .15,
              color: Colors.transparent,
              child: Image.network(
                displaySneaker.imageUrl[0],
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            //Shoe-Text
            Text(
              displaySneaker.name!,
              style: appTextStyle(
                  fontSize: 25,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.005,
            ),
            //Shoe-Description-Text
            Text(
              displaySneaker.category!,
              style: appTextStyle(
                  fontSize: 20,
                  fontColor: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            //Shoe-Price
            Text(
              '\$ ${displaySneaker.price!}',
              style: appTextStyle(
                  fontSize: 22,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.007,
            ),
          ],
        ),
      ),
    );
  }
}

class ShoeDisplayCardSmall extends StatelessWidget {
  const ShoeDisplayCardSmall({
    super.key,
    required this.width,
    required this.height,
    required this.imageUrl,
  });

  final double width;
  final double height;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width * 0.30,
        height: height * 0.15,
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 0.8,
                  offset: Offset(0, 1))
            ]),
        child: Center(child: Image.network(imageUrl)));
  }
}
