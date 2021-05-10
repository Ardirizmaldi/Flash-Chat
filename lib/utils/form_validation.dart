import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/routes_screen.dart';
import 'package:flutter/material.dart';

class FormValidation {
  static Future validateRegistrationForm({
    FormState form,
    String email,
    String passsword,
    BuildContext context,
  }) async {
    if (form.validate()) {
      try {
        final newUser =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: passsword,
        );
        if (newUser != null) {
          Navigator.pushReplacementNamed(context, RouteList.chatScreen);
        }
      } catch (e) {
        print(e);
      }
    } else {
      print('Form Invalidate');
    }
  }

  static Future validateLoginForm({
    FormState form,
    String email,
    String passsword,
    BuildContext context,
  }) async {
    if (form.validate()) {
      try {
        final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: passsword,
        );
        if (user != null) {
          Navigator.pushReplacementNamed(context, RouteList.chatScreen);
        }
      } catch (e) {
        print(e);
      }
    } else {
      print('Form Invalidate');
    }
  }

  static String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value.isEmpty)
      return 'Enter Valid Email';
    else
      return null;
  }

  static String validatePassword(String value) {
    if (value.length < 6 || value.isEmpty)
      return 'Password Minimum 6 Character';
    else
      return null;
  }
}
