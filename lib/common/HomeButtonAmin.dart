// ignore_for_file: file_names, library_private_types_in_public_api, avoid_unnecessary_containers, unnecessary_const, prefer_const_constructors, sized_box_for_whitespace, unnecessary_new, prefer_const_literals_to_create_immutables, must_be_immutable, unused_field, prefer_const_constructors_in_immutables, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:max_box/utils/adApt.dart';
import 'HomeSheetTools.dart';

class HomeButtonAmin extends StatefulWidget {
  const HomeButtonAmin({Key? key}) : super(key: key);

  @override
  _HomeButtonAminState createState() => _HomeButtonAminState();
}

class _HomeButtonAminState extends State<HomeButtonAmin>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late Color AnimaValue;
  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 100), vsync: this);
    _animation = ColorTween(begin: Color(0xFF482CFB), end: Color(0xFFACA1F6))
        .chain(CurveTween(curve: Curves.easeInOutCubic))
        .animate(_controller);
    _controller.addListener(() {
      setState(() {}); //build重新构建
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
    super.initState();
  }

  // Future<void> _onPressedSubmit() async {
  //   widget.onTap?.call();
  // }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              // 底部面板
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                      height: Adapt.px(450),
                      alignment: Alignment.topCenter,
                      color: Colors.white,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const HomeSheetTools(),
                            Expanded(
                                child: GestureDetector(
                              onTap: () => {Navigator.pop(context)},
                              child: Icon(
                                Icons.close_rounded,
                                size: Adapt.px(54),
                                color: Colors.black26,
                              ),
                            )),
                          ]));
                },
              )
            },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: Adapt.px(70),
              width: Adapt.px(70),
              margin: EdgeInsets.fromLTRB(0, Adapt.px(8), 0, Adapt.px(8)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                boxShadow: [
                  BoxShadow(
                      color: _animation.value,
                      blurRadius: 10.0,
                      spreadRadius: 1.0)
                ],
                color: Color.fromARGB(255, 72, 44, 251),
              ),
              child: Transform.rotate(
                alignment: Alignment.center,
                //旋转的倍数
                angle: 5.5,
                //旋转的子Widget
                child: Icon(
                  Icons.rocket_launch,
                  size: Adapt.px(52),
                  color: Colors.white,
                ),
              ),
            )
          ],
        ));
  }
}
