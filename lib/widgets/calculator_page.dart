import 'package:calc_with_checklist/widgets/top_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:calc_with_checklist/painter/bar_view_painter.dart';
import 'package:calc_with_checklist/widgets/bracket_button_widget.dart';
import 'package:calc_with_checklist/widgets/calculated_row_widget.dart';
import 'package:calc_with_checklist/widgets/keypad_widget.dart';

class CalculatorPage extends StatelessWidget {
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
                child: TopSectionWidget(),
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
