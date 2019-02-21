import 'package:calc_with_checklist/widgets/top_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:calc_with_checklist/painter/bar_view_painter.dart';
import 'package:calc_with_checklist/widgets/keypad_widget.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  var _editedAmount = "";

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
                child: TopSectionWidget(
                  expenseTitle: "Dummy Expense Title",
                  currency: "US\$",
                  expense: "320K",
                  editAmount: _editedAmount,
                  onButtonClicked: onButtonClicked,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: buildBottomLineBar(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: KeyPadWidget(width, widthPerCell, onButtonClicked),
            ),
          ],
        ),
      ),
    );
  }

  void onButtonClicked(String data) {
    if (data == '=') {
      return;
    }
    setState(() {
      _editedAmount = _editedAmount + data;
    });
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
