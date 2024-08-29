import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/models/sneaker_model.dart';
import 'package:shoe_mart/providers/product_provider.dart';
import 'package:shoe_mart/screens/product_display_screen/widgets/product_details.dart';
import 'package:shoe_mart/screens/product_display_screen/widgets/product_images.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';
import 'package:shoe_mart/utils/utils.dart';

class ScreenProductDisplay extends StatelessWidget {
  ScreenProductDisplay(
      {super.key, required this.sneaker, required this.tabIndex});

  final _pageController = PageController();
  final SneakerModel sneaker;
  final int tabIndex;
  final _scrollController = ScrollController();

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: bgColor,
      body: CustomScrollView(
        controller: _scrollController,
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
                //pop-up-menu
                PopupMenuButton<int>(
                  color: Colors.white,
                  onSelected: (value) {
                    if (value == 0) {
                      ProductDetails.showSizeChart(context, tabIndex);
                    } else if (value == 1) {
                      _scrollToBottom();
                    }
                  },
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          value: 0,
                          child: Text(
                            'Shoe Size Chart',
                            style: appTextStyle(
                                fontSize: 15,
                                fontColor: Colors.black,
                                fontWeight: FontWeight.w500),
                          )),
                      PopupMenuItem(
                          value: 1,
                          child: Text(
                            'Add to Cart',
                            style: appTextStyle(
                                fontSize: 15,
                                fontColor: Colors.black,
                                fontWeight: FontWeight.w500),
                          ))
                    ];
                  },
                )
              ],
            ),

            pinned: true,
            snap: true,

            floating: true,
            expandedHeight: height * 0.4,
            toolbarHeight: 30,
            flexibleSpace: FlexibleSpaceBar(
              background: ProductImages(
                  width: width,
                  height: height,
                  sneaker: sneaker,
                  pageController: _pageController),
            ),
          ),
          SliverToBoxAdapter(
            child:
                //Product-details-widget
                ProductDetails(
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
