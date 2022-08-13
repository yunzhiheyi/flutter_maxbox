// ignore_for_file: file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'dart:math';
import 'package:flutter/material.dart';

class AnimatToggleRotate extends StatefulWidget {
  final Widget? child;
  final Widget? iconChild;
  final ValueChanged<bool>? onEnd;
  final VoidCallback? onTap;
  final double beginAngle;
  final double endAngle;
  final int durationMs;
  final bool clockwise;
  final bool isLoop;
  final bool isRotate;
  final Curve curve;

  AnimatToggleRotate({
    this.child,
    this.iconChild,
    this.onTap,
    this.onEnd,
    this.isRotate = false,
    this.beginAngle = 0,
    this.endAngle = 90,
    this.isLoop = true,
    this.clockwise = true,
    this.durationMs = 200,
    this.curve = Curves.fastOutSlowIn,
  });

  @override
  _AnimatToggleRotateState createState() => _AnimatToggleRotateState();
}

class _AnimatToggleRotateState extends State<AnimatToggleRotate>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAnim;
  bool _rotated = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: widget.durationMs), vsync: this);
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        widget.onEnd?.call(true);
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _initTweenAnim();
  }

  void _initTweenAnim([double? beginAngle, double? endAngle]) {
    double _beginAngle = beginAngle ?? widget.beginAngle;
    double _endAngle = endAngle ?? widget.endAngle;
    _rotateAnim =
        Tween<double>(begin: _beginAngle / 180 * pi, end: _endAngle / 180 * pi)
            .chain(CurveTween(curve: widget.curve))
            .animate(_controller);
  }

  @override
  void didUpdateWidget(AnimatToggleRotate oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.durationMs != oldWidget.durationMs) {
      _controller.dispose();
      _controller = AnimationController(
          duration: Duration(milliseconds: widget.durationMs), vsync: this);
      _initTweenAnim();
    }
    if (widget.beginAngle != oldWidget.beginAngle ||
        widget.endAngle != oldWidget.endAngle ||
        widget.curve != oldWidget.curve ||
        widget.isRotate != oldWidget.isRotate) {
      // 不循环
      if (widget.isLoop) {
        _initTweenAnim();
        if (!_rotated) {
          _controller.reset();
          _controller.forward();
          _rotated = false;
        }
      } else {
        double __beginAngle =
            widget.isRotate ? widget.beginAngle : widget.endAngle;
        double __endAngle =
            !widget.isRotate ? widget.endAngle : widget.beginAngle;
        _initTweenAnim(__beginAngle, __endAngle);
        if (widget.isRotate) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
        _rotated = !_rotated;
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("AdidChangeDependencies");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double get rad => widget.clockwise ? _rotateAnim.value : -_rotateAnim.value;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => Transform(
        transform: Matrix4.rotationZ(rad),
        alignment: Alignment.center,
        child: !widget.isLoop ? widget.iconChild : widget.child,
      ),
    );
  }
}
