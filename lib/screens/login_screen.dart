import 'package:flutter/material.dart';
import 'package:flash_chat/screens/widgets/logo_widget.dart';
import 'package:flash_chat/screens/widgets/button_widgets.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            LogoWidget(
              sizeHeight: 200.0,
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kInputDecorationTextfield.copyWith(
                hintText: 'Enter your email',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kInputDecorationTextfield.copyWith(
                hintText: 'Enter your password.',
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            ButtonWidget(
              color: Colors.lightBlueAccent,
              onNavigate: () {},
              title: 'Log In',
            ),
          ],
        ),
      ),
    );
  }
}
