import 'package:flutter/material.dart';

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
