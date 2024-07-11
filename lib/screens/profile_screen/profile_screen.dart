import 'package:flutter/material.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(

      //Base-Container
      body: Container(
        width: width,
        height: height,
        child: Center(
          child: Text(
            'Profile Screen',
            style: appTextStyle(
                fontSize: 35,
                fontColor: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
