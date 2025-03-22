import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        '/welcome': (context) => WelcomeScreen(),
      },
    );
  }
}
