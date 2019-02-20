import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator with Checklist',
      theme: ThemeData(
        primaryColor: Color(0xFF474C50),
        accentColor: Color(0xFF83DADF),
        scaffoldBackgroundColor: Color(0xFF474C50),
        textTheme: TextTheme(
          headline: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          body1: TextStyle(
            color: Color(0xFFA7B4BE),
          ),
          display1: TextStyle(
            color: Color(0xFFA7B4BE),
          ),
        ),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                padding: EdgeInsets.only(bottom: width, left: 16, right: 16),
                child: buildTopTextWidgets(context),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: buildBottomLineBar(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: buildKeyPadWidget(width, widthPerCell),
            ),
          ],
        ),
      ),
    );
  }

  Column buildTopTextWidgets(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: buildBracketWidget(context, '['),
                      ),
                      Expanded(
                        child: buildBracketWidget(context, ']'),
                      ),
                    ],
                  )
                ],
              );
  }

  Container buildKeyPadWidget(double width, double widthPerCell) {
    var _staggeredTiles = <StaggeredTile>[
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
    var _children = <Widget>[
      CalculatorButton("7", width: widthPerCell, height: widthPerCell),
      CalculatorButton("8", width: widthPerCell, height: widthPerCell),
      CalculatorButton("9", width: widthPerCell, height: widthPerCell),
      CalculatorFunctionalButton("/",
          width: widthPerCell, height: widthPerCell),
      Transform.rotate(
        angle: pi / 4,
        child: CalculatorFunctionalButton("+",
            width: widthPerCell, height: widthPerCell),
      ),
      CalculatorButton("4", width: widthPerCell, height: widthPerCell),
      CalculatorButton("5", width: widthPerCell, height: widthPerCell),
      CalculatorButton("6", width: widthPerCell, height: widthPerCell),
      ExtendedFunctionalButton(
        "+",
        textColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).accentColor,
        width: widthPerCell,
        height: widthPerCell,
      ),
      CalculatorFunctionalButton("-",
          width: widthPerCell, height: widthPerCell),
      CalculatorButton("1", width: widthPerCell, height: widthPerCell),
      CalculatorButton("2", width: widthPerCell, height: widthPerCell),
      CalculatorButton("3", width: widthPerCell, height: widthPerCell),
      CalculatorFunctionalButton("%",
          width: widthPerCell, height: widthPerCell),
      CalculatorButton("0", width: widthPerCell, height: widthPerCell),
      CalculatorButton(".", width: widthPerCell, height: widthPerCell),
      CalculatorButton("", width: widthPerCell, height: widthPerCell),
      ExtendedFunctionalButton("=",
          textColor: Theme.of(context).primaryColor,
          backgroundColor: Color(0xFFD9F2B4),
          width: widthPerCell,
          height: widthPerCell),
    ];
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

  Padding buildBottomLineBar() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 24),
      child: CustomPaint(
        size: Size(110, 4),
        painter: BarViewPainer(),
      ),
    );
  }

  Widget buildBracketWidget(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(4.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          onTap: () {},
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
  }
}

class BarViewPainer extends CustomPainter {
  final paintBrush = Paint()
    ..color = Color(0xFF636567)
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
        RRect.fromLTRBR(0.0, 0.0, size.width, size.height,
            Radius.circular(size.height / 2)),
        paintBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color highlightColor;
  final double height;
  final double width;
  CalculatorButton(
    this.text, {
    this.textColor = Colors.white,
    this.backgroundColor = const Color(0xFF474C50),
    this.highlightColor = const Color(0x66BCBCBC),
    this.height = 50,
    this.width = 50,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      type: MaterialType.circle,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(width / 2),
        highlightColor: highlightColor,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class CalculatorFunctionalButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  CalculatorFunctionalButton(
    this.text, {
    this.height = 50,
    this.width = 50,
  });
  @override
  Widget build(BuildContext context) {
    return CalculatorButton(
      text,
      textColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).primaryColor.withAlpha(40),
      height: height,
      width: width,
    );
  }
}

class ExtendedFunctionalButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color highlightColor;
  final double height;
  final double width;
  ExtendedFunctionalButton(
    this.text, {
    this.textColor = Colors.white,
    this.backgroundColor = const Color(0xFF474C50),
    this.highlightColor = const Color(0x66BCBCBC),
    this.height = 50,
    this.width = 50,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(width / 2)),
      color: backgroundColor,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.all(Radius.circular(width / 2)),
        highlightColor: highlightColor,
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
