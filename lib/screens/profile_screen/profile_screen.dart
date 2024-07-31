import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/providers/screen_provider.dart';
import 'package:shoe_mart/screens/login_screen/signin_signup_screen.dart';
import 'package:shoe_mart/screens/profile_screen/widgets/bottom_text.dart';
import 'package:shoe_mart/screens/profile_screen/widgets/profile_screen_button.dart';
import 'package:shoe_mart/screens/profile_screen/widgets/user_info.dart';
import 'package:shoe_mart/services/shared_prefs/shared_prefs.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';
import 'package:shoe_mart/utils/utils.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  void _signOutUser(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    context.read<ScreensProvider>().setScreenIndex(0);
    SharedPrefs.instance.deleteUserModel();
    Navigator.pushAndRemoveUntil(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => ScreenSignInSignUp()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: bgColor,

      //Base-Container
      body: SizedBox(
          width: width,
          height: height,
          //Base-stack
          child: Stack(
            children: [
              //Black-background-container
              Container(
                width: width,
                height: height * 0.25,
                color: Colors.black,
              ),
              //Top-Image-Container
              Container(
                width: width,
                height: height * 0.35,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(topImage), fit: BoxFit.fill)),
              ),
              //Top-user-info-container
              SizedBox(
                height: height * 0.25,
                width: width,
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //User-info-widget
                      FutureBuilder(
                          future: SharedPrefs.instance.getUserModel(),
                          builder: (ctx, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator(
                                color: Colors.white,
                              );
                            } else if (snapshot.hasData) {
                              return UserInfoBar(
                                  width: width,
                                  height: height,
                                  username: snapshot.data!.userName,
                                  userEmail: snapshot.data!.userEmail);
                            } else {
                              return UserInfoBar(
                                  width: width,
                                  height: height,
                                  username: 'User',
                                  userEmail: '');
                            }
                          }),
                      //Display-text
                      Text(
                        'Manage Your Account ',
                        style: appTextStyle(
                            fontSize: 25.0,
                            fontColor: Colors.white70,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ),
              //Profile-Items-Container
              Positioned(
                  top: height * 0.37,
                  child: Container(
                    width: width,
                    height: height,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                    child: Column(
                      children: [
                        //Order-history-button
                        ProfileScreenButton(
                          width: width,
                          text: 'Order History',
                          description: 'View order history and track order',
                          leadingIcon: Ionicons.cart_sharp,
                          trailingIcon: Ionicons.caret_forward,
                          onTap: () {},
                        ),
                        const Divider(),
                        ProfileScreenButton(
                            width: width,
                            text: 'Address Book',
                            description: 'Manage saved addresses',
                            leadingIcon: Ionicons.location_sharp,
                            trailingIcon: Ionicons.caret_forward,
                            onTap: () {}),
                        const Divider(),
                        ProfileScreenButton(
                            width: width,
                            text: 'Change Password',
                            description: 'Edit your password',
                            leadingIcon: Ionicons.lock_closed,
                            trailingIcon: Ionicons.caret_forward,
                            onTap: () {}),
                        const Divider(),
                        ProfileScreenButton(
                            width: width,
                            text: 'Log Out',
                            description: 'Log out the user',
                            leadingIcon: Ionicons.log_out_sharp,
                            trailingIcon: Ionicons.caret_forward,
                            onTap: () {
                              _signOutUser(context);
                            }),
                        const Divider(),

                        SizedBox(
                          height: height * 0.20,
                        ),
                      ],
                    ),
                  )),
              //Bottom-text
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: height * 0.01),
                    child: BottomText(width: width),
                  ))
            ],
          )),
    );
  }
}
