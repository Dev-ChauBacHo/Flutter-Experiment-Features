import 'dart:ui' as ui;

import 'package:experiment_app/page_three.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  List<Offset> point = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'PageTwo',
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => PageThree()));
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.red,
          child: GestureDetector(
            onTapDown: (details) {
              point.add(
                Offset(
                  details.localPosition.dx,
                  details.localPosition.dy,
                ),
              );
            },
            onLongPressMoveUpdate: (details) {
              setState(() {
                point.add(
                  Offset(
                    details.localPosition.dx,
                    details.localPosition.dy,
                  ),
                );
              });
            },
            onHorizontalDragUpdate: (details) {
              setState(() {
                point.add(
                  Offset(
                    details.localPosition.dx,
                    details.localPosition.dy,
                  ),
                );
              });
            },
            onVerticalDragUpdate: (details) {
              final current = Offset(
                details.localPosition.dx,
                details.localPosition.dy,
              );
              if (point.isNotEmpty) {
                for (double x = point.last.dx, y = point.last.dy;
                    x < current.dx && y < current.dy;
                    x += 0.01, y += 0.01) {
                  point.add(
                    Offset(
                      x,
                      y,
                    ),
                  );
                }
              }
              setState(() {
                point.add(
                  Offset(
                    details.localPosition.dx,
                    details.localPosition.dy,
                  ),
                );
              });
            },
            onTap: () {
              setState(() {});
            },
            child: CustomPaint(
              size: Size(size.width, size.height),
              painter: MyPainter(point),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final List<Offset> offsets;

  MyPainter(this.offsets);

  @override
  void paint(Canvas canvas, Size size) {
    const pointMode = ui.PointMode.points;
    final points = offsets;
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(pointMode, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool? hitTest(ui.Offset position) {
    // TODO: implement hitTest
    return super.hitTest(position);
  }
}
