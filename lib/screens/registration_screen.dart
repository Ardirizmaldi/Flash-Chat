import 'package:flutter/material.dart';
import 'package:flash_chat/utils/form_validation.dart';
import 'package:flash_chat/screens/widgets/logo_widget.dart';
import 'package:flash_chat/screens/widgets/button_widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../constants.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: LogoWidget(
                    sizeHeight: 200.0,
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  validator: (val) => FormValidation.validateEmail(val),
                  decoration: kInputDecorationTextfield.copyWith(
                    hintText: 'Enter your email',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (val) => _email = val,
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  validator: (val) => FormValidation.validatePassword(val),
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: kInputDecorationTextfield.copyWith(
                    hintText: 'Enter your password',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (val) => _password = val,
                ),
                SizedBox(
                  height: 24.0,
                ),
                ButtonWidget(
                  color: Colors.blueAccent,
                  onNavigate: () {
                    setState(() {
                      isLoading = true;
                    });

                    FormValidation.validateRegistrationForm(
                      form: _formKey.currentState,
                      email: _email,
                      passsword: _password,
                      context: context,
                    );

                    Future.delayed(const Duration(milliseconds: 500), () {
                      setState(() {
                        isLoading = false;
                      });
                    });
                  },
                  title: 'Register',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
