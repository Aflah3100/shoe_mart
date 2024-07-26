import 'package:flutter/material.dart';
import 'package:shoe_mart/database/functions/cart_box/cart_db.dart';
import 'package:shoe_mart/database/models/sneaker_model/hive_sneaker_model.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';

class ScreenCart extends StatelessWidget {
  ScreenCart({super.key});

  final Future<List<HiveSneakerModel>> sneakerLists =
      CartDb.instance.fetchCartProducts();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      //Base-Container
      body: Container(
          width: width,
          height: height,
          child: FutureBuilder(
              future: sneakerLists,
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.separated(
                      itemBuilder: (ctx, index) {
                        final shoe=snapshot.data![index];
                        return ListTile(title: Text(shoe.name),subtitle: Text(shoe.category),);
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                      itemCount: snapshot.data!.length);
                }
              })),
    );
  }
}
