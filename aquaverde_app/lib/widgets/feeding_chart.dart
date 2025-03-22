import 'package:flutter/material.dart';
import '../config/constants.dart';

class FeedingChart extends StatelessWidget {
  final List<FeedingData> data;
  final double height;
  final bool showLabels;
  final String title;

  const FeedingChart({
    super.key,
    required this.data,
    this.height = 200,
    this.showLabels = true,
    this.title = 'Feeding Activity',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: height,
            child: CustomPaint(
              size: Size.infinite,
              painter: _ChartPainter(
                data: data,
                showLabels: showLabels,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  final List<FeedingData> data;
  final bool showLabels;
  final double paddingBottom = 40.0;
  final double paddingLeft = 40.0;

  _ChartPainter({
    required this.data,
    required this.showLabels,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppConstants.primaryBlue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final dotPaint = Paint()
      ..color = AppConstants.primaryBlue
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Draw grid lines
    _drawGrid(canvas, size, linePaint);

    // Draw axis
    _drawAxis(canvas, size, paint);

    // Draw data points and lines
    if (data.isNotEmpty) {
      final path = Path();
      final points = _getPoints(size);

      path.moveTo(points.first.dx, points.first.dy);
      for (var i = 1; i < points.length; i++) {
        path.lineTo(points[i].dx, points[i].dy);
      }

      canvas.drawPath(path, paint);

      // Draw points
      for (var point in points) {
        canvas.drawCircle(point, 4, dotPaint);
      }

      // Draw gradient
      final gradientPath = Path()
        ..addPath(path, Offset.zero)
        ..lineTo(size.width - paddingLeft, size.height - paddingBottom)
        ..lineTo(paddingLeft, size.height - paddingBottom)
        ..close();

      canvas.drawPath(
        gradientPath,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppConstants.primaryBlue.withOpacity(0.2),
              AppConstants.primaryBlue.withOpacity(0.0),
            ],
          ).createShader(
            Rect.fromLTWH(0, 0, size.width, size.height),
          )
          ..style = PaintingStyle.fill,
      );
    }

    if (showLabels) {
      _drawLabels(canvas, size);
    }
  }

  void _drawGrid(Canvas canvas, Size size, Paint paint) {
    final horizontalLines = 5;
    final verticalLines = data.length;
    final horizontalSpacing = (size.height - paddingBottom) / horizontalLines;
    final verticalSpacing = (size.width - paddingLeft) / verticalLines;

    // Draw horizontal lines
    for (var i = 0; i <= horizontalLines; i++) {
      final y = i * horizontalSpacing;
      canvas.drawLine(
        Offset(paddingLeft, y),
        Offset(size.width, y),
        paint,
      );
    }

    // Draw vertical lines
    for (var i = 0; i <= verticalLines; i++) {
      final x = paddingLeft + (i * verticalSpacing);
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height - paddingBottom),
        paint,
      );
    }
  }

  void _drawAxis(Canvas canvas, Size size, Paint paint) {
    // Y-axis
    canvas.drawLine(
      Offset(paddingLeft, 0),
      Offset(paddingLeft, size.height - paddingBottom),
      paint,
    );

    // X-axis
    canvas.drawLine(
      Offset(paddingLeft, size.height - paddingBottom),
      Offset(size.width, size.height - paddingBottom),
      paint,
    );
  }

  void _drawLabels(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    // Draw Y-axis labels
    final maxValue = data.map((e) => e.value).reduce((a, b) => a > b ? a : b);
    for (var i = 0; i <= 5; i++) {
      final value = (maxValue * (5 - i) / 5).toStringAsFixed(1);
      textPainter.text = TextSpan(
        text: value,
        style: const TextStyle(
          color: AppConstants.textSecondary,
          fontSize: 10,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          0,
          (i * (size.height - paddingBottom) / 5) - textPainter.height / 2,
        ),
      );
    }

    // Draw X-axis labels
    final xSpacing = (size.width - paddingLeft) / (data.length - 1);
    for (var i = 0; i < data.length; i++) {
      textPainter.text = TextSpan(
        text: data[i].label,
        style: const TextStyle(
          color: AppConstants.textSecondary,
          fontSize: 10,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          paddingLeft + (i * xSpacing) - textPainter.width / 2,
          size.height - paddingBottom + 8,
        ),
      );
    }
  }

  List<Offset> _getPoints(Size size) {
    final points = <Offset>[];
    final maxValue = data.map((e) => e.value).reduce((a, b) => a > b ? a : b);
    final xSpacing = (size.width - paddingLeft) / (data.length - 1);
    final yScale = (size.height - paddingBottom) / maxValue;

    for (var i = 0; i < data.length; i++) {
      points.add(
        Offset(
          paddingLeft + (i * xSpacing),
          size.height - paddingBottom - (data[i].value * yScale),
        ),
      );
    }

    return points;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class FeedingData {
  final double value;
  final String label;

  const FeedingData({
    required this.value,
    required this.label,
  });
}

// Mini version of the chart for dashboard
class FeedingMiniChart extends StatelessWidget {
  final List<FeedingData> data;
  final double height;
  final String title;

  const FeedingMiniChart({
    super.key,
    required this.data,
    this.height = 100,
    this.title = 'Today\'s Activity',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: height,
            child: CustomPaint(
              size: Size.infinite,
              painter: _ChartPainter(
                data: data,
                showLabels: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}