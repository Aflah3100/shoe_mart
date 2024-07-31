import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/providers/screen_provider.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final screensProviderModel =
        Provider.of<ScreensProvider>(context, listen: true);
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[850], borderRadius: BorderRadius.circular(15.0)),
      margin: EdgeInsets.only(
          left: height * 0.02, right: height * 0.02, bottom: height * 0.01),
      width: width,
      height: height * 0.065,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Home-Icon-Button
          BottomNavIconButton(
            onPressed: () {
              screensProviderModel.setScreenIndex(0);
            },
            icon: Icons.home_outlined,
            size: 27,
            backgroundColor: (screensProviderModel.getScreenIndex() == 0)
                ? Colors.white
                : Colors.transparent,
            highlightColor: Colors.white,
            iconColor: (screensProviderModel.getScreenIndex() == 0)
                ? Colors.black
                : Colors.white,
          ),

          //Favourites-Icon-Button
          BottomNavIconButton(
            onPressed: () {
              screensProviderModel.setScreenIndex(1);
            },
            icon: Icons.favorite_outline,
            size: 27,
            backgroundColor: (screensProviderModel.getScreenIndex() == 1)
                ? Colors.white
                : Colors.transparent,
            highlightColor: Colors.white,
            iconColor: (screensProviderModel.getScreenIndex() == 1)
                ? Colors.black
                : Colors.white,
          ),
          //Cart-Icon-Button
          BottomNavIconButton(
            onPressed: () {
              screensProviderModel.setScreenIndex(2);
            },
            icon: Icons.shopping_cart_outlined,
            size: 27,
            backgroundColor: (screensProviderModel.getScreenIndex() == 2)
                ? Colors.white
                : Colors.transparent,
            highlightColor: Colors.white,
            iconColor: (screensProviderModel.getScreenIndex() == 2)
                ? Colors.black
                : Colors.white,
          ),
          //User-Profile-Icon-Button
          BottomNavIconButton(
            onPressed: () {
              screensProviderModel.setScreenIndex(3);
            },
            icon: Icons.person_2_outlined,
            size: 27,
            backgroundColor: (screensProviderModel.getScreenIndex() == 3)
                ? Colors.white
                : Colors.transparent,
            highlightColor: Colors.white,
            iconColor: (screensProviderModel.getScreenIndex() == 3)
                ? Colors.black
                : Colors.white,
          ),
        ],
      ),
    );
  }
}

class BottomNavIconButton extends StatelessWidget {
  const BottomNavIconButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.size,
      required this.backgroundColor,
      required this.highlightColor,
      required this.iconColor});

  final void Function()? onPressed;
  final Color backgroundColor;
  final Color highlightColor;
  final IconData icon;
  final Color iconColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
        highlightColor: highlightColor,
        style: appButtonStyle(backgroundColor: backgroundColor),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor,
          size: size,
        ));
  }
}
