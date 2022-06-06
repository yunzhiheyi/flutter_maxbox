// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member, unused_local_variable, unnecessary_new, unused_field, prefer_final_fields, must_be_immutable, no_leading_underscores_for_local_identifiers, prefer_const_constructors_in_immutables, library_private_types_in_public_api, no_logic_in_create_state, unnecessary_this, unnecessary_brace_in_string_interps, unused_element, prefer_const_constructors

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:max_box/utils/adApt.dart';

import '../router/Routes.dart';

class HomeContentColumn extends StatefulWidget {
  const HomeContentColumn({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeContentColumnState();
}

class HomeContentColumnState extends State<HomeContentColumn>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(Adapt.px(20), 0, Adapt.px(20), Adapt.px(20)),
      child: Column(children: <Widget>[
        Stack(children: <Widget>[
          GestureDetector(
              onTap: () => {
                    Routes.navigateTo(
                        context, '/videotext', {}, TransitionType.cupertino)
                  },
              child: Container(
                  height: Adapt.px(160),
                  padding: EdgeInsets.fromLTRB(
                      Adapt.px(30), Adapt.px(24), Adapt.px(24), Adapt.px(24)),
                  margin: EdgeInsets.fromLTRB(
                      Adapt.px(20), 0, Adapt.px(20), Adapt.px(40)),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    color: Color.fromARGB(255, 69, 69, 69),
                  ),
                  child: Row(children: [
                    Icon(Icons.cameraswitch,
                        size: Adapt.px(42), color: const Color(0xFFFFFFFF)),
                    Expanded(
                        flex: 1,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.fromLTRB(
                                      Adapt.px(24), 0, 0, 0),
                                  child: Text(
                                    '视频提取文字',
                                    style: TextStyle(
                                      fontSize: Adapt.px(28),
                                      color: const Color(0xFFFFFFFF),
                                    ),
                                  )),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.fromLTRB(
                                      Adapt.px(24), 0, 0, 0),
                                  child: Text(
                                    '自动识别音视频语音并转为文字',
                                    style: TextStyle(
                                      fontSize: Adapt.px(24),
                                      color: const Color(0xFF9E9E9E),
                                    ),
                                  ))
                            ])),
                  ]))),
        ]),
        Stack(children: <Widget>[
          GestureDetector(
              onTap: () => {
                    Routes.navigateTo(
                        context, '/login', {}, TransitionType.inFromBottom)
                  },
              child: Container(
                  height: Adapt.px(160),
                  padding: EdgeInsets.fromLTRB(
                      Adapt.px(30), Adapt.px(24), Adapt.px(24), Adapt.px(24)),
                  margin: EdgeInsets.fromLTRB(
                      Adapt.px(20), 0, Adapt.px(20), Adapt.px(40)),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    color: Color.fromARGB(255, 69, 69, 69),
                  ),
                  child: Row(children: [
                    Icon(Icons.cameraswitch,
                        size: Adapt.px(42), color: const Color(0xFFFFFFFF)),
                    Expanded(
                        flex: 1,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.fromLTRB(
                                      Adapt.px(24), 0, 0, 0),
                                  child: Text(
                                    '视频提取语音',
                                    style: TextStyle(
                                      fontSize: Adapt.px(28),
                                      color: const Color(0xFFFFFFFF),
                                    ),
                                  )),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.fromLTRB(
                                      Adapt.px(24), 0, 0, 0),
                                  child: Text(
                                    '无损高音质提取视频中的音频',
                                    style: TextStyle(
                                      fontSize: Adapt.px(24),
                                      color: const Color(0xFF9E9E9E),
                                    ),
                                  ))
                            ])),
                  ]))),
        ]),
        Stack(children: <Widget>[
          GestureDetector(
              onTap: () => {
                    Routes.navigateTo(
                        context, '/teleprompter', {}, TransitionType.cupertino)
                  },
              child: Container(
                  height: Adapt.px(160),
                  padding: EdgeInsets.fromLTRB(
                      Adapt.px(30), Adapt.px(24), Adapt.px(24), Adapt.px(24)),
                  margin: EdgeInsets.fromLTRB(
                      Adapt.px(20), 0, Adapt.px(20), Adapt.px(40)),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    color: Color.fromARGB(255, 69, 69, 69),
                  ),
                  child: Row(children: [
                    Icon(Icons.cameraswitch,
                        size: Adapt.px(42), color: const Color(0xFFFFFFFF)),
                    Expanded(
                        flex: 1,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.fromLTRB(
                                      Adapt.px(24), 0, 0, 0),
                                  child: Text(
                                    '智能标题生成',
                                    style: TextStyle(
                                      fontSize: Adapt.px(28),
                                      color: const Color(0xFFFFFFFF),
                                    ),
                                  )),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.fromLTRB(
                                      Adapt.px(24), 0, 0, 0),
                                  child: Text(
                                    '一键根据内容自动生成标题',
                                    style: TextStyle(
                                      fontSize: Adapt.px(24),
                                      color: const Color(0xFF9E9E9E),
                                    ),
                                  ))
                            ])),
                  ]))),
        ]),
        Stack(children: <Widget>[
          GestureDetector(
              onTap: () => {
                    Routes.navigateTo(
                        context, '/teleprompter', {}, TransitionType.cupertino)
                  },
              child: Container(
                  height: Adapt.px(160),
                  padding: EdgeInsets.fromLTRB(
                      Adapt.px(30), Adapt.px(24), Adapt.px(24), Adapt.px(24)),
                  margin: EdgeInsets.fromLTRB(
                      Adapt.px(20), 0, Adapt.px(20), Adapt.px(40)),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    color: Color.fromARGB(255, 69, 69, 69),
                  ),
                  child: Row(children: [
                    Icon(Icons.cameraswitch,
                        size: Adapt.px(42), color: const Color(0xFFFFFFFF)),
                    Expanded(
                        flex: 1,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.fromLTRB(
                                      Adapt.px(24), 0, 0, 0),
                                  child: Text(
                                    '图片转文字',
                                    style: TextStyle(
                                      fontSize: Adapt.px(28),
                                      color: const Color(0xFFFFFFFF),
                                    ),
                                  )),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.fromLTRB(
                                      Adapt.px(24), 0, 0, 0),
                                  child: Text(
                                    '一键识别图片中的文字',
                                    style: TextStyle(
                                      fontSize: Adapt.px(24),
                                      color: const Color(0xFF9E9E9E),
                                    ),
                                  ))
                            ])),
                  ]))),
        ])
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
