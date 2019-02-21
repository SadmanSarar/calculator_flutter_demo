import 'package:calc_with_checklist/widgets/calculator_button_widget.dart';
import 'package:flutter/material.dart';

class ExtendedFunctionalButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color highlightColor;
  final double height;
  final double width;
  final OnItemClicked<String> clickListerer;

  ExtendedFunctionalButton(this.text,
      {this.textColor = Colors.white,
      this.backgroundColor = const Color(0xFF474C50),
      this.highlightColor = const Color(0x66BCBCBC),
      this.height = 50,
      this.width = 50,
      this.clickListerer});
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(width / 2)),
      color: backgroundColor,
      child: InkWell(
        onTap: () {
          if (clickListerer != null) {
            clickListerer(text);
          }
        },
        borderRadius: BorderRadius.all(Radius.circular(width / 2)),
        highlightColor: highlightColor,
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
