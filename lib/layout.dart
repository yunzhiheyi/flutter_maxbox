// ignore_for_file: unnecessary_new, prefer_const_constructors, unused_import, avoid_print, use_key_in_widget_constructors

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fengchao/views/home.dart';
import 'package:fengchao/views/user.dart';
import 'package:fengchao/utils/adApt.dart';
import 'package:fengchao/common/HomeSheetTools.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:universal_platform/universal_platform.dart';
import 'bloc/global/bloc/global_bloc.dart';
import 'common/DoubleTapBackExitApp.dart';
import 'common/HomeButtonAmin.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: BlocProvider(create: (_) => GlobalBloc(), child: LayoutData()));
  }
}

class LayoutData extends StatefulWidget {
  const LayoutData({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _LayoutDataState();
  }
}

class _LayoutDataState extends State<LayoutData> {
  int _currentIndex = 0;
  final List<Widget> _children = [HomeIndex(), User()];
  double winWidth = window.physicalSize.width.toDouble();
  double winHeight = window.physicalSize.height.toDouble();
  Color getColor(int value) {
    return _currentIndex == value
        ? Theme.of(context).cardColor
        : const Color(0XFF000000);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("AdidChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    // double bottomPadding = MediaQuery.of(context).padding.bottom;
    // double topPadding = MediaQuery.of(context).padding.bottom;

    // ignore: unused_element
    Color getColor(int value) {
      return _currentIndex == value
          ? const Color(0XFF000000)
          : const Color(0XFFcccccc);
    }

    return DoubleTapBackExitApp(
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
            body: _children[_currentIndex],
            bottomNavigationBar: Container(
                padding: EdgeInsets.fromLTRB(
                    0,
                    Adapt.px(6),
                    0,
                    UniversalPlatform.isAndroid
                        ? Adapt.px(8)
                        : Adapt.px(Adapt.padBotH() + 6)),
                // decoration: const BoxDecoration(
                //   boxShadow: [
                //     BoxShadow(
                //         color: Color.fromRGBO(0, 0, 0, 0.1),
                //         offset: Offset(5.0, 5.0),
                //         blurRadius: 15.0,
                //         spreadRadius: 2.0)
                //   ],
                // ),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = 0;
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.home,
                                size: Adapt.px(62),
                                color: _currentIndex == 0
                                    ? Colors.white
                                    : Color.fromARGB(255, 148, 148, 148),
                              )
                              // Image.asset(
                              //   "assets/images/${_currentIndex == 0 ? 'icon-home-active' : 'icon-home'}.png",
                              //   width: Adapt.px(54),
                              //   height: Adapt.px(54),
                              // ),
                              // Text("首页",
                              //     style: TextStyle(
                              //         color: getColor(0), fontSize: Adapt.px(24)))
                            ],
                          )),
                      HomeButtonAmin(),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = 1;
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.person,
                                size: Adapt.px(62),
                                color: _currentIndex == 1
                                    ? Colors.white
                                    : Color.fromARGB(255, 148, 148, 148),
                              )
                              // Image.asset(
                              //     "assets/images/icon-user${_currentIndex == 1 ? '-active' : ''}.png",
                              //     width: Adapt.px(52),
                              //     height: Adapt.px(52)),
                              // Text("我的",
                              //     style: TextStyle(
                              //         fontSize: Adapt.px(24), color: getColor(1)))
                            ],
                          ))
                    ]))));
  }
}
