// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_new, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously, unused_import, avoid_unnecessary_containers, avoid_print, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_element, unused_local_variable

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:max_box/model/user.dart';
import 'package:max_box/router/Routes.dart';
import 'package:max_box/utils/LocalStorage.dart';
//final demos = AppRoutes.getDemos();
import 'package:max_box/utils/adApt.dart';

import '../common/IconText.dart';
import '../common/RowItem.dart';
// import 'package:max_box/common/Myitem.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => new _UserState();
}

class _UserState extends State<User> {
  final List<UserUiModel> UserUiList = [
    const UserUiModel(
        id: 1,
        name: '我的订单',
        icon: 'icon-my-1',
        lastName: '',
        path: '/user/order',
        params: {'type': 'voice'}),
    const UserUiModel(
        id: 2,
        name: '我的时长',
        icon: 'icon-my-1',
        lastName: '5分钟',
        path: '/user/buy/duration'),
    const UserUiModel(
        id: 3,
        name: '分享有礼',
        icon: 'icon-my-2',
        lastName: '送时长卡',
        path: '/home/videotext',
        params: {'type': 'voice'}),
    const UserUiModel(
        id: 4,
        name: '帮助中心',
        icon: 'icon-my-3',
        path: '/home/videotext',
        params: {'type': 'voice'}),
    const UserUiModel(
        id: 5,
        name: '在线反馈',
        icon: 'icon-my-4',
        path: '/home/videotext',
        params: {'type': 'voice'}),
    const UserUiModel(
        id: 6,
        name: '系统设置',
        icon: 'icon-my-5',
        lastName: 'v1.0.0',
        path: '/user/setup'),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
          body: Column(children: <Widget>[
            Stack(children: [
              Container(
                  margin: EdgeInsets.only(
                      top: Adapt.padTopH() + Adapt.px(40),
                      bottom: Adapt.px(40)),
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
                                color: Color(0xFFFFFFFF),
                                fontSize: Adapt.px(36)))),
                    subtitle: Padding(
                        padding: EdgeInsets.only(
                            top: Adapt.px(15), left: Adapt.px(15)),
                        child: Text('177****3715',
                            style: TextStyle(
                                fontSize: Adapt.px(28),
                                color: Color(0xFF9E9E9E)))),
                  )),
              Positioned(
                  top: Adapt.padTopH() + Adapt.px(64),
                  right: Adapt.px(28),
                  child: IconText(
                      direction: Axis.horizontal,
                      mod: modType.after,
                      title: '普通会员',
                      onTap: () {
                        Routes.navigateTo(context, '/user/bug/members', {},
                            TransitionType.cupertino);
                      },
                      fontSize: 24,
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: Adapt.px(24),
                        color: Color.fromARGB(255, 255, 255, 255),
                      )))
            ]),
            Container(
              margin: EdgeInsets.fromLTRB(
                  Adapt.px(35), 0, Adapt.px(35), Adapt.px(25)),
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
            _buildRowItem(3),
          ]),
        ));
  }

  Widget _buildRowItem(int? lineIndex) {
    List<Widget> _RowItemList = [];
    Widget _ColumnItem;
    for (var item in UserUiList) {
      _RowItemList.add(RowItem(data: item));
    }
    if (lineIndex != null) {
      _RowItemList.insert(
          lineIndex,
          Container(
              height: Adapt.px(1),
              color: Color(0xFFCBCACA),
              margin: EdgeInsets.fromLTRB(
                  Adapt.px(40), Adapt.px(25), Adapt.px(40), Adapt.px(25))));
    }
    _ColumnItem = Column(children: _RowItemList);
    return _ColumnItem;
  }
}
