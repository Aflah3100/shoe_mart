//Assets
import 'dart:ui';

import 'package:flutter/material.dart';

String backgroundShoeImage = 'assets/images/shoe_background_image.jpg';
String adidasLogo = 'assets/images/adidas.png';
String gucciLogo = 'assets/images/gucci.png';
String jordanLogo = 'assets/images/jordan.png';
String nikeLogo = 'assets/images/nike.png';
String topImage = 'assets/images/top_image.png';
String menSizeGuide = 'assets/images/men_shoes_size_guide.png';
String womenSizeGuide = 'assets/images/women_shoe_size_guide.png';
String kidsSizeGuide = 'assets/images/kids_shoe_size_guide.png';
String menShoesJson = 'assets/json/men_shoes.json';
String kidsShoesJson = 'assets/json/kids_shoes.json';
String womenShoesJson = 'assets/json/women_shoes.json';

//Colors
const bgColor = Color(0xffe2e2e2);

//enums
enum Logintype { sigin, signup }

double getResponsiveFontSize(BuildContext context, double baseFontSize) {
  double baseWidth = 475.0;
  double screenWidth = MediaQuery.of(context).size.width;
  return baseFontSize * (screenWidth / baseWidth);
}
