import 'package:flutter/material.dart';
import 'package:shoe_mart/models/sneaker_model.dart';
import 'package:shoe_mart/screens/all_products_screen/all_products_screen.dart';
import 'package:shoe_mart/screens/home_screen/widgets/shoe_display_card.dart';
import 'package:shoe_mart/screens/product_display_screen/product_display_screen.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';

class DisplaySneaker extends StatelessWidget {
  const DisplaySneaker({
    super.key,
    required this.width,
    required this.height,
    required Future<List<SneakerModel>> sneakerList,
    required this.tabIndex,
  }) : _sneakerList = sneakerList;

  final double width;
  final double height;
  final Future<List<SneakerModel>> _sneakerList;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.65,
      color: Colors.transparent,
      child: Column(
        children: [
          // Shoe-Display-SizedBox
          Padding(
            padding: EdgeInsets.symmetric(horizontal: height * 0.01),
            child: SizedBox(
                width: width,
                height: height * 0.38,
                child: FutureBuilder(
                    future: _sneakerList,
                    builder: (ctx, snapshot) {
                      //Connection-state-waiting
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } //Snapshot-has-data
                      else if (snapshot.hasData) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            final currentShoe = snapshot.data![index];
                            return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => ScreenProductDisplay(
                                            sneaker: currentShoe,
                                            tabIndex: tabIndex,
                                          )));
                                },
                                child: ShoeDisplayCard(
                                  width: width,
                                  height: height,
                                  displaySneaker: currentShoe,
                                  tabIndex: tabIndex,
                                ));
                          },
                          separatorBuilder: (ctx, index) => SizedBox(
                            width: width * 0.03,
                          ),
                          itemCount: 10,
                        );
                      } //Snapshot-no-data
                      else {
                        return Center(
                            child: Text('OOPS , No Shoes Found!',
                                style: appTextStyle(
                                    fontSize: 25.0,
                                    fontColor: Colors.white,
                                    fontWeight: FontWeight.bold)));
                      }
                    })),
          ),
          SizedBox(height: height * 0.02),
          // Text-Row-Container
          Container(
            width: width,
            height: height * 0.04,
            margin: EdgeInsets.symmetric(horizontal: height * 0.01),
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: width * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Heading-1
                Text(
                  'Latest Shoes',
                  style: appTextStyle(
                    fontSize: 25.0,
                    fontColor: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Heading-2-Row
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => ScreenAllProducts(
                              tabIndex: tabIndex,
                            )));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Show All',
                        style: appTextStyle(
                          fontSize: 20,
                          fontColor: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.02),
          // Bottom-Shoe-Display-SizedBox
          SizedBox(
              width: width,
              height: height * 0.15,
              child: FutureBuilder(
                  future: _sneakerList,
                  builder: (ctx, snapshot) {
                    //Connection-state-waiting
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } //Snapshot-has-data
                    else if (snapshot.hasData) {
                      return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            final currentShoe = snapshot.data![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => ScreenProductDisplay(
                                              sneaker: currentShoe,
                                              tabIndex: tabIndex,
                                            )));
                              },
                              child: ShoeDisplayCardSmall(
                                  width: width,
                                  height: height,
                                  imageUrl: currentShoe.imageUrl.length > 1
                                      ? currentShoe.imageUrl[1]
                                      : currentShoe.imageUrl[0]),
                            );
                          },
                          separatorBuilder: (ctx, index) => SizedBox(
                                width: width * 0.02,
                              ),
                          itemCount: 10);
                    } //Snapshot-no-data
                    else {
                      return Center(
                          child: Text('OOPS , No Shoes Found!',
                              style: appTextStyle(
                                  fontSize: 25.0,
                                  fontColor: Colors.white,
                                  fontWeight: FontWeight.bold)));
                    }
                  })),
        ],
      ),
    );
  }
}
