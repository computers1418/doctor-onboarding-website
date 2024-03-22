import 'package:flutter/material.dart';

class RightTrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  RightTrianglePainter({this.strokeColor = Colors.black, this.strokeWidth = 3, this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    final Path path = Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
    return path;
  }

  @override
  bool shouldRepaint(RightTrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}