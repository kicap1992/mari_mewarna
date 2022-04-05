// ignore_for_file: file_names

import 'dart:ui';

import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  // List<Offset?> points;
  List<DrawingArea?> points;
  // final ui.Image image;

  // MyCustomPainter({required this.points, required this.image});
  MyCustomPainter({required this.points});
  // MyCustomPainter(this.image, this.points);
  // MyCustomPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    // Paint background = Paint()..color = Colors.white;
    // Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    // canvas.drawRect(rect, background);
    // final paintnya = Paint();
    // canvas.drawImage(image, Offset.zero, paintnya);

    // print(points);
    // Paint paint = Paint();
    // paint.color = const Color.fromRGBO(0, 255, 255, 0.08);
    // paint.strokeWidth = 5.0;
    // paint.isAntiAlias = true;
    // paint.strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        Paint paint = points[i]!.areaPaint!;

        canvas.drawLine(points[i]!.point!, points[i + 1]!.point!, paint);
      } else if (points[i] != null && points[i + 1] == null) {
        Paint paint = points[i]!.areaPaint!;
        canvas.drawPoints(PointMode.points, [points[i]!.point!], paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class DrawingArea {
  Offset? point;
  Paint? areaPaint;

  DrawingArea({this.point, this.areaPaint});
}
