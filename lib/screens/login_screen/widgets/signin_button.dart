import 'package:flutter/material.dart';
import 'package:shoe_mart/screens/login_screen/widgets/login_form.dart';
import 'package:shoe_mart/utils/themes/text_styles.dart';
import 'package:shoe_mart/utils/utils.dart';

class SigninSignUpButton extends StatefulWidget {
  const SigninSignUpButton({
    super.key,
    required this.loginType,
    required this.width,
    required this.signInFunction,
    required this.signUpFunction,
  });

  final Logintype loginType;
  final double width;
  final Future<void> Function(BuildContext context) signInFunction;
  final Future<void> Function(BuildContext context) signUpFunction;

  @override
  State<SigninSignUpButton> createState() => _SigninSignUpButtonState();
}

class _SigninSignUpButtonState extends State<SigninSignUpButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          isLoading = true;
        });
        if (widget.loginType == Logintype.sigin) {
          //Sign-In-User
          await widget.signInFunction(context);
        } else {
          //Sign-Up-User
          await widget.signUpFunction(context);
        }

        setState(() {
          isLoading = false;
        });
      },
      child: Container(
        width: widget.width,
        height: 65,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(12.0)),
        child: Center(
          child: (!isLoading)
              ? Text(
                  (widget.loginType == Logintype.sigin) ? 'Login' : 'SignUp',
                  style: appTextStyle(
                      fontSize: 20.0,
                      fontColor: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              : const CircularProgressIndicator(
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
