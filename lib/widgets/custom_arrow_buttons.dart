import 'package:flutter/material.dart';

class CustomLeftArrowBorderPainter extends CustomPainter {
  final Color color;
  final double borderWidth;

  CustomLeftArrowBorderPainter(
      {required this.color, required this.borderWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final path = CustomLeftArrowClipper().getClip(size);

    final borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CustomLeftArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height / 2);
    path.lineTo(0, size.height);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

// This is for right side
class CustomRightArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Left arrow pointing outward
    path.moveTo(0, 0);
    path.lineTo(20, size.height / 2);
    path.lineTo(0, size.height);

    // Right arrow pointing inward
    path.lineTo(size.width - 20, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, 0);

    // Completing the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomRightArrowBorderPainter extends CustomPainter {
  final Color color;
  final double borderWidth;

  CustomRightArrowBorderPainter(
      {required this.color, required this.borderWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final path = CustomRightArrowClipper().getClip(size);

    final borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
