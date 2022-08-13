// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors, unused_import, avoid_unnecessary_containers, must_call_super, prefer_const_literals_to_create_immutables, avoid_print, unused_element, use_build_context_synchronously, unused_local_variable, must_be_immutable, file_names, unused_field, non_constant_identifier_names

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:max_box/common/AppButton.dart';
import 'package:max_box/utils/adApt.dart';

import '../common/AppToBar.dart';
import '../common/IconText.dart';
import '../common/ItemRecordDetails.dart';
import '../router/Routes.dart';
import 'RealRulerView.dart';

class PictureDetails extends StatefulWidget {
  Map<String, dynamic> params;
  PictureDetails({
    Key? key,
    required this.params,
  }) : super(key: key);
  @override
  _PictureDetailsState createState() => _PictureDetailsState();
}

class _PictureDetailsState extends State<PictureDetails> {
  late TextEditingController _ContentEditController;
  late Future<void> _initializeVideoPlayerFuture;
  late String content = '';

  late int groupValue = 0;
  bool isCFocus = false;
  bool isCollapse = false;
  bool isReadOnly = true;
  @override
  void initState() {
    super.initState();
    _ContentEditController = TextEditingController();
    _ContentEditController.text =
        '中国传统文化讲究节日团圆，到了春节，就更期待一家人聚在一起热热闹闹的吃饭啦,中国传统文化讲究节日团圆，到了春节，就更期待一家人聚在一起热热闹闹的吃饭啦。中国传统文化讲究节日团圆，到了春节，就更期待一家人聚在一起热热闹闹的吃饭啦。中国传统文化讲究节日团圆，到了春节，就更期待一家人聚在一起热热闹闹的吃饭啦。';
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
        backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
        appBar: AppToBar(title: '图片转换详情'),
        body: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  color: Color(0xFF373737),
                ),
                margin: EdgeInsets.all(Adapt.px(30)),
                alignment: Alignment.center,
                child: Stack(children: [
                  Container(
                      height: Adapt.px(830),
                      padding: EdgeInsets.only(
                          left: Adapt.px(30),
                          right: Adapt.px(30),
                          top: Adapt.px(18)),
                      child: Focus(
                          onFocusChange: (hasFocus) {
                            setState(() {
                              isCFocus = hasFocus;
                              if (!hasFocus) {
                                content = _ContentEditController.text;
                              }
                            });
                          },
                          child: TextField(
                            controller: _ContentEditController,
                            onChanged: (val) {
                              setState(() {
                                content = _ContentEditController.text;
                              });
                            },
                            readOnly: isReadOnly,
                            //限制长度
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            onSubmitted: (val) {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            // autofocus: true,
                            maxLines: 4,
                            maxLength: 200,
                            style: TextStyle(
                                fontSize: Adapt.px(28),
                                height: Adapt.px(3),
                                color: Color.fromARGB(255, 255, 255, 255)),
                            decoration: InputDecoration(
                              counterText: '',
                              counterStyle: TextStyle(color: Colors.grey),
                              // contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                              focusColor: Color.fromARGB(255, 255, 255, 255),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 1),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(0, 32, 31, 31)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0x00000000)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              // hintText: '复制粘贴短视频链接或直接输入',
                              // // suffixText: '${title.length}/30',
                              // // suffixStyle: TextStyle(color: Colors.grey),
                              // hintStyle: TextStyle(
                              //     fontSize: Adapt.px(28), color: Colors.grey),
                              // hintMaxLines: 1
                            ),
                          ))),
                ])),
            Container(
                margin: EdgeInsets.fromLTRB(
                    Adapt.px(30), 0, Adapt.px(30), Adapt.padBotH()),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                    child: AppButton(
                      title: '去配音',
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
                  AppButton(
                    title: '复制',
                    width: 200,
                    color: Color(0xFF048748),
                    borderColor: Color(0xFF048748),
                    margin: EdgeInsets.only(
                        top: Adapt.px(36), bottom: Adapt.px(30)),
                    onTap: () {
                      print('复制');
                    },
                  )
                ]))
          ],
        ));
  }
}
