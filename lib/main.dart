import 'package:flutter/material.dart';
import 'package:xo/pages/game_page.dart';
import 'package:xo/pages/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Simulate a 5-second delay
    Future.delayed(const Duration(seconds: 7), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            if (isLoading) WelcomePage(),
            if (!isLoading) GamePage(),
          ],
        ),
      ),
    );
  }
}
