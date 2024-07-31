// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shoe_mart/firebase/firebase_auth/firebase_auth_functions.dart';
import 'package:shoe_mart/models/user_model.dart';
import 'package:shoe_mart/providers/user_provider.dart';
import 'package:shoe_mart/screens/login_screen/functions/login_functions.dart';
import 'package:shoe_mart/screens/main_screen/main_screen.dart';
import 'package:shoe_mart/services/shared_prefs/shared_prefs.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';
import 'package:shoe_mart/utils/utils.dart';

class LoginForm extends StatelessWidget {
  const LoginForm(
      {super.key,
      required this.width,
      required this.height,
      required this.loginType,
      required this.nameController,
      required this.emailController,
      required this.passwordController,
      required this.confimPasswordController,
      required this.userNotifier});

  final double width;
  final double height;
  final Logintype loginType;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confimPasswordController;
  final UserProvider userNotifier;

  //functions

  void _signInUser(BuildContext context) async {
    final emailCheck =
        LoginFunctions.instance.validateEmail(emailController.text);
    final passwordCheck =
        LoginFunctions.instance.validatePassword(passwordController.text);

    if (emailCheck is bool && passwordCheck is bool) {
      userNotifier.setErrorString(error: '');
      //Success
      final authResult = await FirebaseAuthFunctions.instance
          .signInUserUsingEmail(
              email: emailController.text, password: passwordController.text);

      if (authResult is UserModel) {
        //Firebase-Authentication-Success
        final result =
            await SharedPrefs.instance.saveUserModel(user: authResult);
        if (result) {
          //Shared-Preferences-Save-Success
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (ctx) => const ScreenMain()));
        }
      } else if (authResult is String) {
        userNotifier.setErrorString(error: authResult);
      }
    } else if (emailCheck is String) {
      userNotifier.setErrorString(error: emailCheck);
    } else if (passwordCheck is String) {
      userNotifier.setErrorString(error: passwordCheck);
    }
  }

  void signUpUser(BuildContext context) async {
    final namecheck = LoginFunctions.instance.validateName(nameController.text);
    final emailCheck =
        LoginFunctions.instance.validateEmail(emailController.text);
    final passwordCheck =
        LoginFunctions.instance.validatePassword(passwordController.text);
    final confPasswordCheck = LoginFunctions.instance.checkEnteredPassword(
        passwordController.text, confimPasswordController.text);

    if (namecheck is bool &&
        emailCheck is bool &&
        passwordCheck is bool &&
        confPasswordCheck is bool) {
      //Success

      userNotifier.setErrorString(error: '');

      final authResult = await FirebaseAuthFunctions.instance
          .registerUserUsingEmail(
              name: nameController.text,
              email: emailController.text,
              password: passwordController.text);

      if (authResult is UserModel) {
        //Firebase-Authentication-Success
        final result =
            await SharedPrefs.instance.saveUserModel(user: authResult);
        if (result) {
          //Shared-Preferences-Save-Success
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (ctx) => const ScreenMain()));
        }
      }
    } else if (namecheck is String) {
      userNotifier.setErrorString(error: namecheck);
    } else if (emailCheck is String) {
      userNotifier.setErrorString(error: emailCheck);
    } else if (passwordCheck is String) {
      userNotifier.setErrorString(error: passwordCheck);
    } else if (confPasswordCheck is String) {
      userNotifier.setErrorString(error: confPasswordCheck);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: width,
      height: height,
      child: Column(
        children: [
          //Name-text-field
          (loginType == Logintype.signup)
              ? TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: 'Name',
                    hintStyle: appTextStyle(
                        fontSize: 15.0,
                        fontColor: Colors.black87,
                        fontWeight: FontWeight.w500),
                  ),
                )
              : const SizedBox(),
          (loginType == Logintype.signup)
              ? SizedBox(
                  height: height * 0.02,
                )
              : const SizedBox(),

          //Email-Text-Field
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              hintText: 'Email',
              hintStyle: appTextStyle(
                  fontSize: 15.0,
                  fontColor: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
          ),
          (loginType == Logintype.signup)
              ? SizedBox(
                  height: height * 0.02,
                )
              : SizedBox(
                  height: height * 0.03,
                ),

          //Password-Text-Field
          TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: (userNotifier.getShowPassword()) ? false : true,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                hintText: 'Password',
                hintStyle: appTextStyle(
                    fontSize: 15.0,
                    fontColor: Colors.black87,
                    fontWeight: FontWeight.w500),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (passwordController.text.isNotEmpty ||
                        userNotifier.getShowPassword()) {
                      userNotifier.setShowPassword(
                          val: !userNotifier.getShowPassword());
                    }
                  },
                  icon: Icon(
                    (!userNotifier.getShowPassword())
                        ? Ionicons.eye_off
                        : Ionicons.eye,
                    color: Colors.black,
                  ),
                )),
          ),
          (loginType == Logintype.signup)
              ? SizedBox(
                  height: height * 0.02,
                )
              : SizedBox(
                  height: height * 0.01,
                ),

          //Forgot-password-button
          (loginType == Logintype.sigin)
              ? Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: appTextStyle(
                            fontSize: 16.0,
                            fontColor: Colors.black,
                            fontWeight: FontWeight.w600),
                      )))
              : const SizedBox(),
          (loginType == Logintype.sigin)
              ? SizedBox(
                  height: height * 0.02,
                )
              : const SizedBox(),

          //Confirm-password-text-field
          (loginType == Logintype.signup)
              ? TextFormField(
                  controller: confimPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: 'Confirm Password',
                    hintStyle: appTextStyle(
                        fontSize: 15.0,
                        fontColor: Colors.black87,
                        fontWeight: FontWeight.w500),
                  ),
                )
              : const SizedBox(),
          (loginType == Logintype.signup)
              ? SizedBox(
                  height: height * 0.04,
                )
              : SizedBox(
                  height: height * 0.01,
                ),

          //Login-button
          GestureDetector(
            onTap: () async {
              if (loginType == Logintype.sigin) {
                //Sign-In-User
                _signInUser(context);
              } else {
                //Sign-Up-User
                signUpUser(context);
              }
            },
            child: Container(
              width: width,
              height: 65,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12.0)),
              child: Center(
                child: Text(
                  (loginType == Logintype.sigin) ? 'Login' : 'SignUp',
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

          //Bottom-text-row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (loginType == Logintype.sigin)
                    ? 'Don\'t have an account?'
                    : 'Already have an account?',
                style: appTextStyle(
                    fontSize: 15.0,
                    fontColor: Colors.black87,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: width * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  final type = userNotifier.getLoginType();
                  if (type == Logintype.sigin) {
                    userNotifier.setLoginType(Logintype.signup);
                  } else {
                    userNotifier.setLoginType(Logintype.sigin);
                  }
                },
                child: Text(
                  (loginType == Logintype.sigin) ? 'Register' : 'Login',
                  style: appTextStyle(
                      fontSize: 16.0,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
