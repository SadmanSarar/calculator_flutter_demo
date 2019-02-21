import 'package:calc_with_checklist/widgets/bracket_button_widget.dart';
import 'package:calc_with_checklist/widgets/calculated_row_widget.dart';
import 'package:flutter/material.dart';

class TopSectionWidget extends StatefulWidget {
  @override
  _TopSectionWidgetState createState() {
    return _TopSectionWidgetState();
  }
}

class _TopSectionWidgetState extends State<TopSectionWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        buildExpenseHeading("MY TRIP TO SPAIN"),
        buildExpenseAmountWidget("US\$", "540K"),
        Container(
          width: 120,
          height: 2,
          margin: EdgeInsets.only(right: 2),
          color: Theme.of(context).accentColor,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildCalculatedRowList(),
          ),
        ),
        buildBracketWidgets(context),
      ],
    );
  }

  var _models = <CalculatedRowModel>[
    CalculatedRowModel("100", 0),
    CalculatedRowModel("525", 2),
  ];

  List<Widget> buildCalculatedRowList() {
    List<Widget> widgets = <Widget>[];
    var items = _models.map((item) {
      return CalculatedRowWidget(
        item.amount,
        item.id,
        onRemoved: onCalculatedWidgetRemoved,
      );
    }).toList();
    widgets.addAll(items);
    var text = buildCalculatorEditTextWidget(
      "[ 23 + 4 ]",
    );
    widgets.add(text);
    return widgets;
  }

  Padding buildCalculatorEditTextWidget(String text) {
    return Padding(
        padding: EdgeInsets.only(top: 4, bottom: 4),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            // fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.end,
        ));
  }

  void onCalculatedWidgetRemoved(int index) {
    print(index);
    setState(() {
      _models = _models.where((item) {
        return item.id != index;
      }).toList();
    });
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

  Widget buildBracketWidgets(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: BracketButton('['),
        ),
        SizedBox(
          height: 8.0,
          width: 8.0,
        ),
        Expanded(
          child: BracketButton(']'),
        ),
      ],
    );
  }
}

class CalculatedRowModel {
  String amount;
  int id;
  CalculatedRowModel(this.amount, this.id);
}
