import 'package:flutter/rendering.dart';

/**
* Text to Path Maker
* Copyright Ashraff Hathibelagal 2019
*/

/// A [CustomPainter] subclass that can be used to quickly render a character
/// and animate it.
class PMPainter extends CustomPainter {
  late Path path;
  late Paint _paint;
  late double posX;
  late double posY;
  late double scaleX;
  late double scaleY;
  late Offset? indicatorPosition;
  late Paint? indicator;
  late double? radius;

  PMPainter(
    this.path, {
    this.indicatorPosition,
    this.radius,
    this.indicator,
  }) {
    init();
  }

  void init() {
    if (this.path == null) this.path = Path();
    _paint = Paint();
    _paint.strokeWidth = 3;
    _paint.color = const Color.fromRGBO(0, 0, 0, 1.0);
    _paint.style = PaintingStyle.stroke;

    radius = 5.0;
    indicator = Paint();
    indicator?.style = PaintingStyle.fill;
    indicator?.color = const Color.fromRGBO(255, 0, 0, 1.0);
  }

  void setPaint(Paint p) {
    _paint = p;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(path, _paint);

    if (this.indicatorPosition != null) {
      canvas.drawCircle(
        indicatorPosition ?? const Offset(0, 0),
        radius ?? 0,
        indicator ?? Paint(),
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
