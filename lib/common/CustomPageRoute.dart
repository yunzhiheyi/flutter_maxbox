import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget currentPage;
  final Widget newPage;

  CustomPageRoute(this.currentPage, this.newPage)
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              currentPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(0, 0),
                  end: const Offset(0, -1),
                ).animate(animation),
                child: currentPage,
              ),
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset(0, 0),
                ).animate(animation),
                child: newPage,
              )
            ],
          ),
        );
}
