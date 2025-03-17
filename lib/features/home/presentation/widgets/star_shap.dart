import 'dart:math';
import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final int points;
  final double innerRadiusRatio;

  StarPainter({
    required this.color,
    this.strokeWidth = 2.0,
    this.points = 8, // Default to an 8-pointed star
    this.innerRadiusRatio = 0.4, // Controls sharpness of points
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke; // Outline style, adjustable if needed

    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = min(size.width, size.height) / 2;
    final innerRadius = outerRadius * innerRadiusRatio;
    final totalPoints = points * 2; // Double the points for inner and outer
    final angleStep = 2 * pi / totalPoints;

    // Calculate and connect star points
    for (int i = 0; i < totalPoints; i++) {
      final radius = i % 2 == 0 ? outerRadius : innerRadius;
      final angle = i * angleStep;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class StarWithNumber extends StatelessWidget {
  final int number;
  final Color starColor;
  final double size;
  final int points;
  final double innerRadiusRatio;

  const StarWithNumber({
    super.key,
    required this.number,
    required this.starColor,
    this.size = 50.0,
    this.points = 8,
    this.innerRadiusRatio = 0.7,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center, // Centers the number perfectly
        children: [
          CustomPaint(
            painter: StarPainter(
              color: starColor,
              points: points,
              innerRadiusRatio: innerRadiusRatio,
            ),
            size: Size(size, size),
          ),
          Text(
            number.toString(),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: size * 0.4, // Number size proportional to star
            ),
          ),
        ],
      ),
    );
  }
}
