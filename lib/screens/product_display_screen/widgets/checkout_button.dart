import 'package:flutter/material.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(top: height * 0.01),
        width: width * 0.90,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0), color: Colors.black),
        child: Center(
          child: Text(
            "Add to Bag",
            style: appTextStyle(
                fontSize: 20.0,
                fontColor: Colors.white,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
