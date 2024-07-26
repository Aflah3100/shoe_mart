import 'package:flutter/material.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';

class SizeButton extends StatelessWidget {
  const SizeButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.labelColor,
    required this.backgroundColor,
  });
  final String label;
  final void Function() onTap;
  final Color labelColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        // backgroundColor: const Color.fromARGB(255, 189, 189, 189),
        backgroundColor: backgroundColor,
        child: Center(
          child: Text(
            label,
            style: appTextStyle(
                fontSize: 15,
                fontColor: labelColor,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
