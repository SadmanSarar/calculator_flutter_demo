import 'package:calc_with_checklist/widgets/top_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:calc_with_checklist/painter/bar_view_painter.dart';
import 'package:calc_with_checklist/widgets/keypad_widget.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  var _editedAmount = "";
  var _expense = "";
  var _currency = "US\$";

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
                  currency: _currency,
                  expense: _expense,
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
    if(data == '<'){
      setState(() {
        _editedAmount =_editedAmount.substring(0,_editedAmount.length-1);
      });
      return;
     }
    //Todo: input validation
    if (_editedAmount.endsWith("+") ||
        _editedAmount.endsWith("-") ||
        _editedAmount.endsWith("*") ||
        _editedAmount.endsWith("/")) {
      if ((data == '+' || data == '-' || data == '*' || data == '/')) {
        return;
      }
    }

    if (data == '=') {
      Parser p = new Parser();
      Expression exp = p.parse(_editedAmount);
      ContextModel cm = new ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      debugPrint(eval.toString());
      setState(() {
        _expense = eval.toStringAsFixed(2);
        if(_expense.endsWith(".00")) {
          _expense = _expense.substring(0,_expense.length-3);
        }
        _editedAmount = "";
      });
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
