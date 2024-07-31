// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/providers/user_provider.dart';
import 'package:shoe_mart/screens/login_screen/widgets/login_form.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';
import 'package:shoe_mart/utils/utils.dart';

// ignore: must_be_immutable
class ScreenSignInSignUp extends StatelessWidget {
  ScreenSignInSignUp({super.key});

  //Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confimPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      backgroundColor: bgColor,
      body: SizedBox(
        width: width,
        height: height,
        //Base-Stack
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
            //Top-text
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shoe Mart',
                      style: appTextStyle(
                          fontSize: 35.0,
                          fontColor: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          FontAwesomeIcons.shoePrints,
                          color: Colors.white70,
                          size: 40.0,
                        ),
                        Text(
                          'Stylish Footwears',
                          style: appTextStyle(
                              fontSize: 35.0,
                              fontColor: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //Signin-Signup-heading
            Padding(
              padding: EdgeInsets.only(top: height * 0.225, left: width * 0.13),
              child: Selector<UserProvider, Logintype>(
                builder: (context, value, child) {
                  return Text(
                    (value == Logintype.sigin)
                        ? 'Sign in to your Account'
                        : 'Create A New Account',
                    style: appTextStyle(
                        fontSize: 28.0,
                        fontColor: Colors.white70,
                        fontWeight: FontWeight.w600),
                  );
                },
                selector: (ctx, userNotifier) => userNotifier.getLoginType(),
              ),
            ),

            //Error-text-Notifier
            Positioned(
              top: height * 0.35,
              child: SizedBox(
                width: width,
                height: height * 0.05,
                child: Center(
                    child: Selector<UserProvider, String>(
                  builder: (context, value, child) {
                    return Text(
                      value,
                      maxLines: 1,
                      style: appTextStyle(
                          fontSize: 24.0,
                          fontColor: Colors.redAccent,
                          fontWeight: FontWeight.w500),
                    );
                  },
                  selector: (ctx, userNotifier) =>
                      userNotifier.getErrorString(),
                )),
              ),
            ),

            //Login-form-Notifier
            Positioned(
                top: height * 0.40,
                child: Consumer<UserProvider>(
                  builder: (context, userNotifier, child) {
                    final loginType = userNotifier.getLoginType();
                    //Login-form-container
                    return SingleChildScrollView(
                      child: LoginForm(
                        width: width,
                        height: height,
                        loginType: loginType,
                        nameController: nameController,
                        emailController: emailController,
                        passwordController: passwordController,
                        confimPasswordController: confimPasswordController,
                        userNotifier: userNotifier,
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
