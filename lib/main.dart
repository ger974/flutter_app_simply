import 'package:flutter/material.dart';
import 'welcome_page.dart';

// ignore: constant_identifier_names
const d_red = Color(0xFFE9717D);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoga App',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
