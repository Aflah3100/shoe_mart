import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/models/sneaker_model.dart';
import 'package:shoe_mart/providers/product_provider.dart';
import 'package:shoe_mart/screens/product_display_screen/widgets/product_details.dart';
import 'package:shoe_mart/screens/product_display_screen/widgets/product_images.dart';

class ScreenProductDisplay extends StatelessWidget {
  ScreenProductDisplay(
      {super.key, required this.sneaker, required this.tabIndex});

  final _pageController = PageController();
  final SneakerModel sneaker;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,

            //Top-icon-row
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Close-icon-button
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<ProductProvider>().clearShoeSize();
                  },
                  icon: const Icon(Ionicons.close, color: Colors.black),
                ),

                //Ellipse-horizontal-icon-button
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Ionicons.ellipsis_horizontal,
                      color: Colors.black),
                ),
              ],
            ),

            pinned: false,
            snap: false,
            floating: true,
            expandedHeight: height,

            flexibleSpace: FlexibleSpaceBar(
              //Base-Stack
              background: Stack(
                children: [
                  //Product-images-page-view
                  ProductImages(
                      width: width,
                      height: height,
                      sneaker: sneaker,
                      pageController: _pageController),

                  //Product-details-widget
                  Positioned(
                      top: height * 0.45,
                      child: ProductDetails(
                        height: height,
                        width: width,
                        sneaker: sneaker,
                        tabIndex: tabIndex,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
