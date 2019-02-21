import 'package:flutter/material.dart';

typedef OnItemClicked<T> = void Function(T data);

class CalculatorButton extends StatelessWidget {
  final OnItemClicked<String> clickListerer;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color highlightColor;
  final double height;
  final double width;
  final bool isActive;
  CalculatorButton(this.text,
      {this.textColor = Colors.white,
      this.backgroundColor = const Color(0xFF474C50),
      this.highlightColor = const Color(0x66BCBCBC),
      this.height = 50,
      this.width = 50,
      this.clickListerer,
      this.isActive = true,
      });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      type: MaterialType.circle,
      child: InkWell(
        onTap: isActive ? () {
          if (clickListerer != null) {
            clickListerer(text);
          }
        } : null,
        borderRadius: BorderRadius.circular(width / 2),
        highlightColor: highlightColor,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
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
