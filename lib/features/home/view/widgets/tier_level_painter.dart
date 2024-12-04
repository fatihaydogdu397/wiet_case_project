import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wiet_case_project/features/home/dto/cat_tier_model.dart';

class TierLevelPainter extends CustomPainter {
  final int tierPoints;
  final String currentTier;
  final List<Tier> tiers;

  TierLevelPainter({required this.tierPoints, required this.tiers, required this.currentTier});
  Color hexToColor(String hexCode) {
    final buffer = StringBuffer();
    if (hexCode.length == 6 || hexCode.length == 7) {
      if (hexCode.startsWith('#')) {
        buffer.write('0xFF');
        buffer.write(hexCode.substring(1));
      } else {
        buffer.write('0xFF');
        buffer.write(hexCode);
      }
      return Color(int.parse(buffer.toString()));
    } else {
      throw const FormatException("Invalid hex code format");
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double outerRadius = size.width / 2;
    final double innerRadius = outerRadius - 40;
    const double spaceBetweenSegments = 0.05;

    List<Color> bgColors = [];
    tiers.forEach((element) {
      bgColors.add(hexToColor(element.bgColor));
    });
    List<Color> textColors = [];
    tiers.forEach((element) {
      textColors.add(hexToColor(element.fontColor));
    });

    double startAngle = -pi / 2;
    for (int i = 0; i < 4; i++) {
      paint.color = bgColors[i];
      canvas.drawArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: outerRadius),
        startAngle,
        (2 * pi / 4) - spaceBetweenSegments,
        true,
        paint,
      );

      paint.color = Colors.white;
      canvas.drawArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: innerRadius),
        startAngle,
        (2 * pi / 4) - spaceBetweenSegments,
        true,
        paint,
      );

      _drawSegmentText(canvas, tiers[i].tierName, startAngle, textColors, outerRadius, centerX, centerY, i);
      double angleForActiveSegment = _getAngleForTierPoints(tierPoints);
      _drawArrowInActiveSegment(canvas, angleForActiveSegment, outerRadius, centerX, centerY);
      startAngle += (2 * pi / 4);
    }
  }

  double _getAngleForTierPoints(int tierPoints) {
    double angle = 0.0;
    if (tierPoints >= 0 && tierPoints <= 3999) {
      angle = (tierPoints / 3999) * 90;
    } else if (tierPoints >= 4000 && tierPoints <= 9999) {
      angle = 90 + ((tierPoints - 4000) / (9999 - 4000)) * 90;
    } else if (tierPoints >= 10000 && tierPoints <= 25000) {
      angle = 180 + ((tierPoints - 10000) / (25000 - 10000)) * 90;
    } else if (tierPoints >= 25001 && tierPoints <= 99999999) {
      angle = 270 + ((tierPoints - 25001) / (99999999 - 25001)) * 90;
    }
    return -pi / 2 + (angle * pi / 180);
  }

  void _drawArrowInActiveSegment(Canvas canvas, double angle, double radius, double centerX, double centerY) {
    final Paint arrowPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    double endX = centerX + radius * cos(angle);
    double endY = centerY + radius * sin(angle);

    double arrowHeadSize = 40.0;
    double arrowHeadX1 = endX - arrowHeadSize * cos(angle - pi / 20);
    double arrowHeadY1 = endY - arrowHeadSize * sin(angle - pi / 20);
    double arrowHeadX2 = endX - arrowHeadSize * cos(angle + pi / 20);
    double arrowHeadY2 = endY - arrowHeadSize * sin(angle + pi / 20);

    Path arrowHeadPath = Path();
    arrowHeadPath.moveTo(endX, endY);
    arrowHeadPath.lineTo(arrowHeadX1, arrowHeadY1);
    arrowHeadPath.lineTo(arrowHeadX2, arrowHeadY2);
    arrowHeadPath.close();

    canvas.drawPath(arrowHeadPath, arrowPaint);
  }

  void _drawSegmentText(
      Canvas canvas, String text, double startAngle, List<Color> textColors, double radius, double centerX, double centerY, int segmentIndex) {
    final TextSpan span = TextSpan(
      style: TextStyle(color: textColors[segmentIndex], fontSize: 16),
      text: text.toUpperCase(),
    );
    final TextPainter textPainter = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    double angle = startAngle + pi / 4;
    double textX = centerX + (radius - 20) * cos(angle) - textPainter.width / 2;
    double textY = centerY + (radius - 20) * sin(angle) - textPainter.height / 2;
    canvas.save();
    canvas.translate(textX + textPainter.width / 2, textY + textPainter.height / 2);

    if (segmentIndex == 0) {
      canvas.rotate(pi / 3.7);
    }
    if (segmentIndex == 1) {
      canvas.rotate(pi / 1.3);
    }
    if (segmentIndex == 2) {
      canvas.rotate(pi / 0.8);
    }
    if (segmentIndex == 3) {
      canvas.rotate(pi / 0.1023);
    }
    canvas.translate(-textPainter.width / 2, -textPainter.height / 2);

    textPainter.paint(canvas, const Offset(0, 0));
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
