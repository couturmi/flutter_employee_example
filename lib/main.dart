import 'package:example_proj/widgets/landing/landing_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Roster App',
      home: LandingScreen(),
    );
  }
}
