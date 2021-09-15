import 'package:flutter/material.dart';
import 'package:orange_valley/pages/home_page.dart';

void main() {
  runApp(OrangeValleyApp());
}

class OrangeValleyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.orange,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
