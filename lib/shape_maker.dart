import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ShapeMakerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    // Paint Ans Colors

    final linesPaint = Paint()..color = Colors.black38;
    final middleLinePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2;

    const textColor = Colors.red;
    const middleTextColor = Colors.black;

    // Drawing Lines method

    void drawLinesValues(
        {required double textValue,
        required Offset textOffset,
        required Color textColor,
        required double paragraphConstraint}) {
      final paragraphBuilder = ui.ParagraphBuilder(ui.ParagraphStyle())
        ..pushStyle(ui.TextStyle(color: textColor, fontSize: 8))
        ..addText(textValue.toStringAsFixed(2));
      final paragraph = paragraphBuilder.build();
      paragraph.layout(ui.ParagraphConstraints(width: paragraphConstraint));

      canvas.drawParagraph(paragraph, textOffset);
    }

    // Drawing Lines

    for (double i = 0.0; i <= 1.05; i += 0.05) {
      if (i.toStringAsFixed(2) == '0.50') {
        // Drawing Middle Vertical Line

        drawLinesValues(
            textValue: i,
            textOffset: Offset(width * i + width * 0.005, -height * 0.045),
            textColor: middleTextColor,
            paragraphConstraint: 9);

        canvas.drawLine(Offset(width * i, -height * 0.045),
            Offset(width * i, height), middleLinePaint);
      } else {
        // Drawing All Lines Except Middle Line Vertical Line

        drawLinesValues(
            textValue: i,
            textOffset: Offset(width * i + width * 0.005, -height * 0.045),
            textColor: textColor,
            paragraphConstraint: 9);

        canvas.drawLine(Offset(width * i, -height * 0.045),
            Offset(width * i, height), linesPaint);
      }
    }

    for (double i = 0; i <= 1.05; i += 0.05) {
      // Drawing Middle Horizontal Line
      if (i.toStringAsFixed(2) == '0.50') {
        drawLinesValues(
          textValue: i,
          textOffset: Offset(-width * 0.045, height * i - height * 0.016),
          textColor: middleTextColor,
          paragraphConstraint: 15,
        );

        canvas.drawLine(Offset(-width * 0.05, height * i),
            Offset(width, height * i), middleLinePaint);
      } else {
        // Drawing All Lines Except Middle Line Horizontal Line
        drawLinesValues(
          textValue: i,
          textOffset: Offset(-width * 0.045, height * i - height * 0.016),
          textColor: textColor,
          paragraphConstraint: 15,
        );

        canvas.drawLine(Offset(-width * 0.05, height * i),
            Offset(width, height * i), linesPaint);
      }
    }
  }

  @override
  bool shouldRepaint(ShapeMakerPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ShapeMakerPainter oldDelegate) => false;
}
