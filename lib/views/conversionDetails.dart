// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors, unused_import, avoid_unnecessary_containers, must_call_super, prefer_const_literals_to_create_immutables, avoid_print, unused_element, use_build_context_synchronously, unused_local_variable, must_be_immutable, file_names

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

class ConversionDetails extends StatefulWidget {
  Map<String, dynamic> params;
  ConversionDetails({
    Key? key,
    required this.params,
  }) : super(key: key);
  @override
  _ConversionDetailsState createState() => _ConversionDetailsState();
}

class _ConversionDetailsState extends State<ConversionDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
        backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
        appBar: AppToBar(title: '转换记录'),
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
                        child: Wrap(direction: Axis.vertical, children: [
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
                                color: Color.fromARGB(255, 152, 151, 151)),
                          )),
                      AppButton(
                          title: '保存音频',
                          type: 'gradient',
                          onTap: () {
                            print('IOS弹窗');
                          },
                          width: 120,
                          height: 36,
                          fontSize: Adapt.px(20),
                          margin: EdgeInsets.only(
                              top: Adapt.px(6), left: 0, right: 0, bottom: 0),
                          radius: 40),
                    ]))
                  ],
                )),
            Expanded(
                child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      color: Color(0xFF373737),
                    ),
                    margin: EdgeInsets.all(Adapt.px(30)),
                    alignment: Alignment.center,
                    child: Stack(children: [
                      Container(
                          width: double.infinity,
                          height: double.infinity,
                          margin: EdgeInsets.only(
                              top: Adapt.px(30), bottom: Adapt.px(30)),
                          child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              child: Column(children: [
                                ItemRecordDetails(
                                  title: '地球之错，一次是遇见',
                                ),
                                ItemRecordDetails(
                                  title: '那是代表多想你',
                                ),
                                ItemRecordDetails(
                                  title:
                                      '今天啊我用80万账号来给大家做一条完整的视频分享，这条视频有点长，我不带货也是做其他的，我不带货也是做其他的',
                                ),
                                ItemRecordDetails(
                                  title:
                                      '测试测试测试测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试',
                                ),
                                ItemRecordDetails(
                                  title:
                                      '测试测试测试测测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试试',
                                ),
                                ItemRecordDetails(
                                  title: '测试测试测试测测试测试测试测试测试测试测试测试测试测试测试测试试',
                                ),
                                ItemRecordDetails(
                                  title: '测试测试测试测试',
                                )
                              ]))),
                      Positioned(
                          right: 12,
                          top: 0,
                          bottom: 0,
                          child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  top: Adapt.px(30), bottom: Adapt.px(30)),
                              child: Transform.rotate(
                                  alignment: Alignment.center,
                                  //旋转的倍数
                                  angle: 3.142,
                                  //旋转的子Widget
                                  child: RulerWidget(
                                    onChanged: (double dx) {
                                      print("当前刻度值是${dx / 5}");
                                    },
                                  ))))
                    ]))),
            Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF373737),
                ),
                alignment: Alignment.center,
                // height: Adapt.px(120),
                padding: EdgeInsets.only(
                    bottom: Adapt.padBotH() + Adapt.px(14), top: Adapt.px(14)),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: IconText(
                              icon: Icon(
                                Icons.delete,
                                size: Adapt.px(48),
                                color: Color(0xFF787878),
                              ),
                              title: '删除',
                              color: Color(0xFF787878),
                              onTap: () {
                                print('删除');
                              },
                              direction: Axis.vertical)),
                      Expanded(
                          child: IconText(
                              icon: Icon(
                                Icons.text_snippet_sharp,
                                size: Adapt.px(42),
                                color: Color(0xFF787878),
                              ),
                              title: '全文展示',
                              color: Color(0xFF787878),
                              onTap: () {
                                print('全文展示');
                              },
                              direction: Axis.vertical)),
                      Expanded(
                          child: IconText(
                              icon: Icon(
                                Icons.copy,
                                size: Adapt.px(42),
                                color: Color(0xFF787878),
                              ),
                              title: '复制文本',
                              color: Color(0xFF787878),
                              onTap: () {
                                print('复制文本');
                              },
                              direction: Axis.vertical)),
                      Expanded(
                          child: IconText(
                              icon: Icon(
                                Icons.workspaces,
                                size: Adapt.px(42),
                                color: Color(0xFF787878),
                              ),
                              title: '导出文档',
                              onTap: () {
                                print('导出文档');
                              },
                              color: Color(0xFF787878),
                              direction: Axis.vertical)),
                    ]))
          ],
        ));
  }
}
