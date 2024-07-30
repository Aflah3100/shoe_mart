import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/database/functions/favourites_box/favourites_db.dart';
import 'package:shoe_mart/database/models/sneaker_model/hive_sneaker_model.dart';
import 'package:shoe_mart/models/sneaker_model.dart';
import 'package:shoe_mart/providers/favourites_database_provider.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({
    super.key,
    required this.displaySneaker,
    required this.tabIndex,
    required this.favouritesDatabaseNotifier,
  });

  final SneakerModel displaySneaker;
  final int tabIndex;
  final FavouritesDatabaseProvider favouritesDatabaseNotifier;

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouritesDatabaseProvider>(
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
    );
  }
}