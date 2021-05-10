import 'package:flutter/material.dart';

import 'chat_screen.dart';
import 'login_screen.dart';
import 'welcome_screen.dart';
import 'registration_screen.dart';

abstract class RouteList {
  static const String initial = '/';
  static const String chatScreen = '/chat';
  static const String loginScreen = '/login';
  static const String registrationScreen = '/registration';
}

class APPRoutes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.initial: (context) => WelcomeScreen(),
      RouteList.chatScreen: (context) => ChatScreen(),
      RouteList.loginScreen: (context) => LoginScreen(),
      RouteList.registrationScreen: (context) => RegistrationScreen(),
    };
  }
}
