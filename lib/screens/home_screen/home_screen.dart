import 'package:flutter/material.dart';
import 'package:shoe_mart/screens/home_screen/widgets/shoe_display_card.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';
import 'package:shoe_mart/utils/utils.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> with TickerProviderStateMixin {
  // Controllers
  late final _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            // Background-Image-Container
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundShoeImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // Base-Home-Screen-Container
            SizedBox(
              width: width,
              height: height,
              child: Column(
                children: [
                  // Top-Text-SizedBox
                  Padding(
                    padding: EdgeInsets.all(height * 0.02),
                    child: SizedBox(
                      width: width,
                      height: height * 0.09,
                      child: Text(
                        'The Ultimate Shoe\n Collection',
                        style: appTextStyle(
                          fontSize: 33,
                          fontColor: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  TabBar(
                    padding: EdgeInsets.symmetric(horizontal: height * 0.02),
                    tabAlignment: TabAlignment.start,
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.black,
                    isScrollable: true,
                    labelColor: Colors.white,
                    dividerColor: Colors.transparent,
                    unselectedLabelColor: Colors.white24,
                    labelStyle: appTextStyle(
                      fontSize: 20,
                      fontColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: const [
                      Tab(text: 'Men shoes'),
                      Tab(text: 'Women Shoes'),
                      Tab(text: 'Kids Shoes'),
                    ],
                  ),
                  // Tab-Bar-View-Container
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: height * 0.02),
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // Men's-shoe-Base-Container
                          Container(
                            width: width,
                            height: height * 0.65,
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                // Shoe-Display-SizedBox
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: height * 0.01),
                                  child: SizedBox(
                                    width: width,
                                    height: height * 0.40,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (ctx, index) {
                                        return ShoeDisplayCard(
                                          height: height,
                                          width: width,
                                          image: adidasLogo,
                                          shoeName: 'Ultra Boost Shoes',
                                          shoeDescription: 'Men\'s Running',
                                          price: '79.00',
                                          colors: const [
                                            Colors.black,
                                            Colors.red,
                                            Colors.blue,
                                            Colors.green,
                                            Colors.yellow
                                          ],
                                        );
                                      },
                                      separatorBuilder: (ctx, index) =>
                                          SizedBox(
                                        width: width * 0.03,
                                      ),
                                      itemCount: 10,
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * 0.02),
                                // Text-Row-Container
                                Container(
                                  width: width,
                                  height: height * 0.04,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: height * 0.01),
                                  color: Colors.transparent,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.01),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Heading-1
                                      Text(
                                        'Latest Shoes',
                                        style: appTextStyle(
                                          fontSize: 25.0,
                                          fontColor: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // Heading-2-Row
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Show All',
                                            style: appTextStyle(
                                              fontSize: 20,
                                              fontColor: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.arrow_right,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: height * 0.02),
                                // Bottom-Shoe-Display-SizedBox
                                SizedBox(
                                    width: width,
                                    height: height * 0.15,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (ctx, index) {
                                          return ShoeDisplayCardSmall(
                                              width: width,
                                              height: height,
                                              image: jordanLogo);
                                        },
                                        separatorBuilder: (ctx, index) =>
                                            SizedBox(
                                              width: width * 0.02,
                                            ),
                                        itemCount: 10)),
                              ],
                            ),
                          ),
                          // Women's-shoe-Container
                          Container(
                            width: width,
                            height: height * 0.40,
                            color: Colors.green,
                          ),
                          // Kids-shoe-Container
                          Container(
                            width: width,
                            height: height * 0.40,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
