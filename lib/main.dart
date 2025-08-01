import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3MK Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "PlusJakartaSans",
      ),
      home: PortfolioHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
