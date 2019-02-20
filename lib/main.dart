import 'package:calc_with_checklist/painter/bar_view_painter.dart';
import 'package:calc_with_checklist/widgets/bracket_button_widget.dart';
import 'package:calc_with_checklist/widgets/calculated_row_widget.dart';
import 'package:calc_with_checklist/widgets/calculator_button_widget.dart';
import 'package:calc_with_checklist/widgets/calculator_function_button_widget.dart';
import 'package:calc_with_checklist/widgets/calculator_page.dart';
import 'package:calc_with_checklist/widgets/extended_functional_button_widget.dart';
import 'package:calc_with_checklist/widgets/keypad_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
