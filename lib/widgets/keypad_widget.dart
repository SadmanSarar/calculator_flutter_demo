import 'package:calc_with_checklist/widgets/calculator_button_widget.dart';
import 'package:calc_with_checklist/widgets/calculator_function_button_widget.dart';
import 'package:calc_with_checklist/widgets/extended_functional_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';

class KeyPadWidget extends StatelessWidget {
  final double width;
  final double widthPerCell;
  final OnItemClicked<String> onButtonClicked;
  KeyPadWidget(this.width, this.widthPerCell, this.onButtonClicked);

  final _staggeredTiles = <StaggeredTile>[
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 2),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(2, 1),
  ];

  final List<ButtonData> buttonDatas = [
    ButtonData("7"),
    ButtonData("8"),
    ButtonData("9"),
    ButtonData("/", type: ButtonDataType.CalculatorFunctionalButton),
    ButtonData("*", type: ButtonDataType.TransformedCalculatorFunctionalButton),
    ButtonData("4"),
    ButtonData("5"),
    ButtonData("6"),
    ButtonData("+", type: ButtonDataType.ExtendedFunctionalButton),
    ButtonData("-", type: ButtonDataType.CalculatorFunctionalButton),
    ButtonData("1"),
    ButtonData("2"),
    ButtonData("3"),
    ButtonData("%", type: ButtonDataType.CalculatorFunctionalButton),
    ButtonData("0"),
    ButtonData("."),
    ButtonData("Del"),
    ButtonData("=", type: ButtonDataType.ExtendedFunctionalButton),
  ];

  List<Widget> buildKeyPadItems(BuildContext context) {
    return buttonDatas.map((item) {
      switch (item.type) {
        case ButtonDataType.CalculatorFunctionalButton:
          return CalculatorFunctionalButton(
            item.text,
            width: widthPerCell,
            height: widthPerCell,
            clickListerer: onButtonClicked,
          );
          break;
        case ButtonDataType.TransformedCalculatorFunctionalButton:
          return Transform.rotate(
            angle: pi / 4,
            child: CalculatorFunctionalButton(
              item.text == '*' ? '+' : item.text,
              width: widthPerCell,
              height: widthPerCell,
              clickListerer: (text) {
                onButtonClicked(item.text == '+' ? '*' : item.text);
              },
            ),
          );

          break;
        case ButtonDataType.ExtendedFunctionalButton:
          return ExtendedFunctionalButton(
            item.text,
            textColor: Theme.of(context).primaryColor,
            backgroundColor: item.text == '='
                ? Color(0xFFD9F2B4)
                : Theme.of(context).accentColor,
            width: widthPerCell,
            height: widthPerCell,
            clickListerer: onButtonClicked,
          );
          break;
        default:
          return CalculatorButton(
            item.text,
            width: widthPerCell,
            height: widthPerCell,
            clickListerer: onButtonClicked,
          );
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var _children = buildKeyPadItems(context);
    return Container(
      margin: EdgeInsets.only(bottom: 44),
      height: width / 5 * 4 + 8,
      width: width,
      alignment: Alignment.center,
      child: StaggeredGridView.count(
        crossAxisCount: 5,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        scrollDirection: Axis.vertical,
        staggeredTiles: _staggeredTiles,
        children: _children,
      ),
    );
  }
}

class ButtonData {
  final String text;
  final ButtonDataType type;
  ButtonData(this.text, {this.type = ButtonDataType.CalculatorButton});
}

enum ButtonDataType {
  CalculatorButton,
  CalculatorFunctionalButton,
  TransformedCalculatorFunctionalButton,
  ExtendedFunctionalButton
}
