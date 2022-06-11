// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_new, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously, unused_import, avoid_unnecessary_containers, avoid_print

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:max_box/router/Routes.dart';
import 'package:max_box/utils/LocalStorage.dart';
//final demos = AppRoutes.getDemos();
import 'package:max_box/utils/adApt.dart';

import '../common/IconText.dart';
// import 'package:max_box/common/Myitem.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => new _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    // final double topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
      body: Column(children: <Widget>[
        Stack(children: [
          Container(
              margin: EdgeInsets.only(
                  top: Adapt.padTopH() + Adapt.px(40), bottom: Adapt.px(40)),
              padding: EdgeInsets.only(
                left: Adapt.px(25),
              ),
              child: GridTileBar(
                leading: Image.asset("assets/images/icon-avatar.png",
                    width: Adapt.px(100), height: Adapt.px(100)),
                title: Padding(
                    padding: EdgeInsets.only(
                      left: Adapt.px(15),
                    ),
                    child: Text('Ta_ESESSD_001',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF), fontSize: Adapt.px(36)))),
                subtitle: Padding(
                    padding:
                        EdgeInsets.only(top: Adapt.px(15), left: Adapt.px(15)),
                    child: Text('177****3715',
                        style: TextStyle(
                            fontSize: Adapt.px(28), color: Color(0xFF9E9E9E)))),
              )),
          Positioned(
              top: Adapt.padTopH() + Adapt.px(64),
              right: Adapt.px(28),
              child: IconText(
                  direction: Axis.horizontal,
                  mod: modType.after,
                  title: '普通会员',
                  onTap: () {
                    print('普通会员');
                  },
                  fontSize: 24,
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: Adapt.px(24),
                    color: Color.fromARGB(255, 255, 255, 255),
                  )))
        ]),
        Container(
          width: Adapt.px(680),
          height: Adapt.px(180),
          margin:
              EdgeInsets.fromLTRB(Adapt.px(35), 0, Adapt.px(35), Adapt.px(25)),
          child: GestureDetector(
              onTap: () {
                Routes.navigateTo(context, '/webview', {
                  'url': 'http://192.168.101.3:8081/jsBridge?isHome=true',
                  'isAppBar': 'false',
                  'title': 'H5交互'
                });
              },
              child: ClipRRect(
                  child: Image.asset(
                "assets/images/icon-open-vip.png",
                fit: BoxFit.contain,
              ))),
        ),
        _buildItem(context, 'icon-my-1', '我的订单', '', '1'),
        _buildItem(context, 'icon-my-1', '我的时长', '5分钟', '1'),
        _buildItem(context, 'icon-my-1', '使用记录', '', '1'),
        _buildItem(context, 'icon-my-2', '邀请有礼', '送时长卡', '1'),
        Container(
            width: Adapt.px(680),
            height: Adapt.px(1),
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(
                Adapt.px(35), Adapt.px(38), Adapt.px(35), Adapt.px(25))),
        _buildItem(context, 'icon-my-3', '帮助中心', '', '1'),
        _buildItem(context, 'icon-my-4', '在线反馈', '', '1'),
        _buildItem(context, 'icon-my-5', '关于我们', 'v1.0.0', '1'),
      ]),
    );
  }

  Widget _buildItem(
    BuildContext context,
    String headIcon,
    String title,
    String lastTitle,
    String linkTo,
  ) =>
      Container(
          width: MediaQuery.of(context).size.width - Adapt.px(70),
          alignment: Alignment.center,
          height: Adapt.px(65),
          margin: EdgeInsets.fromLTRB(
              Adapt.px(35), Adapt.px(10), Adapt.px(35), Adapt.px(10)),
          child: GestureDetector(
              onTap: () {
                Routes.navigateTo(context, '/webview', {
                  'url': 'http://192.168.101.3:8081/jsBridge?isHome=true',
                  'isAppBar': 'true',
                  'title': 'H5交互'
                });
              },
              child: Row(
                children: <Widget>[
                  Image.asset(
                    // ignore: unnecessary_brace_in_string_interps
                    "assets/images/${headIcon}.png",
                    fit: BoxFit.contain,
                    width: Adapt.px(40),
                    height: Adapt.px(40),
                  ),
                  SizedBox(
                    width: Adapt.px(18),
                  ),
                  Expanded(
                      child: Text(title,
                          style: TextStyle(
                              fontSize: Adapt.px(28),
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  Padding(
                      padding: EdgeInsets.only(right: Adapt.px(10)),
                      child: Text(lastTitle,
                          style: TextStyle(
                              fontSize: Adapt.px(26),
                              color: headIcon == 'icon-my-2'
                                  ? Color.fromARGB(255, 226, 177, 42)
                                  : Color.fromARGB(255, 148, 148, 148)))),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: Adapt.px(30),
                    color: Color.fromARGB(255, 148, 148, 148),
                  ),
                ],
              )));
}
