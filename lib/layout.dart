import 'package:flutter/material.dart';
import 'package:max_box/views/home.dart';
import 'package:max_box/views/user.dart';
import 'package:max_box/utils/adApt.dart';
import 'package:max_box/common/HomeSheetTools.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:universal_platform/universal_platform.dart';
// import 'dart:io';

class Layout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LayoutState();
  }
}

class _LayoutState extends State<Layout> {
  int _currentIndex = 0;
  final List<Widget> _children = [new HomeIndex(), new User()];

  Color getColor(int value) {
    return this._currentIndex == value
        ? Theme.of(context).cardColor
        : Color(0XFF000000);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    // ignore: unused_element
    Color getColor(int value) {
      return _currentIndex == value
          ? const Color(0XFF000000)
          : const Color(0XFFcccccc);
    }

    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: Container(
            padding: EdgeInsets.fromLTRB(
                0,
                Adapt.px(8),
                0,
                UniversalPlatform.isAndroid
                    ? Adapt.px(8)
                    : Adapt.px(bottomPadding + 8)),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    offset: Offset(5.0, 5.0),
                    blurRadius: 15.0,
                    spreadRadius: 2.0)
              ],
            ),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          print('_currentIndex$_currentIndex');
                          _currentIndex = 0;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/${_currentIndex == 0 ? 'icon-home-active' : 'icon-home'}.png",
                            width: Adapt.px(54),
                            height: Adapt.px(54),
                          ),
                          // Text("首页",
                          //     style: TextStyle(
                          //         color: getColor(0), fontSize: Adapt.px(24)))
                        ],
                      )),
                  GestureDetector(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          HomeSheetTools(),
                                          Expanded(
                                              child: GestureDetector(
                                            onTap: () =>
                                                {Navigator.pop(context)},
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
                            margin: EdgeInsets.fromLTRB(
                                0, Adapt.px(8), 0, Adapt.px(8)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(251, 177, 17, 0.4),
                                    blurRadius: 8.0,
                                    spreadRadius: 1.0)
                              ],
                              color: const Color.fromRGBO(251, 177, 17, 1),
                            ),
                            child: Icon(
                              Icons.add,
                              size: Adapt.px(52),
                              color: Colors.white,
                            ),
                          )
                        ],
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                              "assets/images/icon-user${_currentIndex == 1 ? '-active' : ''}.png",
                              width: Adapt.px(52),
                              height: Adapt.px(52)),
                          // Text("我的",
                          //     style: TextStyle(
                          //         fontSize: Adapt.px(24), color: getColor(1)))
                        ],
                      ))
                ])));
  }
}
