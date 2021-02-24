import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutual_events/material/color.dart';
import 'package:mutual_events/widgets/customappbar.dart';
import 'package:mutual_events/widgets/showdialogue.dart';
import 'package:mutual_events/widgets/terms.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  var checkedValue = false.obs;
  static const routeSignUp = '/signUp';
  final formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _textController.text = '+91';
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: Column(
        children: [
          CustomAppBar(),
          Flexible(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25),
                      Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(height: 25),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) =>
                            formKey.currentState.save(),
                        validator: (val) =>
                            val.length > 0 ? null : 'Enter Firstname',
                        decoration: buildInputDecoration("First name"),
                      ),
                      SizedBox(height: 25),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) =>
                            formKey.currentState.save(),
                        validator: (val) =>
                            val.length > 0 ? null : 'Enter Surname',
                        decoration: buildInputDecoration("Surname"),
                      ),
                      SizedBox(height: 25),
                      TextFormField(
                        keyboardType: TextInputType.datetime,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) =>
                            formKey.currentState.save(),
                        validator: (val) =>
                            val.length > 0 ? null : 'Enter Date',
                        decoration: buildInputDecoration("DD / MM / YYYY"),
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: _textController,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (value) =>
                                  formKey.currentState.save(),
                              validator: (val) =>
                                  val.length > 0 ? null : 'code',
                              decoration: buildInputDecoration(""),
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            flex: 4,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (value) =>
                                  formKey.currentState.save(),
                              validator: (val) =>
                                  val.length > 0 ? null : 'Enter number',
                              decoration: buildInputDecoration("Phone number"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) =>
                            formKey.currentState.save(),
                        validator: (val) =>
                            val.length > 0 ? null : 'Enter email address',
                        decoration: buildInputDecoration("Email address"),
                      ),
                      SizedBox(height: 25),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) =>
                            formKey.currentState.save(),
                        validator: (val) =>
                            val.length > 0 ? null : 'Enter username',
                        decoration: buildInputDecoration("Username"),
                      ),
                      SizedBox(height: 25),
                      TextFormField(
                        obscureText: true,
                        onFieldSubmitted: (value) =>
                            formKey.currentState.save(),
                        validator: (val) =>
                            val.length > 0 ? null : 'Enter password',
                        decoration: buildInputDecoration("Password"),
                      ),
                      SizedBox(height: 25),
                      Obx(
                        () => CheckboxListTile(
                          contentPadding: EdgeInsets.only(right: 50),
                          title: Text(
                            "I Accept terms and condition",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          dense: true,

                          value: checkedValue.value,
                          onChanged: (newValue) {
                            checkedValue.value = newValue;
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ),
                      ),

                      SizedBox(height: 25),
                      Terms(), // terms of use and privacy policy
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: RaisedButton(
                                  color: theme,
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13.0),
                                  ),
                                  onPressed: () {
                                    formKey.currentState.validate();
                                    //form.currentState.save();
                                    popUp();
                                  }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  InputDecoration buildInputDecoration(String text) {
    return InputDecoration(
        labelText: text,
        filled: true,
        fillColor: Color(0xfff5f4fa),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        isDense: true);
  }
}
