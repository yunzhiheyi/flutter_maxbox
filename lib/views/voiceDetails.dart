// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors, unused_import, avoid_unnecessary_containers, must_call_super, prefer_const_literals_to_create_immutables, avoid_print, unused_element, use_build_context_synchronously, unused_local_variable, must_be_immutable, file_names, sized_box_for_whitespace

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:fengchao/common/AppButton.dart';
import 'package:fengchao/utils/adApt.dart';

import '../common/AppToBar.dart';
import '../common/IconText.dart';
import '../common/ItemRecordDetails.dart';
import '../router/Routes.dart';
import 'RealRulerView.dart';

class VoiceDetails extends StatefulWidget {
  Map<String, dynamic> params;
  VoiceDetails({
    Key? key,
    required this.params,
  }) : super(key: key);
  @override
  _VoiceDetailsState createState() => _VoiceDetailsState();
}

class _VoiceDetailsState extends State<VoiceDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
        backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
        appBar: AppToBar(title: '提取记录'),
        body: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  color: Color(0xFF373737),
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: Adapt.px(30), right: Adapt.px(30), top: Adapt.px(10)),
                padding: EdgeInsets.all(Adapt.px(25)),
                child: Row(
                  children: [
                    Container(
                        child: Image.asset(
                      "assets/images/icon-v.png",
                      width: Adapt.px(125),
                      height: Adapt.px(125),
                    )),
                    SizedBox(width: Adapt.px(20)),
                    Expanded(
                        child: Stack(
                      children: [
                        Wrap(direction: Axis.vertical, children: [
                          Text(
                            '测试视频.mp4',
                            style: TextStyle(
                                fontSize: Adapt.px(26), color: Colors.white),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: Adapt.px(10), bottom: Adapt.px(8)),
                              child: Text(
                                '时长：00:06:25',
                                style: TextStyle(
                                    fontSize: Adapt.px(22),
                                    color: Color(0xFF989797)),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: Adapt.px(10)),
                              width: Adapt.px(490),
                              height: Adapt.px(12),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0)),
                                child: LinearProgressIndicator(
                                  value: 0.3,
                                  backgroundColor: Color(0xFF494949),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xFF7099FF)),
                                ),
                              ))
                        ]),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: AppButton(
                              title: '保存音频',
                              type: 'gradient',
                              onTap: () {
                                print('IOS弹窗');
                              },
                              width: 120,
                              height: 36,
                              fontSize: Adapt.px(20),
                              margin: EdgeInsets.only(
                                  top: Adapt.px(6),
                                  left: 0,
                                  right: 0,
                                  bottom: 0),
                              radius: 40),
                        )
                      ],
                    ))
                  ],
                )),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  left: Adapt.px(36), top: Adapt.px(36), right: Adapt.px(36)),
              child: Text('备注：复制连接可在手机或电脑浏览器里直接下载',
                  style: TextStyle(
                      fontSize: Adapt.px(24),
                      color: Color.fromARGB(255, 170, 170, 170))),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(Adapt.px(30), 0, Adapt.px(30), 0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                    child: AppButton(
                      title: '复制音频地址',
                      type: 'gradient',
                      margin: EdgeInsets.only(
                          top: Adapt.px(36),
                          bottom: Adapt.px(30),
                          right: Adapt.px(36)),
                      onTap: () {
                        print('去配音');
                      },
                    ),
                  ),
                  Expanded(
                      child: AppButton(
                    title: '提取音频文字',
                    color: Color(0xFF048748),
                    borderColor: Color(0xFF048748),
                    margin: EdgeInsets.only(
                        top: Adapt.px(36), bottom: Adapt.px(30)),
                    onTap: () {
                      print('提取音频文字');
                    },
                  ))
                ]))
          ],
        ));
  }
}
