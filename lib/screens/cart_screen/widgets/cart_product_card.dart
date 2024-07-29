
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.12,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
      child: Row(
        children: [
          //Sneaker-Image-Container
          SizedBox(
            width: width * 0.25,
            height: height * 0.12,
            child: Stack(
              children: [
                //sneaker-image
                SizedBox.expand(
                    child: Image.network(
                  'http://surl.li/lnqzxu',
                  fit: BoxFit.contain,
                )),
                //Delete-Icon
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: width * 0.10,
                    height: height * 0.03,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0)),
                    ),
                    child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Ionicons.trash_outline,
                              color: Colors.white,
                              size: 19.0,
                            ))),
                  ),
                ),
              ],
            ),
          ),

          //Snaker-Description-Container
          Container(
            width: width * 0.55,
            height: height * 0.12,
            padding: EdgeInsets.only(
                top: height * 0.01, bottom: height * 0.01, left: width * 0.035),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Sneaker-Title
                Text(
                  'Ultraboost Shoes',
                  style: appTextStyle(
                      fontSize: 20.0,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                //Sneaker-Description
                Text(
                  'Mens Running',
                  style: appTextStyle(
                      fontSize: 18.0,
                      fontColor: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    //Sneaker-Price
                    Text(
                      '\$ 79.00 ',
                      style: appTextStyle(
                          fontSize: 18.0,
                          fontColor: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    //Sneaker-Size
                    Text(
                      'Size:  7.5',
                      style: appTextStyle(
                          fontSize: 18.0,
                          fontColor: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),

          //Sneaker-Count-Container
          Container(
            height: height,
            width: width * 0.10,
            padding: EdgeInsets.symmetric(vertical: height * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //minus-button
                SneakerCountButton(
                  width: width,
                  height: height,
                  icon: const Icon(
                    Ionicons.remove,
                    color: Colors.white,
                    size: 20,
                  ),
                  onTap: () {},
                  color: Colors.grey,
                ),
                Text(
                  '0',
                  style: appTextStyle(
                      fontSize: 20.0,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                SneakerCountButton(
                  width: width,
                  height: height,
                  icon: const Icon(
                    Ionicons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                  onTap: () {},
                  color: Colors.black,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SneakerCountButton extends StatelessWidget {
  const SneakerCountButton({
    super.key,
    required this.width,
    required this.height,
    required this.icon,
    required this.onTap,
    required this.color,
  });

  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.05,
        height: height * 0.02,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(5.0)),
        child: Center(child: icon),
      ),
    );
  }
}
