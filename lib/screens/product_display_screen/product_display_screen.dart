import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shoe_mart/models/sneaker_model.dart';

class ScreenProductDisplay extends StatelessWidget {
  ScreenProductDisplay({super.key, required this.sneaker});

  final _pageController = PageController();
  final SneakerModel sneaker;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,

            //Top-icon-row
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Close-icon-button
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Ionicons.close, color: Colors.black),
                ),

                //ellipse-horizontal-icon-button
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Ionicons.ellipsis_horizontal,
                      color: Colors.black),
                ),
              ],
            ),

            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: height,

            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  SizedBox(
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
                              Image.network(
                                  fit: BoxFit.contain, sneaker.imageUrl[index]),
                              //like-button
                              Positioned(
                                top: height * 0.09,
                                left: width * 0.86,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Ionicons.heart_outline,
                                      size: 25.0,
                                    )),
                              ),
                              //circle-scroll-indicator
                              Positioned(
                                bottom: 40,
                                left: width * 0.44,
                                child: Row(
                                    children: List<Widget>.generate(
                                        sneaker.imageUrl.length,
                                        (ind) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 3),
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
