import 'package:flutter/material.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';

class UserInfoBar extends StatelessWidget {
  const UserInfoBar({
    super.key,
    required this.width,
    required this.height,
    required this.username,
    required this.userEmail,
  });

  final double width;
  final double height;
  final String username;
  final String userEmail;

  String _getAvatarDisplayText() {
    return username[0].toUpperCase() + username[1].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.only(left: width * 0.04, top: height * 0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text-Avatar
          CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.white,
            child: Text(
              _getAvatarDisplayText(),
              style: appTextStyle(
                  fontSize: 25.0,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: width * 0.04,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Username-text
              Text(
                maxLines: 1,
                username,
                style: appTextStyle(
                    fontSize: 30.0,
                    fontColor: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              //Useremail-text
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                userEmail,
                style: appTextStyle(
                    fontSize: 18.0,
                    fontColor: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
