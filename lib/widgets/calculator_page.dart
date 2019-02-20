import 'package:flutter/material.dart';
import 'package:calc_with_checklist/painter/bar_view_painter.dart';
import 'package:calc_with_checklist/widgets/bracket_button_widget.dart';
import 'package:calc_with_checklist/widgets/calculated_row_widget.dart';
import 'package:calc_with_checklist/widgets/keypad_widget.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() {
    return _CalculatorPageState();
  }
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 48;

    var widthPerCell = width / 5;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.only(bottom: width, left: 24, right: 24),
                child: buildTopTextWidgets(context),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: buildBottomLineBar(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: KeyPadWidget(width, widthPerCell),
            ),
          ],
        ),
      ),
    );
  }

  Column buildTopTextWidgets(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        buildExpenseHeading("MY TRIP TO SPAIN"),
        buildExpenseAmountWidget("US\$", "540K"),
        Container(
          width: 20,
          height: 2,
          margin: EdgeInsets.only(right: 2),
          color: Theme.of(context).accentColor,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CalculatedRowWidget("10"),
              CalculatedRowWidget("210"),
              CalculatedRowWidget("525"),
            ],
          ),
        ),
        buildBracketWidgets(context),
      ],
    );
  }

  Widget buildExpenseAmountWidget(String currency, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          currency,
          textAlign: TextAlign.end,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 8,
          width: 8,
        ),
        Text(
          amount,
          textAlign: TextAlign.end,
          style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
      ],
    );
  }

  Widget buildExpenseHeading(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 40, bottom: 8),
      child: Text(
        text,
        textAlign: TextAlign.end,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }

  Widget buildBracketWidgets(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: BracketButton('['),
        ),
        Expanded(
          child: BracketButton(']'),
        ),
      ],
    );
  }

  Widget buildBottomLineBar() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 24),
      child: CustomPaint(
        size: Size(110, 4),
        painter: BarViewPainer(),
      ),
    );
  }
}
