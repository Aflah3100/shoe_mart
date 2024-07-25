import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoe_mart/models/sneaker_model.dart';
import 'package:shoe_mart/screens/all_products_screen/widgets/display_sneaker_grid.dart';
import 'package:shoe_mart/services/api_services.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';
import 'package:shoe_mart/utils/utils.dart';

class ScreenAllProducts extends StatefulWidget {
  const ScreenAllProducts({super.key});

  @override
  State<ScreenAllProducts> createState() => _ScreenAllProductsState();
}

class _ScreenAllProductsState extends State<ScreenAllProducts>
    with TickerProviderStateMixin {
  //Controllers
  late final _tabController = TabController(length: 3, vsync: this);

  //Sneaker-Lists
  late final Future<List<SneakerModel>> _maleSneakerList;
  late final Future<List<SneakerModel>> _womenSneakerList;
  late final Future<List<SneakerModel>> _kidsSneakerList;

  @override
  void initState() {
    _maleSneakerList = ApiServices.instance.fetchMenSneakers();
    _womenSneakerList = ApiServices.instance.fetchWomenSneakers();
    _kidsSneakerList = ApiServices.instance.fetchkidsSneakers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: const Color(0xffe2e2e2),
      //Base-Stack
      body: Stack(
        children: [
          //Black-background-container
          Container(
            width: width,
            height: height * 0.25,
            color: Colors.black,
          ),
          //Top-Image-Container
          Container(
            width: width,
            height: height * 0.35,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(topImage), fit: BoxFit.fill)),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  left: width * 0.03, right: width * 0.03, top: height * 0.02),
              child:
                  // Base-Column
                  Column(
                children: [
                  //Top-button-row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Close-button
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          size: 25.0,
                          FontAwesomeIcons.xmark,
                          color: Colors.white,
                        ),
                      ),
                      //sliders-button
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          size: 25.0,
                          FontAwesomeIcons.sliders,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  //Tab bar
                  TabBar(
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
                  SizedBox(
                    height: height * 0.03,
                  ),
                ],
              ),
            ),
          ),
          //Tabbar-view
          Padding(
            padding: EdgeInsets.only(top: height * 0.20, left: 12, right: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: TabBarView(controller: _tabController, children: [
                //Men-sneaker-grid
                DisplaySneakerGrid(
                    sneakerList: _maleSneakerList, width: width, height: height),
                //Women-sneaker-grid
                DisplaySneakerGrid(
                    sneakerList: _womenSneakerList, width: width, height: height),
                //Kids-sneaker-grid
                DisplaySneakerGrid(
                    sneakerList: _kidsSneakerList, width: width, height: height),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
