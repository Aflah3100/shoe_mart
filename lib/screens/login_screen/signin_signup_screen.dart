import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';
import 'package:shoe_mart/utils/utils.dart';

class ScreenSignInSignUp extends StatelessWidget {
  ScreenSignInSignUp({super.key,required this.loginType});

  final Logintype loginType;

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
              child: Text(
                'Sign in to your Account',
                style: appTextStyle(
                    fontSize: 28.0,
                    fontColor: Colors.white70,
                    fontWeight: FontWeight.w600),
              ),
            ),

            //Login-form-container
            Positioned(
                top: height * 0.40,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  width: width,
                  height: height,
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
                        height: height * 0.03,
                      ),

                      //Password-Text-Field
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          hintText: 'Password',
                          hintStyle: appTextStyle(
                              fontSize: 15.0,
                              fontColor: Colors.black87,
                              fontWeight: FontWeight.w500),
                          suffixIcon: const Icon(
                            Ionicons.eye_off,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      //Forgot-password-button
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: appTextStyle(
                                    fontSize: 16.0,
                                    fontColor: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ))),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      //Login-button
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: width,
                          height: 65,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Center(
                            child: Text(
                              'Login',
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
                            'Don\'t have an account?',
                            style: appTextStyle(
                                fontSize: 15.0,
                                fontColor: Colors.black87,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text(
                            'Register',
                            style: appTextStyle(
                                fontSize: 16.0,
                                fontColor: Colors.black,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
