
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shoe_mart/models/sneaker_model.dart';
import 'package:shoe_mart/screens/all_products_screen/widgets/staggered_shoe_tile.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';

class DisplaySneakerGrid extends StatelessWidget {
  const DisplaySneakerGrid({
    super.key,
    required Future<List<SneakerModel>> sneakerList,
    required this.width,
    required this.height,
  }) : _sneakerList = sneakerList;

  final Future<List<SneakerModel>> _sneakerList;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FutureBuilder(
          future: _sneakerList,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 16,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (ctx, index) {
                    final currentShoe = snapshot.data![index];
                    return StaggeredShoeTile(
                        width: width,
                        height: height,
                        imageUrl: currentShoe.imageUrl[0],
                        title: currentShoe.title!,
                        price: currentShoe.price!);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.extent(
                      1,
                      (index % 4 == 1 || index % 4 == 3)
                          ? height * 0.35
                          : height * 0.3));
            } else {
              return Center(
                  child: Text('OOPS , No Shoes Found!',
                      style: appTextStyle(
                          fontSize: 25.0,
                          fontColor: Colors.white,
                          fontWeight: FontWeight.bold)));
            }
          }),
    );
  }
}
