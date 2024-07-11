import 'package:flutter/material.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';
import 'package:shoe_mart/utils/utils.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      //Base-Container
      body: SizedBox(
          width: width,
          height: height,
          child: const Center(
            //Shoe-Display
            child: Text('Search'),
          )),
    );
  }
}

