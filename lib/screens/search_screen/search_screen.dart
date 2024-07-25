import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoe_mart/screens/all_products_screen/widgets/staggered_shoe_tile.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';
import 'package:shoe_mart/utils/utils.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        backgroundColor: Colors.black38,
        //Base-Container
        body: SizedBox(
            width: width,
            height: height,
            child: Center(
              //Shoe-Display
              child: Text("search"),
            )));
  }
}
