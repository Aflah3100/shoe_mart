
import 'package:flutter/material.dart';
import 'package:shoe_mart/models/sneaker_model.dart';

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
    return SizedBox(
      width: width,
      height: height * 0.50,
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sneaker.imageUrl.length,
          controller: _pageController,
          onPageChanged: (page) {},
          itemBuilder: (ctx, index) {
            return Stack(
              children: [
                //Sneaker-Images
                Image.network(fit: BoxFit.contain, sneaker.imageUrl[index]),
                
                //circle-scroll-indicator
                Positioned(
                  bottom: 60,
                  left: width * 0.44,
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
                )
              ],
            );
          }),
    );
  }
}
