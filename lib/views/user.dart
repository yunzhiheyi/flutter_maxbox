// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_new, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously, unused_import

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:max_box/router/Routes.dart';
import 'package:max_box/utils/LocalStorage.dart';
//final demos = AppRoutes.getDemos();
import 'package:max_box/utils/adApt.dart';
// import 'package:max_box/common/Myitem.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => new _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final double topPadding = MediaQuery.of(context).padding.top;
    return new Scaffold(
      backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
      body: Wrap(direction: Axis.vertical, children: <Widget>[
        Row(
          children: <Widget>[
            Container(
                width: Adapt.px(120),
                height: Adapt.px(120),
                margin: EdgeInsets.fromLTRB(
                    Adapt.px(35), Adapt.px(80 + topPadding), Adapt.px(35), 0),
                child: Image.asset("assets/images/icon-avatar.png",
                    width: Adapt.px(120), height: Adapt.px(120))),
            Wrap(direction: Axis.vertical, children: <Widget>[
              Container(
                  margin:
                      EdgeInsets.fromLTRB(0, Adapt.px(110), 0, Adapt.px(15)),
                  child: Text('177****3715',
                      style: TextStyle(
                          fontSize: Adapt.px(34), color: Colors.white))),
              Image.asset(
                "assets/images/icon-vip.png",
                width: Adapt.px(138),
              ),
            ]),
          ],
        ),
        Container(
          width: Adapt.px(680),
          height: Adapt.px(180),
          margin: EdgeInsets.fromLTRB(
              Adapt.px(35), Adapt.px(28), Adapt.px(35), Adapt.px(35)),
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
        _buildItem(context, 'icon-my-1', '会员中心', '', '1'),
        _buildItem(context, 'icon-my-2', '邀请有礼', '送VIP会员', '1'),
        Container(
            width: Adapt.px(680),
            height: Adapt.px(1),
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(
                Adapt.px(35), Adapt.px(38), Adapt.px(35), Adapt.px(25))),
        _buildItem(context, 'icon-my-3', '帮助中心', '', '1'),
        _buildItem(context, 'icon-my-4', '在线反馈', '', '1'),
        _buildItem(context, 'icon-my-5', '关于我们', 'v1.0.0', '1'),
        // Container(
        //   margin:
        //       EdgeInsets.fromLTRB(Adapt.px(45), Adapt.px(35), Adapt.px(45), 0),
        //   child: RawMaterialButton(
        //     elevation: 1,
        //     fillColor: Color.fromARGB(255, 224, 224, 222),
        //     splashColor: Colors.blue,
        //     textStyle: TextStyle(color: Colors.black),
        //     onLongPress: () => debugPrint('onLongPress'),
        //     child: Text('退出', style: TextStyle(fontSize: Adapt.px(34))),
        //     constraints: BoxConstraints(
        //         minHeight: Adapt.px(90), minWidth: Adapt.px(670)),
        //     onPressed: () async {
        //       // 移除Token和用户信息
        //       await LocalStorage.remove(LocalStorage.accessTokenKey);
        //       await LocalStorage.remove(LocalStorage.userInfoKey);
        //       Routes.navigateTo(
        //           context, '/login', {}, TransitionType.inFromBottom);
        //     },
        //     shape: StadiumBorder(), // 圆角
        //   ),
        // ),
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
                  Text(lastTitle,
                      style: TextStyle(
                          fontSize: Adapt.px(28),
                          color: headIcon == 'icon-my-2'
                              ? Color.fromARGB(255, 226, 177, 42)
                              : Color.fromARGB(255, 148, 148, 148))),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: Adapt.px(30),
                    color: Color.fromARGB(255, 148, 148, 148),
                  ),
                ],
              )));
}
