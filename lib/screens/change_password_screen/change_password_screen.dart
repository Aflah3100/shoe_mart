import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoe_mart/firebase/firebase_auth/firebase_auth_functions.dart';
import 'package:shoe_mart/screens/profile_screen/profile_screen.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';
import 'package:shoe_mart/utils/utils.dart';

class ScreenChangePassword extends StatelessWidget {
  ScreenChangePassword({super.key});

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  void _showToast(String errorMessage) {
    Fluttertoast.showToast(
        msg: errorMessage,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
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
                      'Change Password',
                      style: appTextStyle(
                          fontSize: 30.0,
                          fontColor: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Enter Your New Password ',
                      style: appTextStyle(
                          fontSize: 25.0,
                          fontColor: Colors.white70,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: height * 0.45,
              child: Container(
                width: width,
                height: height,
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                // color: Colors.red,
                child: Column(
                  children: [
                    //CurrentPassword-Text-Field
                    TextFormField(
                      controller: currentPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: 'Current Password',
                        hintStyle: appTextStyle(
                            fontSize: 15.0,
                            fontColor: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    //NewPassword-Text-Field
                    TextFormField(
                      controller: newPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: 'New Password',
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
                        final currentPassword = currentPasswordController.text;
                        final newPassword = newPasswordController.text;
                        if (currentPassword.isEmpty) {
                          _showToast('Enter current Password');
                        } else if (newPassword.isEmpty) {
                          _showToast('Enter new Password');
                        } else {
                          final authResult1 = await FirebaseAuthFunctions
                              .instance
                              .reauthenticateUser(
                                  currentPassword: currentPassword);
                          if (authResult1 is bool) {
                            //Reauthentication-Success
                            final authResult2 = await FirebaseAuthFunctions
                                .instance
                                .changePassword(newPassword: newPassword);
                            if (authResult2 is bool) {
                              _showToast('Password Changed Succesfully');
                              // ignore: use_build_context_synchronously
                              ScreenProfile.signOutUser(context);
                            }
                          }
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
                            'Change Password',
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
