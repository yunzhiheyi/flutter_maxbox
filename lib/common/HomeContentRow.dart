// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member, unused_local_variable, unnecessary_new, unused_field, prefer_final_fields, must_be_immutable, no_leading_underscores_for_local_identifiers, prefer_const_constructors_in_immutables, library_private_types_in_public_api, no_logic_in_create_state, unnecessary_this, unnecessary_brace_in_string_interps, unused_element, prefer_const_constructors

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../router/Routes.dart';
import '../utils/adApt.dart';

class HomeContentRow extends StatefulWidget {
  const HomeContentRow({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeContentRowState();
}

class HomeContentRowState extends State<HomeContentRow>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(Adapt.px(20)),
        child: Row(children: <Widget>[
          Expanded(
              flex: 1,
              child: Stack(children: <Widget>[
                GestureDetector(
                    onTap: () => {
                          Routes.navigateTo(context, '/home/teleprompter', {},
                              TransitionType.cupertino)
                        },
                    child: Container(
                        alignment: Alignment.center,
                        height: Adapt.px(180),
                        padding: EdgeInsets.fromLTRB(Adapt.px(20), Adapt.px(24),
                            Adapt.px(24), Adapt.px(14)),
                        margin: EdgeInsets.all(Adapt.px(20)),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          color: Color.fromARGB(255, 69, 69, 69),
                        ),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.article_rounded,
                                  size: Adapt.px(68),
                                  color: const Color(0xFFFFFFFF)),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                '提词器',
                                style: TextStyle(
                                  fontSize: Adapt.px(28),
                                  color: const Color(0xFFFFFFFF),
                                ),
                              )
                            ]))),
                Positioned(
                    top: 14,
                    right: 14,
                    child: new Image.asset("assets/images/icon-ai.png",
                        width: Adapt.px(26), height: Adapt.px(26)))
              ])),
          Expanded(
              flex: 1,
              child: Stack(children: <Widget>[
                GestureDetector(
                    onTap: () => {
                          Routes.navigateTo(context, '/home/textvoice', {},
                              TransitionType.cupertino)
                        },
                    child: Container(
                        alignment: Alignment.center,
                        height: Adapt.px(180),
                        padding: EdgeInsets.fromLTRB(Adapt.px(20), Adapt.px(24),
                            Adapt.px(24), Adapt.px(14)),
                        margin: EdgeInsets.all(Adapt.px(20)),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          color: Color.fromARGB(255, 69, 69, 69),
                        ),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.adobe,
                                  size: Adapt.px(68),
                                  color: const Color(0xFFFFFFFF)),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                '视频配音',
                                style: TextStyle(
                                  fontSize: Adapt.px(28),
                                  color: const Color(0xFFFFFFFF),
                                ),
                              )
                            ]))),
                Positioned(
                    top: 14,
                    right: 14,
                    child: new Image.asset("assets/images/icon-ai.png",
                        width: Adapt.px(26), height: Adapt.px(26)))
              ])),
          Expanded(
              flex: 1,
              child: Stack(children: <Widget>[
                GestureDetector(
                  onTap: () => {
                    Routes.navigateTo(context, '/home/watermark', {},
                        TransitionType.cupertino)
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: Adapt.px(180),
                      padding: EdgeInsets.fromLTRB(Adapt.px(20), Adapt.px(24),
                          Adapt.px(24), Adapt.px(14)),
                      margin: EdgeInsets.all(Adapt.px(20)),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        color: Color.fromARGB(255, 69, 69, 69),
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: Color.fromRGBO(71, 71, 71, 0.1),
                        //       offset: Offset(4.0, 4.0),
                        //       blurRadius: 12.0,
                        //       spreadRadius: 2.0)
                        // ],
                      ),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.shield_moon_outlined,
                                size: Adapt.px(68),
                                color: const Color(0xFFFFFFFF)),
                            SizedBox(
                              height: 8,
                            ),
                            Text('去水印',
                                style: TextStyle(
                                  fontSize: Adapt.px(28),
                                  color: const Color(0xFFFFFFFF),
                                ))
                          ])),
                ),
                Positioned(
                    top: 14,
                    right: 14,
                    child: new Image.asset("assets/images/icon-ai.png",
                        width: Adapt.px(26), height: Adapt.px(26)))
              ])),
        ]));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
