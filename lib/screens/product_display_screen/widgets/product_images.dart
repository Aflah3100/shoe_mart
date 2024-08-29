import 'package:flutter/material.dart';
import 'package:shoe_mart/models/sneaker_model.dart';
import 'package:shoe_mart/utils/utils.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({
    super.key,
    required this.width,
    required this.height,
    required this.sneaker,
    required PageController pageController,
  }) : _pageController = pageController;

  final double width;
  final double height;
  final SneakerModel sneaker;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sneaker.imageUrl.length,
          controller: _pageController,
          itemBuilder: (ctx, index) {
            return Stack(
              children: [
                //Sneaker-Images
                Image.network(fit: BoxFit.scaleDown, sneaker.imageUrl[index]),

                //circle-scroll-indicator
                Padding(
                  padding: EdgeInsets.only(left: width * 0.44, bottom: 10),
                  child: Align(
                    // top: height * 0.45,
                    // left: width * 0.44,
                    alignment: Alignment.bottomRight,
                    child: Row(
                        children: List<Widget>.generate(
                            sneaker.imageUrl.length,
                            (ind) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: CircleAvatar(
                                    radius: 4,
                                    backgroundColor: (ind == index)
                                        ? Colors.black
                                        : Colors.grey,
                                  ),
                                ))),
                  ),
                )
              ],
            );
          }),
    );
  }
}
