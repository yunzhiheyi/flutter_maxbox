// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_new, override_on_non_overriding_member, avoid_print, unused_import, avoid_unnecessary_containers, prefer_const_constructors, unnecessary_brace_in_string_interps

import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fengchao/bloc/global/bloc/global_bloc.dart';
import 'package:fengchao/model/home_content.dart';
import 'package:fengchao/utils/adApt.dart';
import 'dart:ui';
import 'package:android_window/main.dart' as android_window;

import '../router/Routes.dart';
import 'AnimatedDialog.dart';
import 'AppButton.dart';

class FriendCard extends StatefulWidget {
  const FriendCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final HomeContentViewModel data;
  @override
  FriendCardState createState() => FriendCardState();
}

class FriendCardState extends State<FriendCard> {
  double width = 0;
  double height = 0;
  double offsetX = 0;
  double offsetY = 0;
  double winWidth = window.physicalSize.width.toDouble();
  double winHeight = window.physicalSize.height.toDouble();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Routes.navigateTo(context, '/teleprompter/text', {'type': 'edit'},
              TransitionType.cupertino);
        },
        child: Container(
          height: Adapt.px(210),
          padding: EdgeInsets.fromLTRB(
              Adapt.px(20), Adapt.px(14), Adapt.px(24), Adapt.px(14)),
          margin:
              EdgeInsets.fromLTRB(Adapt.px(30), 0, Adapt.px(30), Adapt.px(30)),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            color: Color.fromARGB(255, 69, 69, 69),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Image.asset("assets/images/icon-text.png",
                      width: Adapt.px(32), height: Adapt.px(32)),
                  SizedBox(width: Adapt.px(20)),
                  Expanded(
                      flex: 1,
                      child: Text(
                        widget.data.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: Adapt.px(28),
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF9E9E9E),
                        ),
                      )),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      // 弹窗
                      showModalBottomSheet(
                          context: context,
                          barrierColor: Color.fromARGB(46, 209, 209, 209),
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return Container(
                                height: Adapt.px(405) + Adapt.padBotH(),
                                alignment: Alignment.topCenter,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(12.0))),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      AppButton(
                                          title: '编辑',
                                          height: 80,
                                          type: 'text',
                                          margin: EdgeInsets.all(0),
                                          fontSize: Adapt.px(28),
                                          fontColor:
                                              Color.fromARGB(255, 52, 52, 52),
                                          onTap: () {
                                            // Navigator.pop(context);
                                          }),
                                      Divider(
                                        color:
                                            Color.fromARGB(255, 216, 216, 216),
                                      ),
                                      AppButton(
                                          title: '放入回收站',
                                          height: 70,
                                          type: 'text',
                                          margin: EdgeInsets.all(0),
                                          fontSize: Adapt.px(28),
                                          fontColor:
                                              Color.fromARGB(255, 52, 52, 52),
                                          onTap: () {
                                            // Navigator.pop(context);
                                          }),
                                      Divider(
                                        color:
                                            Color.fromARGB(255, 216, 216, 216),
                                      ),
                                      AppButton(
                                        title: '删除',
                                        height: 70,
                                        type: 'text',
                                        margin: EdgeInsets.all(0),
                                        onTap: () {
                                          // AnimatedDialog().show(context);
                                          AnimatedDialog(
                                              height: Adapt.px(560),
                                              title: '删除提示',
                                              enableScrollInput: false,
                                              child: Container(
                                                  height: Adapt.px(80),
                                                  padding: EdgeInsets.only(
                                                      left: Adapt.px(40),
                                                      right: Adapt.px(40)),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    '确定要删除此条文本？',
                                                    style: TextStyle(
                                                        fontSize: Adapt.px(26)),
                                                  ))).show(context);
                                        },
                                        fontColor:
                                            Color.fromARGB(255, 219, 32, 32),
                                        fontSize: Adapt.px(28),
                                      ),
                                      Divider(
                                        color:
                                            Color.fromARGB(255, 216, 216, 216),
                                      ),
                                      AppButton(
                                          title: '取消',
                                          height: 70,
                                          type: 'text',
                                          margin: EdgeInsets.all(0),
                                          fontColor:
                                              Color.fromRGBO(135, 135, 135, 1),
                                          onTap: () {
                                            Navigator.pop(context);
                                          })
                                    ]));
                          });
                    },
                    child: Container(
                        padding: EdgeInsets.only(
                            right: Adapt.px(10), left: Adapt.px(30)),
                        child: Icon(Icons.more_horiz,
                            size: Adapt.px(44),
                            color: const Color(0xFFADADAD))),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: Adapt.px(15))),
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(
                      right: Adapt.px(95), bottom: Adapt.px(10)),
                  child: Text(
                    widget.data.content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Adapt.px(24),
                      color: const Color(0xFFFFFFFF),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.data.created_time,
                            style: TextStyle(
                              fontSize: Adapt.px(22),
                              color: const Color(0xFF9E9E9E),
                            )),
                        AppButton(
                            title: '提词',
                            type: 'gradient',
                            onTap: () {
                              width = 660;
                              height = 660;
                              offsetX = (winWidth - width).toDouble() / 2;
                              offsetY = 400;
                              if (Platform.isAndroid) {
                                android_window.open(
                                  size: Size(width, height),
                                  focusable: true,
                                  position: Offset(offsetX, offsetY),
                                );
                              } else {
                                print('IOS弹窗');
                              }
                            },
                            width: 90,
                            height: 40,
                            fontSize: Adapt.px(24),
                            padding: EdgeInsets.only(bottom: Adapt.px(4)),
                            margin: EdgeInsets.all(0),
                            radius: 40),
                      ])),
            ],
          ),
        ));
  }
}
