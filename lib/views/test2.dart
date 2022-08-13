// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, camel_case_types, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:max_box/common/AppToBar.dart';
import 'package:max_box/utils/adApt.dart';

class test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: testHome());
  }
}

class testHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
        appBar: AppToBar(
          title: '五边形布局',
        ),
        body: Container(
            height: 400,
            width: double.infinity,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(left: Adapt.px(60), right: Adapt.px(60)),
            child: RotatedBox(
                //旋转的倍数
                quarterTurns: 3,
                //旋转的子Widget
                child: Flow(
                  delegate: _CircleFlow(),
                  children: [
                    RotatedBox(
                        //旋转的倍数
                        quarterTurns: 1,
                        //旋转的子Widget
                        child: Container(
                          width: 80,
                          height: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 186, 184, 184),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0))),
                          child: Text(
                            '测试1',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )),
                    RotatedBox(
                        //旋转的倍数
                        quarterTurns: 1,
                        //旋转的子Widget
                        child: Container(
                          width: 80,
                          height: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 186, 184, 184),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0))),
                          child: Text(
                            '测试2',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )),
                    RotatedBox(
                        //旋转的倍数
                        quarterTurns: 1,
                        //旋转的子Widget
                        child: Container(
                          width: 80,
                          height: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 186, 184, 184),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0))),
                          child: Text(
                            '测试3',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )),
                    RotatedBox(
                        //旋转的倍数
                        quarterTurns: 1,
                        //旋转的子Widget
                        child: Container(
                          width: 80,
                          height: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 186, 184, 184),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0))),
                          child: Text(
                            '测试4',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )),
                    RotatedBox(
                        //旋转的倍数
                        quarterTurns: 1,
                        //旋转的子Widget
                        child: Container(
                          width: 80,
                          height: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 186, 184, 184),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0))),
                          child: Text(
                            '测试5',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )),
                  ],
                ))));
  }
}

class _CircleFlow extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    // 半径
    double radius = context.size.shortestSide / 2;
    var count = context.childCount;
    // 转换角度72度
    var perRad = 72 / 180.0 * pi;  
    for (int i = 0; i < count; i++) {
      var cSizeX = 80 / 2;
      var cSizeY = 80 / 2;
      var offsetX = (radius - cSizeX) * cos(i * perRad) + radius;
      var offsetY = (radius - cSizeY) * sin(i * perRad) + radius;
      context.paintChild(i,
          transform: Matrix4.translationValues(
              offsetX - cSizeX, offsetY - cSizeY, 0.0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return true;
  }
}
