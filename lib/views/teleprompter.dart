// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, avoid_unnecessary_containers, unnecessary_const, must_be_immutable, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, override_on_non_overriding_member, avoid_print, unused_local_variable

import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fengchao/common/AppToBar.dart';
import 'package:android_window/main.dart' as android_window;
import 'package:fengchao/common/PullDownRefreshList.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fengchao/common/TeleprompterHead.dart';
import 'package:fengchao/utils/adApt.dart';

import '../bloc/teleprompter/teleprompter_bloc.dart';
import '../common/TeleprompterSetup.dart';

class TeleprompterIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: BlocProvider(
            create: (_) => TeleprompterBloc(), child: TeleprompterList()));
  }
}

class TeleprompterList extends StatelessWidget {
  double width = 0;
  double height = 0;
  double offsetX = 0;
  double offsetY = 0;
  double winWidth = window.physicalSize.width.toDouble();
  double winHeight = window.physicalSize.height.toDouble();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //状态栏背景颜色
        statusBarIconBrightness: Brightness.light // dark:一般显示黑色   light：一般显示白色
        ));
    double winWidth = window.physicalSize.width.toDouble();
    double winHeight = window.physicalSize.height.toDouble();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
      appBar: AppToBar(
          title: '提词器',
          rightChild: IconButton(
              icon: Icon(
                Icons.settings,
                size: Adapt.px(40),
                color: Colors.white,
              ),
              onPressed: () {
                width = 660;
                height = 660;
                offsetX = (winWidth - width).toDouble() / 2;
                offsetY = 400;
                if (Platform.isAndroid) {
                  android_window.open(
                    size: Size(width, height),
                    focusable: true,
                    position: Offset(offsetX, offsetY),
                  );
                } else {
                  print('IOS弹窗');
                }
                showModalBottomSheet(
                    context: context,
                    barrierColor: Color.fromARGB(46, 209, 209, 209),
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return Container(
                          height: Adapt.px(630),
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0))),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TeleprompterSetup(),
                              ]));
                    });
              })),
      body: Column(children: <Widget>[
        // TeleprompterHead(),
        Expanded(
            child: Stack(children: [
          Container(
              margin: EdgeInsets.only(top: Adapt.px(95)),
              child: PullDownRefreshList()),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: TeleprompterHead(),
          )
        ])),
      ]),
    );
  }
}
