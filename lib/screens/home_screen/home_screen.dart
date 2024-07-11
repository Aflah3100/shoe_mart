import 'package:flutter/material.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';
import 'package:shoe_mart/utils/utils.dart';


class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
   
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          //Background-Image-Container
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(backgroundShoeImage), fit: BoxFit.fill)),
          ),
          //Base-Home-Screen-Container
          Container(
            width: width,
            height: height,
            padding: EdgeInsets.all(height * 0.02),
            child: Center(
              child: Text(
                'Home Screen',
                style: appTextStyle(
                    fontSize: 30,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
