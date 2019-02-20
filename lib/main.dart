import 'package:calc_with_checklist/widgets/calculator_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator with Checklist',
      theme: ThemeData(
        primaryColor: Color(0xFF474C50),
        accentColor: Color(0xFF83DADF),
        scaffoldBackgroundColor: Color(0xFF474C50),
        textTheme: TextTheme(
          headline: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          body1: TextStyle(
            color: Color(0xFFA7B4BE),
          ),
          display1: TextStyle(
            color: Color(0xFFA7B4BE),
          ),
        ),
      ),
      home: CalculatorPage(),
    );
  }
}
