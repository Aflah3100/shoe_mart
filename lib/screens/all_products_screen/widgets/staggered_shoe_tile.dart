import 'package:flutter/material.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';

class StaggeredShoeTile extends StatelessWidget {
  const StaggeredShoeTile({
    super.key,
    required this.width,
    required this.height,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  final double width;
  final double height;
  final String imageUrl;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.45,
      height: height * 0.28,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0), color: Colors.white),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Netwok-image
          SizedBox(
              width: width * 0.40,
              height: height * 0.15,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              )),

          //Shoe-title
          Flexible(
            child: Text(
              maxLines: 2,
              overflow: TextOverflow.clip,
              title,
              style: appTextStyle(
                  fontSize: 25.0,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),

          //Shoe-price
          Text(
            maxLines: 1,
            overflow: TextOverflow.clip,
            '\$ $price',
            style: appTextStyle(
                fontSize: 20.0,
                fontColor: Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
