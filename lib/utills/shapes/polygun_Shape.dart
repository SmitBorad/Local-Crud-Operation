// import 'package:flutter/material.dart';
// import 'dart:math' as math;
//
// import '../AppColors.dart';
//
// class PolygonSliderThumb extends SliderComponentShape {
//   final double thumbRadius;
//   final double sliderValue;
//   final bool centerValue;
//
//   const PolygonSliderThumb({
//     this.centerValue = true,
//     required this.thumbRadius,
//     required this.sliderValue,
//   });
//
//   @override
//   Size getPreferredSize(bool isEnabled, bool isDiscrete) {
//     return Size.fromRadius(thumbRadius);
//   }
//
//   @override
//   void paint(PaintingContext context, Offset center,
//       {required Animation<double> activationAnimation,
//       required Animation<double> enableAnimation,
//       required bool isDiscrete,
//       required TextPainter labelPainter,
//       required RenderBox parentBox,
//       required SliderThemeData sliderTheme,
//       required TextDirection textDirection,
//       required double value,
//       required double textScaleFactor,
//       required Size sizeWithOverflow}) {
//     final Canvas canvas = context.canvas;
//     int sides = 4;
//     double innerPolygonRadius = thumbRadius;
//     double outerPolygonRadius = thumbRadius;
//     double angle = (math.pi * 2) / sides;
//     // TODO: implement paint
//
//     final outerPathColor = Paint();
//
//     var outerPath = Path();
//
//     Offset startPoint2 = Offset(
//       outerPolygonRadius * math.cos(0.0),
//       outerPolygonRadius * math.sin(0.0),
//     );
//
//     outerPath.moveTo(
//       startPoint2.dx + center.dx,
//       startPoint2.dy + center.dy,
//     );
//
//     for (int i = 1; i <= sides; i++) {
//       double x = outerPolygonRadius * math.cos(angle * i) + center.dx;
//       double y = outerPolygonRadius * math.sin(angle * i) + center.dy;
//       outerPath.lineTo(x, y);
//     }
//
//     outerPath.close();
//     canvas.drawPath(outerPath, outerPathColor);
//
//     final innerPathColor = Paint()
//       ..color = sliderTheme.thumbColor ?? Colors.black
//       ..style = PaintingStyle.fill;
//
//     var innerPath = Path();
//
//     Offset startPoint = Offset(
//       innerPolygonRadius * math.cos(0.0),
//       innerPolygonRadius * math.sin(0.0),
//     );
//
//     innerPath.moveTo(
//       startPoint.dx + center.dx,
//       startPoint.dy + center.dy,
//     );
//
//     for (int i = 1; i <= sides; i++) {
//       double x = innerPolygonRadius * math.cos(angle * i) + center.dx;
//       double y = innerPolygonRadius * math.sin(angle * i) + center.dy;
//       innerPath.lineTo(x, y);
//     }
//
//     innerPath.close();
//     canvas.drawPath(innerPath, innerPathColor);
//
//     if (centerValue == true) {
//       TextSpan span = TextSpan(
//         style: TextStyle(
//           fontSize: thumbRadius,
//           fontWeight: FontWeight.w700,
//           color: Colors.white,
//         ),
//         text: sliderValue.round().toString(),
//       );
//
//       TextPainter tp = TextPainter(
//         text: span,
//         textAlign: TextAlign.center,
//         textDirection: TextDirection.ltr,
//       );
//
//       tp.layout();
//
//       Offset textCenter = Offset(
//         center.dx - (tp.width / 2),
//         center.dy - (tp.height / 2),
//       );
//
//       tp.paint(canvas, textCenter);
//     }
//   }
//
// // ...
// }
//
// class PolygonSliderTickmark extends SliderTickMarkShape {
//   final double thumbRadius;
//
//   const PolygonSliderTickmark({
//     required this.thumbRadius,
//   });
//
//   @override
//   Size getPreferredSize(
//       {required SliderThemeData sliderTheme, required bool isEnabled}) {
//     // TODO: implement getPreferredSize
//     return Size.fromRadius(thumbRadius);
//   }
//
//   @override
//   void paint(PaintingContext context, Offset center,
//       {required RenderBox parentBox,
//       required SliderThemeData sliderTheme,
//       required Animation<double> enableAnimation,
//       required Offset thumbCenter,
//       required bool isEnabled,
//       required TextDirection textDirection}) {
//     // TODO: implement paint
//     final Canvas canvas = context.canvas;
//     int sides = 4;
//     double innerPolygonRadius = thumbRadius;
//     double outerPolygonRadius = thumbRadius;
//     double angle = (math.pi * 2) / sides;
//     // TODO: implement paint
//
//     final outerPathColor = Paint()
//       ..color = colorE5E5E5
//       ..style = PaintingStyle.fill;
//
//     var outerPath = Path();
//
//     Offset startPoint2 = Offset(
//       outerPolygonRadius * math.cos(0.0),
//       outerPolygonRadius * math.sin(0.0),
//     );
//
//     outerPath.moveTo(
//       startPoint2.dx + center.dx,
//       startPoint2.dy + center.dy,
//     );
//
//     for (int i = 1; i <= sides; i++) {
//       double x = outerPolygonRadius * math.cos(angle * i) + center.dx;
//       double y = outerPolygonRadius * math.sin(angle * i) + center.dy;
//       outerPath.lineTo(x, y);
//     }
//
//     outerPath.close();
//     canvas.drawPath(outerPath, outerPathColor);
//
//     final innerPathColor = Paint()
//       ..color = sliderTheme.thumbColor ?? Colors.black
//       ..style = PaintingStyle.fill;
//
//     var innerPath = Path();
//
//     Offset startPoint = Offset(
//       innerPolygonRadius * math.cos(0.0),
//       innerPolygonRadius * math.sin(0.0),
//     );
//
//     innerPath.moveTo(
//       startPoint.dx + center.dx,
//       startPoint.dy + center.dy,
//     );
//
//     for (int i = 1; i <= sides; i++) {
//       double x = innerPolygonRadius * math.cos(angle * i) + center.dx;
//       double y = innerPolygonRadius * math.sin(angle * i) + center.dy;
//       innerPath.lineTo(x, y);
//     }
//
//     innerPath.close();
//   }
// }
