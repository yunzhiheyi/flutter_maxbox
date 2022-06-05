// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LeftToRightPageRoute extends PageRouteBuilder {
  final Widget newPage;

  LeftToRightPageRoute(this.newPage)
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              newPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween(begin: const Offset(-1, 0), end: const Offset(0, 0))
                .animate(animation),
            child: child,
          ),
        );
}
