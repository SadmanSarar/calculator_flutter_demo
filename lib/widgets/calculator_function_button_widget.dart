import 'package:calc_with_checklist/widgets/calculator_button_widget.dart';
import 'package:flutter/material.dart';

class CalculatorFunctionalButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final OnItemClicked<String> clickListerer;

  CalculatorFunctionalButton(
    this.text, {
    this.height = 50,
    this.width = 50,
    this.clickListerer,
  });
  @override
  Widget build(BuildContext context) {
    return CalculatorButton(
      text,
      textColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).primaryColor.withAlpha(40),
      height: height,
      width: width,
      clickListerer: clickListerer,
    );
  }
}
