import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/providers/screen_provider.dart';
import 'package:shoe_mart/screens/home_screen/home_screen.dart';
import 'package:shoe_mart/screens/main_screen/widgets/bottom_nav_bar.dart';
import 'package:shoe_mart/screens/cart_screen/cart_screen.dart';
import 'package:shoe_mart/screens/favourites_screen/favourites_screen.dart';
import 'package:shoe_mart/screens/profile_screen/profile_screen.dart';
import 'package:shoe_mart/screens/search_screen/search_screen.dart';

class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> appScreens = [
      const ScreenHome(),
      const ScreenSearch(),
      const ScreenFavourites(),
      const ScreenCart(),
      const ScreenProfile()
    ];
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;

    return Consumer<ScreensProvider>(builder: (context, value, child) {
      int screenIndex = value.getScreenIndex();
      return Scaffold(
        backgroundColor: (screenIndex == 0) ? Colors.transparent : Colors.white,
        body: appScreens[screenIndex],
        bottomNavigationBar: BottomNavBar(height: height, width: width),
      );
    });
  }
}
