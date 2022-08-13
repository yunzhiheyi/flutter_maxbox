// ignore_for_file: library_private_types_in_public_api, file_names, prefer_const_constructors, unnecessary_const, unused_local_variable, avoid_unnecessary_containers, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import '../utils/adApt.dart';
import 'DialogLayout.dart';

class UpgradeDialog {
  final VoidCallback? onConfirm;
  final String? title;
  final double? width;
  final double? height;
  final String? confirmTitle;
  final bool enableScrollInput;
  const UpgradeDialog({
    Key? key,
    this.onConfirm,
    this.title,
    this.width,
    this.height,
    this.confirmTitle,
    this.enableScrollInput = true,
  });
  show(BuildContext context) {
    return showAnimatedDialog(
        context: context,
        animationType: DialogTransitionType.scale,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 500),
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                alignment: Alignment.center,
                child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        color: Colors.transparent,
                        // color: Colors.white,
                        image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image: ExactAssetImage(
                                'assets/images/icon-upgrade.png'),
                            fit: BoxFit.fitWidth)),
                    alignment: Alignment.center,
                    width: Adapt.px(width ?? 500),
                    height: Adapt.px(height ?? 300),
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: Adapt.px(290), bottom: Adapt.px(30)),
                                child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(18.0),
                                          bottomRight: Radius.circular(18.0)),
                                    ),
                                    child: DialogLayout(
                                        confirmTitle: confirmTitle,
                                        enableScrollInput: enableScrollInput,
                                        onConfirm: () {
                                          onConfirm?.call();
                                        },
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          height: Adapt.px(350),
                                          margin: EdgeInsets.only(
                                              left: Adapt.px(30),
                                              right: Adapt.px(30)),
                                          // ignore: prefer_const_literals_to_create_immutables
                                          child: Column(children: [
                                            Container(
                                                alignment: Alignment.topLeft,
                                                margin: EdgeInsets.only(
                                                    left: Adapt.px(20),
                                                    right: Adapt.px(20),
                                                    bottom: Adapt.px(10)),
                                                // ignore: prefer_const_literals_to_create_immutables
                                                child: Text.rich(
                                                    TextSpan(children: [
                                                  TextSpan(
                                                      text: '版本更新',
                                                      style: TextStyle(
                                                          fontSize:
                                                              Adapt.px(30),
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  TextSpan(
                                                      text: '  v1.0.1  ',
                                                      style: TextStyle(
                                                        fontSize: Adapt.px(24),
                                                      )),
                                                  TextSpan(
                                                      text: '包大小: 20m',
                                                      style: TextStyle(
                                                        fontSize: Adapt.px(24),
                                                      ))
                                                ]))),
                                            Expanded(
                                                flex: 1,
                                                child: SingleChildScrollView(
                                                  reverse: false,
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: Column(children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      padding: EdgeInsets.only(
                                                          top: Adapt.px(10),
                                                          left: Adapt.px(25),
                                                          right: Adapt.px(25)),
                                                      child: Text(
                                                          '1、支持自定义下载过程;\n2、支持 设备>=Android M 动态权限的申请;\n3、支持 设备>=Android M 动态权限的申请,支持通知栏进度条展示;\n4、支持 设备>=Android M 动态权限的申请,支持通知栏进度条展示;\n5、支持 设备>=Android M 动态权限的申请,支持通知栏进度条展示',
                                                          style: TextStyle(
                                                            height: 1.6,
                                                            fontSize:
                                                                Adapt.px(24),
                                                          )),
                                                    ),
                                                  ]),
                                                )),
                                          ]),
                                        ))))),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                width: Adapt.px(50),
                                height: Adapt.px(50),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.close_sharp,
                                  size: Adapt.px(34),
                                  color: Colors.black,
                                )))
                      ],
                    )),
              ));
        });
  }
}
