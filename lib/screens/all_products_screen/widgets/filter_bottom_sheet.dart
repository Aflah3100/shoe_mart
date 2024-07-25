import 'package:flutter/material.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';
import 'package:shoe_mart/utils/utils.dart';

Future<dynamic> showFilterBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.black87,
      builder: (ctx) {
        final height = MediaQuery.of(context).size.height * 1;
        final width = MediaQuery.of(context).size.width * 1;
        //Base-container
        return Container(
          width: width,
          height: height * 0.70,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Filter-text
              Text(
                "Filter",
                style: appTextStyle(
                    fontSize: 30.0,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              //Gender-text
              Text(
                "Gender",
                style: appTextStyle(
                    fontSize: 20.0,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              //Button-Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ModalSheetButton(
                      label: "Men", onPress: () {}, btnColor: Colors.black),
                  ModalSheetButton(
                      label: "Women", onPress: () {}, btnColor: Colors.grey),
                  ModalSheetButton(
                      label: "Kids", onPress: () {}, btnColor: Colors.grey)
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              //Category-Text
              Text(
                "Category",
                style: appTextStyle(
                    fontSize: 20.0,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              //Category-Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ModalSheetButton(
                      label: "Shoes", onPress: () {}, btnColor: Colors.black),
                  ModalSheetButton(
                      label: "Apparels", onPress: () {}, btnColor: Colors.grey),
                  ModalSheetButton(
                      label: "Accessories",
                      onPress: () {},
                      btnColor: Colors.grey)
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              //Price-text
              Text(
                "Price",
                style: appTextStyle(
                    fontSize: 20.0,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              //Price-slider
              Slider(
                  thumbColor: Colors.black,
                  activeColor: Colors.grey,
                  inactiveColor: Colors.grey,
                  label: 'Price',
                  value: 0.0,
                  onChanged: (newValue) {}),
              SizedBox(
                height: height * 0.03,
              ),
              //Brand-text
              Text(
                "Brand",
                style: appTextStyle(
                    fontSize: 20.0,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              //Brand-button-row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ModalSheetBrandButton(image: adidasLogo, onPress: () {}),
                  ModalSheetBrandButton(image: gucciLogo, onPress: () {}),
                  ModalSheetBrandButton(image: jordanLogo, onPress: () {}),
                  ModalSheetBrandButton(image: nikeLogo, onPress: () {}),
                ],
              ),
            ],
          ),
        );
      });
}

class ModalSheetButton extends StatelessWidget {
  const ModalSheetButton({
    super.key,
    required this.label,
    required this.onPress,
    required this.btnColor,
  });

  final String label;
  final Color btnColor;

  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 110,
        height: 45,
        decoration: BoxDecoration(
            border: Border.all(
              color: btnColor,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Text(
            label,
            style: appTextStyle(
                fontSize: 15.0,
                fontColor: btnColor,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class ModalSheetBrandButton extends StatelessWidget {
  const ModalSheetBrandButton({
    super.key,
    required this.image,
    required this.onPress,
  });

  final String image;

  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 80,
        height: 50,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 206, 204, 204),
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
            child: Image.asset(
          image,
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}
