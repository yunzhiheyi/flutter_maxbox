// ignore_for_file: file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print

import 'dart:math';
import 'package:flutter/material.dart';

class ToggleRotate extends StatefulWidget {
  final Widget child;
  final ValueChanged<bool>? onEnd;
  final VoidCallback? onTap;
  final double beginAngle;
  final double endAngle;
  final int durationMs;
  final bool clockwise;
  final Curve curve;

  ToggleRotate({
    required this.child,
    this.onTap,
    this.onEnd,
    this.beginAngle = 0,
    this.endAngle = 90,
    this.clockwise = true,
    this.durationMs = 200,
    this.curve = Curves.fastOutSlowIn,
  });

  @override
  _ToggleRotateState createState() => _ToggleRotateState();
}

class _ToggleRotateState extends State<ToggleRotate>
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
        print('11');
      } else if (status == AnimationStatus.dismissed) {
        print('12');
        _controller.forward();
      }
    });
    _initTweenAnim();
  }

  void _initTweenAnim() {
    _rotateAnim = Tween<double>(
            begin: widget.beginAngle / 180 * pi,
            end: widget.endAngle / 180 * pi)
        .chain(CurveTween(curve: widget.curve))
        .animate(_controller);
  }

  @override
  void didUpdateWidget(ToggleRotate oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.durationMs != oldWidget.durationMs) {
      _controller.dispose();
      _controller = AnimationController(
          duration: Duration(milliseconds: widget.durationMs), vsync: this);
      _initTweenAnim();
      print("1");
    }
    if (widget.beginAngle != oldWidget.beginAngle ||
        widget.endAngle != oldWidget.endAngle ||
        widget.curve != oldWidget.curve) {
      _initTweenAnim();
      if (!_rotated) {
        _controller.reset();
        _controller.forward();
        _rotated = false;
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
        child: widget.child,
      ),
    );
  }
}
