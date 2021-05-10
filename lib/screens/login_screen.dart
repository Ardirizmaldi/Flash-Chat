import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/utils/form_validation.dart';
import 'package:flash_chat/screens/widgets/logo_widget.dart';
import 'package:flash_chat/screens/widgets/button_widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
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
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (val) => _email = val,
                decoration: kInputDecorationTextfield.copyWith(
                  hintText: 'Enter your email',
                ),
                validator: (val) => FormValidation.validateEmail(val),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (val) => _password = val,
                decoration: kInputDecorationTextfield.copyWith(
                  hintText: 'Enter your password.',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              ButtonWidget(
                color: Colors.lightBlueAccent,
                onNavigate: () => FormValidation.validateLoginForm(
                  form: _formKey.currentState,
                  email: _email,
                  passsword: _password,
                  context: context,
                ),
                title: 'Log In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
