import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/presentation/screens/home.dart';
import 'package:flutter_bloc_app/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_app/presentation/screens/setting_screen.dart';
import 'package:flutter_bloc_app/presentation/screens/third_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(
                  title: 'Home Page',
                ));

      case '/second':
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(
                  title: 'Second Page',
                ));

      case '/third':
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(
                  title: 'Third Page',
                ));

      case '/settings':
        return MaterialPageRoute(
            builder: (_) => const SettingScreen(
                  title: 'Settings Page',
                ));

      default:
        return null;
    }
  }
}
