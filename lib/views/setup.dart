// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_new, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously, unused_import, avoid_unnecessary_containers, avoid_print, unnecessary_null_comparison, must_be_immutable, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_element

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:max_box/router/Routes.dart';
import 'package:max_box/utils/LocalStorage.dart';
//final demos = AppRoutes.getDemos();
import 'package:max_box/utils/adApt.dart';

import '../common/AppButton.dart';
import '../common/AppToBar.dart';
import '../common/IconText.dart';
import '../common/RowItem.dart';
import '../model/user.dart';
// import 'package:max_box/common/Myitem.dart';

class Setup extends StatefulWidget {
  Map<String, dynamic> params;
  Setup({
    Key? key,
    required this.params,
  }) : super(key: key);
  @override
  _SetupState createState() => new _SetupState();
}

class _SetupState extends State<Setup> {
  final List<UserUiModel> UserUiList = [
    const UserUiModel(
        id: 1,
        name: '用户协议',
        isH5: true,
        params: {
          'url': 'http://192.168.101.3:8081/jsBridge?isHome=true',
          'isAppBar': 'false',
          'title': '用户协议'
        },
        path: ''),
    const UserUiModel(
        id: 2,
        name: '隐私政策',
        isH5: true,
        params: {
          'url': 'http://192.168.101.3:8081/jsBridge?isHome=true',
          'isAppBar': 'false',
          'title': '隐私政策'
        },
        path: ''),
    const UserUiModel(
        id: 3,
        name: '用户付费协议',
        isH5: true,
        params: {
          'url': 'http://192.168.101.3:8081/jsBridge?isHome=true',
          'isAppBar': 'false',
          'title': '用户付费协议'
        },
        path: ''),
    const UserUiModel(
      id: 4,
      name: '账号注销',
      path: '/user/logout/account',
    ),
    const UserUiModel(
      id: 5,
      name: '当前版本',
      lastName: 'v1.0.0',
      isOnTap: true,
      path: '',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
      appBar: AppToBar(title: '系统设置'),
      body: _buildRowItem(),
    );
  }

  // 动态导入 Widget
  Widget _buildRowItem() {
    List<Widget> _RowItemList = [
      SizedBox(
        height: Adapt.px(25),
      )
    ];
    Widget _ColumnItem;
    for (var item in UserUiList) {
      _RowItemList.add(RowItem(
          data: item,
          onTap: (int id) {
            print(id);
          }));
    }
    _RowItemList.add(AppButton(
      title: '退出登录',
      onTap: () {
        print('退出登录');
      },
      margin: EdgeInsets.fromLTRB(Adapt.px(50), Adapt.px(85), Adapt.px(50), 0),
    ));
    _ColumnItem = Column(children: _RowItemList);
    return _ColumnItem;
  }
}
