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
      CalculatorButton("7"),
      CalculatorButton("8"),
      CalculatorButton("9"),
      CalculatorFunctionalButton("/"),
      Transform.rotate(
        angle: pi / 4,
        child: CalculatorFunctionalButton("+"),
      ),
      CalculatorButton("4"),
      CalculatorButton("5"),
      CalculatorButton("6"),
      ExtendedFunctionalButton(
        "+",
        textColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).accentColor,
      ),
      CalculatorFunctionalButton("-"),
      CalculatorButton("1"),
      CalculatorButton("2"),
      CalculatorButton("3"),
      CalculatorFunctionalButton("%"),
      CalculatorButton("0"),
      CalculatorButton("."),
      CalculatorButton(""),
      ExtendedFunctionalButton(
        "=",
        textColor: Theme.of(context).primaryColor,
        backgroundColor: Color(0xFFD9F2B4),
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 24),
                child: CustomPaint(
                  size: Size(110, 4),
                  painter: BarViewPainer(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 44),
                height: 230,
                width: 270,
                alignment: Alignment.center,
                child: StaggeredGridView.count(
                  crossAxisCount: 5,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  scrollDirection: Axis.vertical,
                  staggeredTiles: _staggeredTiles,
                  children: _children,
                ),
              ),
            ),
          ],
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
  CalculatorButton(
    this.text, {
    this.textColor = Colors.white,
    this.backgroundColor = const Color(0xFF474C50),
    this.highlightColor = const Color(0x66BCBCBC),
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      type: MaterialType.circle,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(25),
        highlightColor: highlightColor,
        child: Container(
          height: 50,
          width: 50,
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
  CalculatorFunctionalButton(this.text);
  @override
  Widget build(BuildContext context) {
    return CalculatorButton(
      text,
      textColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).primaryColor.withAlpha(40),
    );
  }
}

class ExtendedFunctionalButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color highlightColor;
  ExtendedFunctionalButton(
    this.text, {
    this.textColor = Colors.white,
    this.backgroundColor = const Color(0xFF474C50),
    this.highlightColor = const Color(0x66BCBCBC),
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(25)),
      color: backgroundColor,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.all(Radius.circular(25)),
        highlightColor: highlightColor,
        child: Container(
          height: 50,
          width: 50,
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
