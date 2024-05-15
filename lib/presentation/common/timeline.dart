

import 'package:flutter/material.dart';

class Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: 15, // Adjust the width as needed
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Color(0xFF85A08B),
          ),
          Expanded(
            child: CustomPaint(
              painter: DottedLinePainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color(0xFF46624C) // Change this to your desired color
      ..strokeWidth = 1; // Change this to your desired line thickness

    double dashHeight = 5, dashSpace = 5;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
