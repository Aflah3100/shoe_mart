import 'package:flutter/material.dart';
import '../../../utils/themes/text_styles.dart';

class ShoeDisplayCard extends StatelessWidget {
  const ShoeDisplayCard({
    super.key,
    required this.height,
    required this.width,
    required this.imageUrl,
    required this.shoeName,
    required this.shoeDescription,
    required this.price,
  });

  final double height;
  final double width;
  final String imageUrl;
  final String shoeName;
  final String shoeDescription;
  final String price;

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Like-Button
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_outline)),

            //Shoe-Image-Container
            Container(
              width: width * 0.55,
              height: height * .15,
              color: Colors.transparent,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            //Shoe-Text
            Text(
              shoeName,
              style: appTextStyle(
                  fontSize: 25,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.005,
            ),
            //Shoe-Description-Text
            Text(
              shoeDescription,
              style: appTextStyle(
                  fontSize: 20,
                  fontColor: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            //Shoe-Price
            Text(
              '\$ $price',
              style: appTextStyle(
                  fontSize: 22,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.007,
            ),
            // //Show-Colors
            // SizedBox(
            //   width: width * 0.55,
            //   height: height * 0.03,
            //   child: Row(
            //     children: [
            //       Text(
            //         'Colors',
            //         style: appTextStyle(
            //             fontSize: 18.0,
            //             fontColor: Colors.grey,
            //             fontWeight: FontWeight.w600),
            //       ),
            //       SizedBox(
            //         width: width * 0.02,
            //       ),
            //       Expanded(
            //         child: ListView(
            //             scrollDirection: Axis.horizontal,
            //             children: colors.map((color) {
            //               return Row(
            //                 children: [
            //                   CircleAvatar(
            //                     backgroundColor: color,
            //                     minRadius: 10,
            //                     maxRadius: 14,
            //                   ),
            //                   SizedBox(
            //                     width: width * 0.02,
            //                   )
            //                 ],
            //               );
            //             }).toList()),
            //       )
            //     ],
            //   ),
            // )
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
    required this.imageUrl,
  });

  final double width;
  final double height;
  final String imageUrl;

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
        child: Center(child: Image.network(imageUrl)));
  }
}
