// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, must_call_super, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_update/azhon_app_update.dart';
import 'package:flutter_app_update/update_model.dart';
import 'package:fengchao/bloc/global/bloc/global_bloc.dart';
import 'package:fengchao/common/UpgradeDialog.dart';
import 'package:fengchao/common/topAppBar.dart';
// import 'package:fengchao/common/PullDownRefreshList.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_platform/universal_platform.dart';

import '../common/DoubleTapBackExitApp.dart';
import '../common/HomeContentRow.dart';
import '../common/HomeContentColumn.dart';
import '../common/HomeSwiper.dart';
import '../utils/adApt.dart';

class HomeIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: BlocProvider(create: (_) => GlobalBloc(), child: HomeDada()));
  }
}

class HomeDada extends StatefulWidget {
  HomeDada({
    Key? key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => HomeDadaState();
}

class HomeDadaState extends State<HomeDada>
    with SingleTickerProviderStateMixin {
  late final ScrollController scrollController;
  late Timer timePlay;
  UpdateModel model = UpdateModel(
    'https://conversion.maxbox.com.cn',
    "flutterUpdate.apk",
    "ic_launcher",
    "1.支持Android M N O P Q\n2.支持自定义下载过程\n3.支持 设备>=Android M 动态权限的申请\n4.支持通知栏进度条展示\n5.支持文字国际化",
  );
  @override
  void initState() {
    scrollController = ScrollController();
    timePlay = Timer(Duration(milliseconds: 200), () {
      UpgradeDialog(
              height: Adapt.px(UniversalPlatform.isAndroid ? 1760 : 1460),
              confirmTitle: '立即升级',
              onConfirm: () {
                AzhonAppUpdate.update(model).then((value) => print(value));
              },
              enableScrollInput: false)
          .show(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
    timePlay.cancel();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
          body: Column(children: <Widget>[
            topAppBar(),
            HomeSwiper(),
            HomeContentRow(),
            Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  child: HomeContentColumn(),
                ))
          ]),
        ));
  }
}
