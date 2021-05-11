import 'package:flutter/material.dart';
import 'package:flash_chat/screens/routes_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteList.initial,
      routes: APPRoutes.getAll(),
    );
  }
}
