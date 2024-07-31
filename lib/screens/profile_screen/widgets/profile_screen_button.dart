import 'package:flutter/material.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';

class ProfileScreenButton extends StatelessWidget {
  const ProfileScreenButton({
    super.key,
    required this.width,
    required this.text,
    required this.description,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.onTap,
  });

  final double width;
  final String text;
  final String description;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Icon-Text-Row
            Row(
              children: [
                //Leading-icon
                Icon(
                  leadingIcon,
                  color: Colors.black,
                  size: 35.0,
                ),
                SizedBox(
                  width: width * 0.07,
                ),
                //Text-description-Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      maxLines: 1,
                      style: appTextStyle(
                          fontSize: 20.0,
                          fontColor: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      description,
                      maxLines: 1,
                      style: appTextStyle(
                          fontSize: 13.0,
                          fontColor: Colors.black87,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ],
            ),
            //Trailing-icon
            Icon(
              trailingIcon,
              size: 25.0,
            )
          ],
        ),
      ),
    );
  }
}