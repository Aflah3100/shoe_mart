import 'package:flutter/material.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';
import 'package:shoe_mart/utils/utils.dart';

class ShoeDisplayCard extends StatelessWidget {
  const ShoeDisplayCard({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shadowColor: Colors.grey,
      child: Container(
        padding: EdgeInsets.all(height * 0.01),
        width: width * 0.55,
        height: height * 0.40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Like-Button
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_outline)),

            //Shoe-Image-Container
            Container(
              width: width * 0.55,
              height: height * .15,
              color: Colors.grey,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            //Shoe-Text
            Text(
              'Shoe Name',
              style: appTextStyle(
                  fontSize: 25,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            //Shoe-Description-Text
            Text(
              'Shoe Description',
              style: appTextStyle(
                  fontSize: 15,
                  fontColor: Colors.grey,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            //Shoe-Details-Row
            Row(
              children: [
                //Show-Price
                Text(
                  '\$ price',
                  style: appTextStyle(
                      fontSize: 20,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ShoeDisplayCardSmall extends StatelessWidget {
  const ShoeDisplayCardSmall({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width * 0.30,
        height: height * 0.15,
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 0.8,
                  offset: Offset(0, 1))
            ]),
        child: Center(child: Image.asset(backgroundShoeImage)));
  }
}
