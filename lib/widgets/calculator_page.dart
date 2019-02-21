import 'package:calc_with_checklist/model/calculated_row_model.dart';
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
  var _expenseTitle = "Dummy Expense Title";
  var _models = <CalculatedRowModel>[];

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
                  expenseTitle: _expenseTitle,
                  currency: _currency,
                  expense: _expense,
                  editAmount: _editedAmount,
                  onButtonClicked: onButtonClicked,
                  onTitleEditClicked: onTitleEditClicked,
                  models: _models,
                  onRemoved: onCalculatedWidgetRemoved,
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

  void onTitleEditClicked() {
    showExpenseTitleEditDailog();
  }

  void showExpenseTitleEditDailog() {
    var controller =
        TextEditingController.fromValue(TextEditingValue(text: _expenseTitle));

    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Edit Expense Name',
                  textAlign: TextAlign.start,
                ),
                TextField(
                  autocorrect: true,
                  onChanged: (text) {},
                  controller: controller,
                )
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('OK'),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pop(true);
                setState(() {
                  _expenseTitle = controller.value.text;
                });
              },
            ),
          ],
        );
      },
    );
  }

  void onButtonClicked(String data) {
    if (data == '<') {
      setState(() {
        _editedAmount = _editedAmount.substring(0, _editedAmount.length - 1);
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
        if (_expense.endsWith(".00")) {
          _expense = _expense.substring(0, _expense.length - 3);
        }
        _models.add(
          CalculatedRowModel(_expense, DateTime.now().millisecondsSinceEpoch),
        );
        _editedAmount = "";
      });
      return;
    }
    setState(() {
      _editedAmount = _editedAmount + data;
    });
  }

  void onCalculatedWidgetRemoved(int index) {
    setState(() {
      _models = _models.where((item) {
        debugPrint("${item.id} and index: $index");
        return item.id != index;
      }).toList();
      debugPrint(_models.toString());
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
