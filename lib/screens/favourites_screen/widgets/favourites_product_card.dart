import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/database/functions/favourites_box/favourites_db.dart';
import 'package:shoe_mart/database/models/sneaker_model/hive_sneaker_model.dart';
import 'package:shoe_mart/models/sneaker_model.dart';
import 'package:shoe_mart/providers/favourites_database_provider.dart';
import 'package:shoe_mart/screens/product_display_screen/product_display_screen.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';

class FavouritesProductCard extends StatelessWidget {
  const FavouritesProductCard({
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
    final favouritesDatabaseNotifier =
        context.read<FavouritesDatabaseProvider>();
    final String sneakerType;

    if (hiveSneaker.tabIndex == 0) {
      sneakerType = 'Men Sneakers';
    } else if (hiveSneaker.tabIndex == 1) {
      sneakerType = 'Women Shoes';
    } else {
      sneakerType = 'Kids Sneakers';
    }

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
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox.expand(
                  child: Image.network(
                hiveSneaker.imageUrl[0],
                fit: BoxFit.contain,
              )),
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
                  //Sneaker-Category
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
                        '\$ ${hiveSneaker.price}',
                        style: appTextStyle(
                            fontSize: 18.0,
                            fontColor: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      //Sneaker-Type
                      Text(
                        sneakerType,
                        style: appTextStyle(
                            fontSize: 15.0,
                            fontColor: Colors.blueGrey,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),

          //Sneaker-Dislike-Container
          Container(
            height: height,
            width: width * 0.10,
            padding: EdgeInsets.symmetric(vertical: height * 0.01),
            child: IconButton(
                onPressed: () async {
                  final result = await FavouritesDb.instance
                      .deleteFavouritesProduct(productId: hiveSneaker.id);

                  if (result is bool) {
                    //Success-in-deleting-from-favourite-cart
                    favouritesDatabaseNotifier.deleteProductFromFavouritesList(
                        id: hiveSneaker.id);
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
                },
                icon: const Icon(Ionicons.heart_dislike)),
          )
        ],
      ),
    );
  }
}
