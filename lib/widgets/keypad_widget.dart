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

  List<Widget> buildKeyPadItems(BuildContext context) {
    return <Widget>[
      CalculatorButton(
        "7",
        width: widthPerCell,
        height: widthPerCell,
        clickListerer: onButtonClicked,
      ),
      CalculatorButton("8",
          width: widthPerCell,
          height: widthPerCell,
          clickListerer: onButtonClicked),
      CalculatorButton("9",
          width: widthPerCell,
          height: widthPerCell,
          clickListerer: onButtonClicked),
      CalculatorFunctionalButton(
        "/",
        width: widthPerCell,
        height: widthPerCell,
        clickListerer: onButtonClicked,
      ),
      Transform.rotate(
        angle: pi / 4,
        child: CalculatorFunctionalButton(
          "+",
          width: widthPerCell,
          height: widthPerCell,
          clickListerer: onButtonClicked,
        ),
      ),
      CalculatorButton("4",
          width: widthPerCell,
          height: widthPerCell,
          clickListerer: onButtonClicked),
      CalculatorButton("5",
          width: widthPerCell,
          height: widthPerCell,
          clickListerer: onButtonClicked),
      CalculatorButton("6",
          width: widthPerCell,
          height: widthPerCell,
          clickListerer: onButtonClicked),
      ExtendedFunctionalButton(
        "+",
        textColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).accentColor,
        width: widthPerCell,
        height: widthPerCell,
        clickListerer: onButtonClicked,
      ),
      CalculatorFunctionalButton(
        "-",
        width: widthPerCell,
        height: widthPerCell,
        clickListerer: onButtonClicked,
      ),
      CalculatorButton("1",
          width: widthPerCell,
          height: widthPerCell,
          clickListerer: onButtonClicked),
      CalculatorButton("2",
          width: widthPerCell,
          height: widthPerCell,
          clickListerer: onButtonClicked),
      CalculatorButton("3",
          width: widthPerCell,
          height: widthPerCell,
          clickListerer: onButtonClicked),
      CalculatorFunctionalButton("%",
          width: widthPerCell, height: widthPerCell),
      CalculatorButton("0",
          width: widthPerCell,
          height: widthPerCell,
          clickListerer: onButtonClicked),
      CalculatorButton(".",
          width: widthPerCell,
          height: widthPerCell,
          clickListerer: onButtonClicked),
      CalculatorButton("",
          width: widthPerCell,
          height: widthPerCell,
          isActive: false,
          clickListerer: onButtonClicked),
      ExtendedFunctionalButton(
        "=",
        textColor: Theme.of(context).primaryColor,
        backgroundColor: Color(0xFFD9F2B4),
        width: widthPerCell,
        height: widthPerCell,
        clickListerer: onButtonClicked,
      ),
    ];
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
