import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double sizeHeight;
  const LogoWidget({
    Key key,
    this.sizeHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Container(
        child: Image.asset('images/logo.png'),
        height: sizeHeight,
      ),
    );
  }
}
