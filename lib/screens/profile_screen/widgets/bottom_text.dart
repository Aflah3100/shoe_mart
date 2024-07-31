import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';

class BottomText extends StatelessWidget {
  const BottomText({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            FontAwesomeIcons.shoelace,
            color: Colors.black,
            size: 35.0,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                'Step into comfort and style with ShoeMart.',
                style: appTextStyle(
                    fontSize: 11.0,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                'Our one-stop shop for the latest in footwear,',
                style: appTextStyle(
                    fontSize: 9.0,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                'always secure and effortlessly chic.',
                style: appTextStyle(
                    fontSize: 9.0,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
            ],
          )
        ],
      ),
    );
  }
}