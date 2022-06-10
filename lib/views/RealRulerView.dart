// ignore_for_file: file_names, must_be_immutable, avoid_unnecessary_containers, unnecessary_null_comparison

import 'dart:math';

import 'package:flutter/material.dart';

class RulerWidget extends StatefulWidget {
  ///尺子距离左边的距离
  double leftPadding;

  ///尺子的线宽
  double lineWidth;
  double line1Width;

  ///尺子的线的高度
  double line1Height;

  ///尺子第二高度
  double line2Height;

  ///尺子的第三高度
  double line3Height;
  Color lineColor;
  Color indicationColor;

  ///文字样式
  TextStyle? style;

  ///尺子的最大刻度
  double maxScale;

  /// 5个dp对应一个刻度
  int unit;

  ///尺子的高度
  double rulerHeight;

  ///刻度和尺子的距离
  double paddingText;

  ///等边三角形的宽度
  double sanWidth;

  ///尺度的间隔
  double margin;

  final void Function(double) onChanged;

  RulerWidget(
      {Key? key,
      this.leftPadding = 5,
      this.lineWidth = 1,
      this.line1Width = 1,
      this.margin = 10.0,
      this.line1Height = 15,
      this.line2Height = 25,
      this.line3Height = 20,
      this.lineColor = const Color(0xFF616161),
      this.indicationColor = Colors.purple,
      this.maxScale = 100.0,
      this.unit = 4,
      this.rulerHeight = 50,
      this.paddingText = 5,
      this.sanWidth = 10,
      required this.onChanged,
      this.style})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RulerState();
  }
}

class RulerState extends State<RulerWidget> {
  final ValueNotifier<double> _dx = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: const Size(55, 900),
        painter: RulerCustomPainter(widget, _dx),
      ),
    );
  }

  double dx = 0;

  parse(DragUpdateDetails details) {
    dx += details.delta.dx;
    if (dx > 0) {
      dx = 0;
    }

    if (dx < -100 * widget.unit) {
      dx = -100.0 * widget.unit;
    }
    _dx.value = dx;

    if (widget.onChanged != null) {
      widget.onChanged(dx);
    }
  }
}

class RulerCustomPainter extends CustomPainter {
  RulerWidget widget;
  ValueNotifier<double> dx;

  RulerCustomPainter(this.widget, this.dx) : super(repaint: dx);

  @override
  void paint(Canvas canvas, Size size) {
    /// 当刻度是10的倍数的时候绘制最长刻度，并在刻度下面绘制文字
    /// 当刻度是5的倍数的时候绘制绘制第二长刻度
    /// 其他情况绘制一般的刻度
    canvas.clipRect(Offset.zero & size);
    canvas.save();
    canvas.restore();
    canvas.drawLine(
        const Offset(0, 0),
        const Offset(0, 900),
        Paint()
          ..color = widget.lineColor
          ..strokeWidth = 2);

    ///重新绘制的时候
    canvas.translate(dx.value, 0);

    for (int i = 0; i <= widget.maxScale; i++) {
      if (i % 10 == 0) {
        canvas.drawLine(
            Offset(0, i * widget.margin),
            Offset(widget.line3Height, i * widget.margin),
            Paint()
              ..color = widget.lineColor
              ..strokeWidth = widget.lineWidth);
        // drawText(i, canvas);
      } else if (i % 5 == 0) {
        canvas.drawLine(
            Offset(
              0,
              i * widget.margin,
            ),
            Offset(widget.line2Height, i * widget.margin),
            Paint()
              ..color = widget.lineColor
              ..strokeWidth = widget.lineWidth);
      } else {
        canvas.drawLine(
            Offset(0, i * widget.margin),
            Offset(widget.line1Height, i * widget.margin),
            Paint()
              ..color = widget.lineColor
              ..strokeWidth = widget.line1Width);
      }
    }
  }

  void drawText(int i, Canvas canvas) {
    var textPainter = TextPainter(
        text: TextSpan(
            text: "$i",
            style: const TextStyle(
                fontSize: 12, color: Color.fromARGB(255, 122, 122, 122))),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left);
    textPainter.layout();
    // textPainter.paint(canvas,
    //     Offset(i * widget.margin - 8, widget.line3Height + widget.paddingText));
  }

  @override
  bool shouldRepaint(RulerCustomPainter oldDelegate) {
    return dx != oldDelegate.dx;
  }
}
