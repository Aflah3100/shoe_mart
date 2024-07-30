import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/database/functions/favourites_box/favourites_db.dart';
import 'package:shoe_mart/providers/favourites_database_provider.dart';
import 'package:shoe_mart/screens/favourites_screen/widgets/favourites_product_card.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';
import 'package:shoe_mart/utils/utils.dart';

class ScreenFavourites extends StatelessWidget {
  const ScreenFavourites({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: bgColor,
      //Base-Container
      body: SizedBox(
          width: width,
          height: height,
          //Base-Stack
          child: Stack(
            children: [
              //Black-background-container
              Container(
                width: width,
                height: height * 0.25,
                color: Colors.black,
              ),
              //Top-Image-Container
              Container(
                width: width,
                height: height * 0.35,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(topImage), fit: BoxFit.fill)),
              ),
              //Top-Heading
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.03, top: height * 0.02),
                child: SafeArea(
                    child: Row(
                  children: [
                    Text(
                      'My Favourites',
                      style: appTextStyle(
                          fontSize: 32.0,
                          fontColor: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    const Icon(
                      Ionicons.heart_sharp,
                      color: Colors.white,
                      size: 32.0,
                    )
                  ],
                )),
              ),
              Positioned(
                  top: height * 0.13,
                  child: Container(
                      width: width,
                      height: height,
                      padding: const EdgeInsets.all(15.0),
                      child: FutureBuilder(
                        future: FavouritesDb.instance.fetchFavouritesProducts(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.data!.isNotEmpty) {
                            return Consumer<FavouritesDatabaseProvider>(
                              builder: (context, notfier, child) {
                                return ListView.separated(
                                    itemBuilder: (ctx, index) {
                                      final sneaker = snapshot.data![index];
                                      return (notfier
                                              .getFavouritesIdList()
                                              .contains(sneaker.id))
                                          ? FavouritesProductCard(
                                              width: width,
                                              height: height,
                                              hiveSneaker: sneaker)
                                          : const SizedBox();
                                    },
                                    separatorBuilder: (ctx, index) => SizedBox(
                                          height: height * 0.01,
                                        ),
                                    itemCount: snapshot.data!.length);
                              },
                            );
                          } else {
                            return Center(
                              child: Text(
                                'No Products Added',
                                style: appTextStyle(
                                    fontSize: 30.0,
                                    fontColor: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }
                        },
                      )))
            ],
          )),
    );
  }
}
