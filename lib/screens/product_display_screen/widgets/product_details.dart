import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/database/functions/favourites_box/favourites_db.dart';
import 'package:shoe_mart/models/sneaker_model.dart';
import 'package:shoe_mart/providers/favourites_database_provider.dart';
import 'package:shoe_mart/providers/product_provider.dart';
import 'package:shoe_mart/screens/home_screen/widgets/like_button.dart';
import 'package:shoe_mart/screens/product_display_screen/widgets/add_to_cart_button.dart';
import 'package:shoe_mart/screens/product_display_screen/widgets/size_button.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';
import 'package:shoe_mart/utils/utils.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails(
      {super.key,
      required this.height,
      required this.width,
      required this.sneaker,
      required this.tabIndex});

  final double height;
  final double width;
  final SneakerModel sneaker;
  final int tabIndex;

  Future<dynamic> showSizeChart(BuildContext context, int index) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        final height = MediaQuery.of(context).size.height * 1;
        final width = MediaQuery.of(context).size.width * 1;
        //Base-Container
        return Container(
          width: width,
          height: height * 0.80,
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          child: Column(
            children: [
              Text(
                'Size Chart ',
                style: appTextStyle(
                    fontSize: 25.0,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              //Image-container
              Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: (index == 0)
                          ? AssetImage(menSizeGuide)
                          : (index == 1)
                              ? AssetImage(womenSizeGuide)
                              : AssetImage(kidsSizeGuide)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final favouritesDatabaseNotifier =
        context.read<FavouritesDatabaseProvider>();
    FavouritesDb.instance.fetchFavouritesProducts().then((productList) {
      favouritesDatabaseNotifier.addProductsToFavouritesList(
          productList: productList);
    });
    return Container(
      height: height * 0.60,
      width: width,
      padding: const EdgeInsets.all(15.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Produt-Name-Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //product-name
              Text(
                sneaker.name ?? 'Latest Sneaker',
                style: appTextStyle(
                    fontSize: 25,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              LikeButton(
                  displaySneaker: sneaker,
                  tabIndex: tabIndex,
                  favouritesDatabaseNotifier: favouritesDatabaseNotifier)
            ],
          ),

          //product-category
          Text(
            maxLines: 1,
            overflow: TextOverflow.fade,
            sneaker.category ?? '',
            style: appTextStyle(
                fontSize: 20,
                fontColor: Colors.grey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: height * 0.01,
          ),

          //product-price
          Text(
            '\$ ${sneaker.price ?? ''}',
            style: appTextStyle(
                fontSize: 25,
                fontColor: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          //Size-text-row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Sneaker Size',
                style: appTextStyle(
                    fontSize: 20,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w600),
              ),

              //Size-guide-button
              GestureDetector(
                onTap: () {
                  showSizeChart(context, tabIndex);
                },
                child: Text(
                  'Size Guide?',
                  style: appTextStyle(
                      fontSize: 17,
                      fontColor: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),

          //Size-button-consumer
          SizedBox(
            height: height * 0.05,
            width: width,
            child: Consumer<ProductProvider>(
              builder: (context, productNotifier, child) {
                return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      String shoeSize = sneaker.sizes[index]["size"];
                      return SizeButton(
                        label: shoeSize.toString(),
                        onTap: () {
                          productNotifier.setShoeSize(shoeSize);
                        },
                        labelColor: (productNotifier.getShoeSize() == shoeSize)
                            ? Colors.white
                            : Colors.black,
                        backgroundColor:
                            (productNotifier.getShoeSize() == shoeSize
                                ? Colors.black
                                : const Color.fromARGB(255, 189, 189, 189)),
                      );
                    },
                    separatorBuilder: (ctx, index) => const SizedBox(
                          width: 25,
                        ),
                    itemCount: sneaker.sizes.length);
              },
            ),
          ),

          SizedBox(
            height: height * 0.01,
          ),

          const Divider(
            color: Colors.grey,
            thickness: 0.5,
          ),

          //Product-title-text
          Text(
            maxLines: 2,
            overflow: TextOverflow.fade,
            sneaker.title ?? '',
            style: appTextStyle(
                fontSize: 20,
                fontColor: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.01,
          ),

          //Product-description-text
          Flexible(
            child: Text(
              maxLines: 8,
              overflow: TextOverflow.fade,
              sneaker.description ?? '',
              style: appTextStyle(
                  fontSize: 15,
                  fontColor: Colors.grey,
                  fontWeight: FontWeight.normal),
            ),
          ),
          //checkout-button
          Align(
            alignment: Alignment.bottomCenter,
            child: AddToCartButton(
              height: height,
              width: width,
              sneaker: sneaker,
              tabIndex: tabIndex,
            ),
          )
        ],
      ),
    );
  }
}
