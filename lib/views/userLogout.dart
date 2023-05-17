// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_new, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously, unused_import, avoid_unnecessary_containers, avoid_print, unnecessary_null_comparison, must_be_immutable, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_element

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fengchao/router/Routes.dart';
import 'package:fengchao/utils/LocalStorage.dart';
//final demos = AppRoutes.getDemos();
import 'package:fengchao/utils/adApt.dart';

import '../common/AppButton.dart';
import '../common/AppToBar.dart';
import '../common/IconText.dart';
import '../common/LogoutPrivacy.dart';
import '../common/RowItem.dart';
import '../model/user.dart';
// import 'package:fengchao/common/Myitem.dart';

class UserLogout extends StatefulWidget {
  Map<String, dynamic> params;
  UserLogout({
    Key? key,
    required this.params,
  }) : super(key: key);
  @override
  _UserLogoutState createState() => new _UserLogoutState();
}

class _UserLogoutState extends State<UserLogout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
      appBar: AppToBar(title: '账号注销'),
      body: Column(children: [
        Container(
            margin: EdgeInsets.fromLTRB(
                Adapt.px(36), Adapt.px(16), Adapt.px(36), Adapt.px(36)),
            padding: EdgeInsets.only(
                top: Adapt.px(10),
                right: Adapt.px(20),
                left: Adapt.px(20),
                bottom: Adapt.px(16)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                color: Color.fromARGB(255, 62, 61, 61),
                border: Border.all(
                    color: Color.fromARGB(255, 141, 141, 141), width: 0.5)),
            child: Text('账号一量注销将无法登录视频转码，且所有的数据将无法找回，请你谨慎操作',
                style: TextStyle(
                    fontSize: Adapt.px(26),
                    height: 1.6,
                    color: Color(0xFFBDBDBD)))),
        Container(
            margin: EdgeInsets.fromLTRB(
                Adapt.px(36), Adapt.px(16), Adapt.px(36), Adapt.px(10)),
            alignment: Alignment.centerLeft,
            child: Text('1、账号内处于安全状态',
                style: TextStyle(fontSize: Adapt.px(28), color: Colors.white))),
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(
                Adapt.px(36), 0, Adapt.px(36), Adapt.px(10)),
            child: Text('账号注销的前提是你的账号没有被盗、被封和违规等风险。',
                style: TextStyle(
                    fontSize: Adapt.px(24), color: Color(0xFFBDBDBD)))),
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(
                Adapt.px(36), Adapt.px(16), Adapt.px(36), Adapt.px(10)),
            child: Text('2、账号内的已创建内容将被清除',
                style: TextStyle(fontSize: Adapt.px(28), color: Colors.white))),
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(
                Adapt.px(36), 0, Adapt.px(36), Adapt.px(10)),
            child: Text(
                '账号注销后，会清空账号所有的身份信息和账号信息：包括但不限于用户名、认证和密保手机号、微信，以及接触该账号对外授权的绑定关系。该操作不可逆，请谨慎操作。',
                style: TextStyle(
                    fontSize: Adapt.px(24),
                    height: 1.6,
                    color: Color(0xFFBDBDBD)))),
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(
                Adapt.px(36), Adapt.px(16), Adapt.px(36), Adapt.px(10)),
            child: Text('3、账号内的权益将被清除',
                style: TextStyle(fontSize: Adapt.px(28), color: Colors.white))),
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(
                Adapt.px(36), 0, Adapt.px(36), Adapt.px(10)),
            child: Text('会员权益等将被清除且无法恢复。',
                style: TextStyle(
                    fontSize: Adapt.px(24), color: Color(0xFFBDBDBD)))),
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(
                Adapt.px(36), Adapt.px(16), Adapt.px(36), Adapt.px(10)),
            child: Text('4、相关平台的同一账号被注销',
                style: TextStyle(fontSize: Adapt.px(28), color: Colors.white))),
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(
                Adapt.px(36), 0, Adapt.px(36), Adapt.px(10)),
            child: Text('与蜜蜂转码相关的数据将一并进行注销。',
                style: TextStyle(
                    fontSize: Adapt.px(24), color: Color(0xFFBDBDBD)))),
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(
                Adapt.px(36), Adapt.px(66), Adapt.px(36), Adapt.px(26)),
            child: LogoutPrivacy()),
        AppButton(
            title: '确认注销',
            type: 'gradient',
            onTap: () {
              print('重新购买');
            },
            // width: 104,
            fontSize: Adapt.px(28),
            padding: EdgeInsets.fromLTRB(Adapt.px(10), 0, Adapt.px(10), 0),
            margin: EdgeInsets.only(top: Adapt.px(10)),
            radius: 32)
      ]),
    );
  }
}
