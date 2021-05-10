import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/routes_screen.dart';
import 'package:flash_chat/screens/widgets/button_widgets.dart';
import 'package:flash_chat/screens/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                LogoWidget(
                  sizeHeight: 60.0,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ButtonWidget(
              color: Colors.lightBlueAccent,
              onNavigate: () => Navigator.of(context).pushNamed(
                RouteList.loginScreen,
              ),
              title: 'Log In',
            ),
            ButtonWidget(
              color: Colors.blueAccent,
              onNavigate: () => Navigator.of(context).pushNamed(
                RouteList.registrationScreen,
              ),
              title: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
