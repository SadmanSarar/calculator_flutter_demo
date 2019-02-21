import 'package:calc_with_checklist/model/calculated_row_model.dart';
import 'package:calc_with_checklist/widgets/bracket_button_widget.dart';
import 'package:calc_with_checklist/widgets/calculated_row_widget.dart';
import 'package:calc_with_checklist/widgets/calculator_button_widget.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class TopSectionWidget extends StatelessWidget {
  final String expenseTitle;
  final String currency;
  final String expense;
  final String editAmount;
  final OnItemClicked<String> onButtonClicked;
  final Function onTitleEditClicked;
  final IndexedCallback onRemoved;

  final List<CalculatedRowModel> models;

  TopSectionWidget({
    this.expenseTitle,
    this.currency,
    this.expense,
    this.editAmount,
    this.onButtonClicked,
    this.onTitleEditClicked,
    this.models,
    this.onRemoved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        buildExpenseHeading(expenseTitle, onTitleEditClicked),
        buildExpenseAmountWidget(currency, expense),
        Container(
          width: (25 * expense.length).toDouble(),
          height: 2,
          margin: EdgeInsets.only(right: 2),
          color: Theme.of(context).accentColor,
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constrains) {
              debugPrint(
                  "${constrains.maxHeight}     -     ${constrains.maxWidth}");
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: buildCalculatedRowList(),
              );
            },
          ),
        ),
        buildBracketWidgets(context),
      ],
    );
  }

  List<Widget> buildCalculatedRowList() {
    debugPrint(models.toString());

    List<Widget> widgets = <Widget>[];
    models.sort((a, b) {
      return a.id.compareTo(b.id);
    });
    var items = models
        .getRange(
            (models.length - 3) < 0 ? 0 : models.length - 3, models.length)
        .map((item) {
      debugPrint(item.toString());
      return CalculatedRowWidget(
        item.amount,
        item.id,
        onRemoved: onRemoved,
      );
    }).toList();
    widgets.addAll(items);
    debugPrint("Total widget built: ${items.length}");
    var text = buildCalculatorEditTextWidget(
      editAmount,
    );
    widgets.add(text);
    return widgets;
  }

  Padding buildCalculatorEditTextWidget(String text) {
    return Padding(
        padding: EdgeInsets.only(top: 4, bottom: 4),
        child: Text(
          text.isEmpty ? "[+-*/%]" : text,
          style: TextStyle(
            color: text.isEmpty ? Colors.white.withAlpha(30) : Colors.white,
            fontSize: 28,
          ),
          textAlign: TextAlign.end,
        ));
  }

  Widget buildExpenseHeading(String text, Function onTitleEditClicked) {
    return Padding(
      padding: EdgeInsets.only(top: 36, bottom: 4),
      child: InkWell(
        onTap: onTitleEditClicked,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 4, bottom: 4, left: 8.0, right: 0),
          child: Text(
            text,
            textAlign: TextAlign.end,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
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
          amount.isEmpty ? "0.0" : amount,
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
          child: BracketButton('(', onButtonClicked),
        ),
        SizedBox(
          height: 8.0,
          width: 8.0,
        ),
        Expanded(
          child: BracketButton(')', onButtonClicked),
        ),
      ],
    );
  }
}
