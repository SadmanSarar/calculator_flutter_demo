import 'package:flutter/material.dart';

typedef IndexedCallback = void Function(int index);

class CalculatedRowWidget extends StatefulWidget {
  final String text;
  final int index;
  final IndexedCallback onRemoved;
  CalculatedRowWidget(this.text, this.index, {this.onRemoved});

  @override
  State<StatefulWidget> createState() {
    return _CalculatedRowWidgetState(text, index, onRemoved: onRemoved);
  }
}

class _CalculatedRowWidgetState extends State<CalculatedRowWidget>
    with TickerProviderStateMixin {
  final int index;
  final IndexedCallback onRemoved;
  final String text;
  _CalculatedRowWidgetState(this.text, this.index, {this.onRemoved});

  Animation<double> _animation;
  AnimationController _opacityController;
  @override
  void initState() {
    super.initState();
    _opacityController = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 1,
    );
    _animation = CurvedAnimation(
      parent: _opacityController,
      curve: Curves.easeInOut,
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (onRemoved != null) {
            onRemoved(this.index);
          }
        }
      })
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _opacityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, widget) {
        return Transform.translate(
          offset: Offset(_animation.value * width, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 32,
                width: 32,
                child: IconButton(
                  tooltip: "Delete",
                  icon: Icon(Icons.close),
                  color: Color(0xFFB8B8B8),
                  onPressed: () {
                    _opacityController.forward();
                  },
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
          ),
        );
      },
    );
  }
}
