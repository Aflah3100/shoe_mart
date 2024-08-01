import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_mart/firebase/firebase_auth/firebase_auth_functions.dart';
import 'package:shoe_mart/providers/user_provider.dart';
import 'package:shoe_mart/screens/login_screen/functions/login_functions.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';
import 'package:shoe_mart/utils/utils.dart';

class ScreenForgotPassword extends StatelessWidget {
  ScreenForgotPassword({super.key});

  //controllers
  final emailController = TextEditingController();

  get loginType => null;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    final userNotifer = context.read<UserProvider>();
    return Scaffold(
      backgroundColor: bgColor,
      body: SizedBox(
        width: width,
        height: height,
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

            //Top-text-container
            SizedBox(
              height: height * 0.25,
              width: width,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Reset Password',
                      style: appTextStyle(
                          fontSize: 30.0,
                          fontColor: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Enter Your Registered Email ',
                      style: appTextStyle(
                          fontSize: 25.0,
                          fontColor: Colors.white70,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
            //Display-text
            Positioned(
                top: height * 0.35,
                child: SizedBox(
                  width: width,
                  height: height * 0.10,
                  child: Center(
                      child: Selector<UserProvider, String>(
                    selector: (ctx, userProvider) =>
                        userProvider.getDisplayString(),
                    builder: (context, displayString, child) {
                      return Text(
                        displayString,
                        style: appTextStyle(
                            fontSize: 25.0,
                            fontColor: Colors.red,
                            fontWeight: FontWeight.w500),
                      );
                    },
                  )),
                )),
            //Text-field-container
            Positioned(
              top: height * 0.45,
              child: Container(
                width: width,
                height: height,
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                // color: Colors.red,
                child: Column(
                  children: [
                    //Email-Text-Field
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: 'Email',
                        hintStyle: appTextStyle(
                            fontSize: 15.0,
                            fontColor: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final emailCheck = LoginFunctions.instance
                            .validateEmail(emailController.text);
                        if (emailCheck is bool) {
                          userNotifer.setDisplayString(str: '');
                          // success
                          final authResult = await FirebaseAuthFunctions
                              .instance
                              .resetPasswordUsingEmail(
                                  email: emailController.text);
                          if (authResult is bool) {
                            userNotifer.setDisplayString(
                                str: 'Reset Link sent');
                          } else if (authResult is String) {
                            userNotifer.setDisplayString(str: authResult);
                          }
                        } else if (emailCheck is String) {
                          userNotifer.setDisplayString(str: emailCheck);
                        }
                      },
                      child: Container(
                        width: width * 0.90,
                        height: 65,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Center(
                          child: Text(
                            'Reset Password',
                            style: appTextStyle(
                                fontSize: 20.0,
                                fontColor: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
