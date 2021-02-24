import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutual_events/material/color.dart';
import 'package:mutual_events/widgets/showdialogue.dart';

class ForgetPass extends StatelessWidget {
  static const routeForgotPass = '/forgotpass';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: background,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            boxdecoration(),
            SizedBox(height: 25),
            registerIdtext(),
            SizedBox(height: 20),
            registeridDesc(width),
            SizedBox(height: 35),
            TextField(
              onSubmitted: (data) {
                popUp();
              },
              autofocus: true,
              decoration: buildInputDecoration('Registed ID'),
            ),
            SizedBox(height: 25),
            resetpassword(),
            // SizedBox(height: 25),
          ],
        ),
      )),
    );
  }

  Padding registeridDesc(double width) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 6.9),
      child: Text(
        'we will send a link to your registered email ID to reset your password.',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),
      ),
    );
  }

  Text registerIdtext() {
    return Text(
      'Enter your registered ID',
      style: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
    );
  }

  Container boxdecoration() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.deepOrange.withOpacity(0.3)),
      child: Icon(
        Icons.email_outlined,
        color: theme,
      ),
    );
  }

  Row resetpassword() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: RaisedButton(
                color: theme,
                child: Text(
                  'Reset Password',
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                ),
                onPressed: () {
                  //form.currentState.validate();
                  //form.currentState.save();
                  popUp();
                }),
          ),
        ),
      ],
    );
  }

  InputDecoration buildInputDecoration(String text) {
    return InputDecoration(
        prefixIcon: Icon(Icons.person_pin_sharp),
        labelText: text,
        //filled: true,
        //fillColor: Color(0xfff5f4fa),
        border: OutlineInputBorder(
          //borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        isDense: true);
  }
}
