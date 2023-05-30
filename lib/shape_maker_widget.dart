import 'package:flutter/material.dart';
import 'package:shape_maker/shape_maker.dart';

class ShapeMaker extends StatelessWidget {
  const ShapeMaker({
    required this.width,
    required this.height,
    super.key,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: ShapeMakerPainter(),
      ),
    );
  }
}
