// ignore_for_file: library_private_types_in_public_api, must_be_immutable, overridden_fields, annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' show pi;

class AnimatedRotate extends ImplicitlyAnimatedWidget {
  const AnimatedRotate({
    Key? key,
    required this.angle,
    required this.child,
    VoidCallback? onEnd,
    Curve curve = Curves.linear,
    Duration duration = const Duration(seconds: 1),
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
          onEnd: onEnd,
        );

  /// 旋转角度
  final num angle;

  /// Widget
  final Widget child;

  @override
  _AnimatedRotateState createState() => _AnimatedRotateState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<num>('angle', angle));
  }
}

class _AnimatedRotateState extends AnimatedWidgetBaseState<AnimatedRotate> {
  Tween<num>? _angle;

  num _degToRad(num deg) => deg * (pi / 180.0);

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _angle = visitor(_angle, widget.angle,
        (dynamic value) => Tween<num>(begin: value as num)) as Tween<num>?;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _degToRad(_angle!.evaluate(animation)).toDouble(),
      child: widget.child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(
      DiagnosticsProperty<Tween<num>?>(
        'angle',
        _angle,
        defaultValue: null,
      ),
    );
  }
}
