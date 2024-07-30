import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/database/functions/favourites_box/favourites_db.dart';
import 'package:shoe_mart/models/sneaker_model.dart';
import 'package:shoe_mart/providers/favourites_database_provider.dart';
import 'package:shoe_mart/screens/home_screen/widgets/like_button.dart';
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
      final productIdList = productList.map((sneaker) => sneaker.id).toList();
      favouritesDatabaseNotifier.addProductsIdsToFavouritesList(
          productIdList: productIdList);
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
            LikeButton(
                displaySneaker: displaySneaker,
                tabIndex: tabIndex,
                favouritesDatabaseNotifier: favouritesDatabaseNotifier),

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
