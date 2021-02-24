import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mutual_events/material/color.dart';
import 'package:mutual_events/screen/forgotPass.dart';
import 'package:mutual_events/screen/signUp.dart';
import 'package:mutual_events/widgets/showdialogue.dart';
import 'package:mutual_events/widgets/terms.dart';
import 'dart:async';

// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  var _obsecureText = true.obs;
  final form = GlobalKey<FormState>();
  static const routeSignIn = '/signIn';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // String validatePassword(String value) {
    //   if (value.isEmpty) {
    //     Get.defaultDialog(backgroundColor: Colors.grey);
    //   }
    // }

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: form,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/appIcon.png',
                    scale: 5,
                  ),
                  SizedBox(height: 10),
                  heading(width),
                  SizedBox(height: 45),
                  username(context),
                  SizedBox(height: 25),
                  password(),
                  SizedBox(height: 5),
                  forgotpassword(),
                  SizedBox(height: 30),
                  signinButton(),
                  SizedBox(height: 25),
                  Terms(), // terms of use and privacy policy
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an account?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 80),
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Sign up',
                            style: TextStyle(color: texttheme),
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(SignUp.routeSignUp);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding heading(double width) {
    return Padding(
      padding: EdgeInsets.only(right: width / 2.5),
      child: Text(
        'Welcome To Mutual Events',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
      ),
    );
  }

  Row signinButton() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: RaisedButton(
                color: theme,
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                ),
                onPressed: () {
                  form.currentState.validate();
                  form.currentState.save();
                  popUp();
                }),
          ),
        ),
      ],
    );
  }

  InkWell forgotpassword() {
    return InkWell(
      onTap: () => Get.toNamed(ForgetPass.routeForgotPass),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: texttheme),
        ),
      ),
    );
  }

  Obx password() {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
            color: Color(0xfff5f4fa),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            Flexible(
              child: TextFormField(
                  obscureText: _obsecureText.value,
                  onFieldSubmitted: (value) => form.currentState.save(),
                  validator: (val) => val.length > 0 ? null : 'Enter Password',
                  decoration: buildInputDecoration("password", Icons.lock)),
            ),
            IconButton(
                icon: _obsecureText.value
                    ? Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.grey,
                        size: 20,
                      )
                    : Icon(
                        Icons.no_encryption_outlined,
                        color: theme,
                        size: 20,
                      ),
                onPressed: () {
                  _obsecureText.value = !_obsecureText.value;
                })
          ],
        ),
      ),
    );
  }

  Container username(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xfff5f4fa),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (value) => form.currentState.save(),
              validator: (val) => val.length > 0 ? null : 'Enter Username',
              decoration: buildInputDecoration("username", Icons.person_pin),
            ),
          ),
          //Icon(Icons.not_listed_location_sharp),
          IconButton(
              icon: Icon(
                Icons.not_listed_location_sharp,
                color: Colors.grey,
                size: 20,
              ),
              onPressed: () {
                popUpInfo(context);
              })
        ],
      ),
    );
  }

  InputDecoration buildInputDecoration(String text, IconData prefix) {
    return InputDecoration(
        labelText: text,
        prefixIcon: Icon(prefix),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        isDense: true);
  }

  // popUpInfo() {
  //   return Get.defaultDialog(
  //       title: '',
  //       backgroundColor: Colors.white,
  //       radius: 10,
  //       //custom middle text
  //       content: Column(
  //         children: [
  //           Text(
  //             'Enter your Email address / Username / Phone number',
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //               color: Colors.black,
  //             ),
  //           )
  //         ],
  //       ));
  // }

  Future popUpInfo(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[800].withOpacity(0.9),
          title: Center(
            child: Text('Enter your Email address / \nUsername / Phone number',
                style: TextStyle(color: Colors.white, fontSize: 13)),
          ),
        );
      },
    );
  }
}
