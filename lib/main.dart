import '../Screens/HomeScreen.dart';
import '../Screens/ResultScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    // SystemUiOverlayStyle(statusBarColor: Colors.white));
    return MaterialApp(
      home: HomeScreen(),
      routes: {
        '/ResultScreen': (_) => Result(),
      },
      // home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff0A0E21),
        scaffoldBackgroundColor: Color(0xff0A0E21),
      ),
    );
  }
}
