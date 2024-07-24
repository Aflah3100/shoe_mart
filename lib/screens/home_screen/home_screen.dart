import 'package:flutter/material.dart';
import 'package:shoe_mart/database/models/sneaker_model.dart';
import 'package:shoe_mart/screens/home_screen/widgets/display_sneaker.dart';
import 'package:shoe_mart/services/api_services.dart';
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

  //Sneaker Lists
  late final Future<List<SneakerModel>> _menSneakerList;
  late final Future<List<SneakerModel>> _womenSneakerList;
  late final Future<List<SneakerModel>> _kidsSneakerList;

  @override
  void initState() {
    _menSneakerList = ApiServices.instance.fetchMenSneakers();
    _womenSneakerList = ApiServices.instance.fetchWomenSneakers();
    _kidsSneakerList = ApiServices.instance.fetchkidsSneakers();
    super.initState();
  }

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
                          // Men's-shoe-Tab
                          DisplaySneaker(
                              width: width,
                              height: height,
                              sneakerList: _menSneakerList),
                          // Women's-shoe-Tab
                          DisplaySneaker(
                              width: width,
                              height: height,
                              sneakerList: _womenSneakerList),
                          // Kids-shoe-Tab
                          DisplaySneaker(
                              width: width,
                              height: height,
                              sneakerList: _kidsSneakerList)
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
