import 'package:calc_with_checklist/widgets/calculator_button_widget.dart';
import 'package:flutter/material.dart';

class BracketButton extends StatelessWidget {
  final String text;
  final OnItemClicked<String> onButtonClicked;
  BracketButton(this.text, this.onButtonClicked);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(4.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          onTap: () {
            if (onButtonClicked != null) {
              onButtonClicked(text);
            }
          },
          child: Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Color(0xFF5D656B),
                  width: 1.0,
                  style: BorderStyle.solid,
                )),
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
