import 'package:flutter/material.dart';

typedef IndexedCallback = void Function(int index);

class CalculatedRowWidget extends StatefulWidget {
  final String text;
  final int index;
  final IndexedCallback onRemoved;
  CalculatedRowWidget(this.text, this.index, {this.onRemoved});

  @override
  State<StatefulWidget> createState() {
    return _CalculatedRowWidgetState();
  }
}

class _CalculatedRowWidgetState extends State<CalculatedRowWidget>
    with TickerProviderStateMixin {
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
      curve: Curves.easeIn,
    )
      ..addStatusListener((status) {
        debugPrint("animation status updated ${status.toString()}");
        if (status == AnimationStatus.completed && widget.onRemoved != null) {
          widget.onRemoved(widget.index);
          debugPrint("Remove animation completed");
          _opacityController.reset();
        }
      })
      ..addListener(() {
        // setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _opacityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, _widget) {
        return Transform.translate(
          offset: Offset(0, _animation.value * 40),
          child: Opacity(
            opacity: (1 - _animation.value),
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
                    widget.text,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
