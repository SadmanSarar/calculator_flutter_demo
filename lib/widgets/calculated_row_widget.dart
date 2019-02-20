import 'package:flutter/material.dart';

class CalculatedRowWidget extends StatelessWidget {

  final String text;
  CalculatedRowWidget(this.text);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 32,
          width: 32,
          child: IconButton(
            tooltip: "Delete",
            icon: Icon(Icons.close),
            color: Color(0xFFB8B8B8),
            onPressed: () {},
            iconSize: 20,
          ),
        ),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
