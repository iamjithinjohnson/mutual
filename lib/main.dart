import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutual_events/material/color.dart';
import 'package:mutual_events/screen/forgotPass.dart';
import 'package:mutual_events/screen/signIn.dart';
import 'package:mutual_events/widgets/showdialogue.dart';

import 'screen/signUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(name: SignIn.routeSignIn, page: () => SignIn()),
        GetPage(
            name: SignUp.routeSignUp,
            page: () => SignUp(),
            transition: Transition.leftToRight),
        GetPage(name: ForgetPass.routeForgotPass, page: () => ForgetPass()),
      ],
      home: SignIn(),
    );
  }
}
