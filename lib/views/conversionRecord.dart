// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, avoid_unnecessary_containers, unnecessary_const, must_be_immutable, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, override_on_non_overriding_member, avoid_print, unused_local_variable, non_constant_identifier_names, must_call_super, sized_box_for_whitespace, unused_field, avoid_types_as_parameter_names, unused_import

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:max_box/common/AppToBar.dart';
import 'package:max_box/utils/adApt.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:video_player/video_player.dart';

import '../common/AppButton.dart';
import '../common/ItemVoice.dart';
import '../ui/collapse.dart';

class ConversionRecord extends StatefulWidget {
  Map<String, dynamic> params;
  ConversionRecord({
    Key? key,
    required this.params,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => ConversionRecordState();
}

class ConversionRecordState extends State<ConversionRecord>
    with SingleTickerProviderStateMixin {
  late TextEditingController _ContentEditController;
  late Future<void> _initializeVideoPlayerFuture;
  late VideoPlayerController _controller;
  late String content = '';
  late Size contents;
  late double _transparencyValue = 0;
  late double _speedValue = 0;
  bool isCFocus = false;
  bool isCollapse = false;
  @override
  void initState() {
    super.initState();
    _ContentEditController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
        appBar: AppToBar(title: '文字转语音', child: Text('')),
        bottomNavigationBar: Container(
            margin: EdgeInsets.fromLTRB(0, Adapt.px(0), 0, Adapt.padBotH()),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              AppButton(
                title: '语音合成',
                type: 'gradient',
                width: 350,
                icon: Image.asset("assets/images/icon-sonic.png",
                    width: Adapt.px(36), height: Adapt.px(36)),
                margin: EdgeInsets.only(
                    top: Adapt.px(36),
                    bottom: Adapt.px(30),
                    right: Adapt.px(36)),
                onTap: () {
                  print('语音合成');
                },
              ),
              AppButton(
                title: '下载',
                width: 200,
                color: Color(0xFF048748),
                borderColor: Color(0xFF048748),
                margin:
                    EdgeInsets.only(top: Adapt.px(36), bottom: Adapt.px(30)),
                onTap: () {
                  print('下载');
                },
              )
            ])),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: GestureDetector(
              onTap: () {
                // 触摸收起键盘
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Column(children: <Widget>[
                Container(
                    height: Adapt.px(240),
                    margin: EdgeInsets.fromLTRB(
                        Adapt.px(30), Adapt.px(10), Adapt.px(30), 0),
                    padding: EdgeInsets.fromLTRB(
                        Adapt.px(30), Adapt.px(14), Adapt.px(30), 0),
                    decoration: BoxDecoration(
                      color: Color(0xFF383838),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(
                          color: isCFocus
                              ? Color.fromARGB(255, 157, 157, 157)
                              : Color(0xFF383838),
                          width: 0.5),
                    ),
                    child: Column(children: [
                      Expanded(
                          flex: 1,
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
                                //限制长度
                                onEditingComplete: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                                onSubmitted: (val) {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                                // autofocus: true,
                                maxLines: 4,
                                maxLength: 200,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                decoration: InputDecoration(
                                    counterText: '',
                                    counterStyle: TextStyle(color: Colors.grey),
                                    // contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                                    focusColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    contentPadding:
                                        const EdgeInsets.symmetric(vertical: 1),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromARGB(0, 32, 31, 31)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100))),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0x00000000)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100))),
                                    hintText: '复制粘贴短视频链接或直接输入',
                                    // suffixText: '${title.length}/30',
                                    // suffixStyle: TextStyle(color: Colors.grey),
                                    hintStyle: TextStyle(
                                        fontSize: Adapt.px(28),
                                        color: Colors.grey),
                                    hintMaxLines: 1),
                              ))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            children: [
                              AppButton(
                                  title: '清空文本',
                                  height: 40,
                                  width: 120,
                                  fontColor: Color(0xFFBFBFBF),
                                  onTap: () {},
                                  color: Color(0xFF555555),
                                  fontSize: Adapt.px(22),
                                  borderColor: Color(0xFF555555),
                                  padding: EdgeInsets.fromLTRB(
                                      Adapt.px(10), 0, Adapt.px(10), 0),
                                  margin: EdgeInsets.only(bottom: Adapt.px(20)),
                                  radius: 40),
                              AppButton(
                                  title: '插入停顿',
                                  height: 40,
                                  width: 120,
                                  fontColor: Color(0xFFBFBFBF),
                                  onTap: () {},
                                  color: Color(0xFF555555),
                                  fontSize: Adapt.px(22),
                                  borderColor: Color(0xFF555555),
                                  padding: EdgeInsets.fromLTRB(
                                      Adapt.px(10), 0, Adapt.px(10), 0),
                                  margin: EdgeInsets.only(
                                      left: Adapt.px(20), bottom: Adapt.px(20)),
                                  radius: 40)
                            ],
                          ),
                          Container(
                              height: Adapt.px(40),
                              alignment: Alignment.topCenter,
                              // EdgeInsets.only(left: Adapt.px(30), right: Adapt.px(30)),
                              child: Text('${content.length}/200',
                                  style: TextStyle(
                                      fontSize: Adapt.px(24),
                                      color: Color(0xFFBFBFBF))))
                        ],
                      )
                    ])),
                Container(
                    padding: const EdgeInsets.all(8.0),
                    // width: Adapt.px(690),
                    margin: EdgeInsets.only(
                        top: Adapt.px(20),
                        left: Adapt.px(20),
                        right: Adapt.px(20)),
                    height: Adapt.px(640),
                    child: ContainedTabBarView(
                        tabs: [
                          Text('通用'),
                          Text('客服'),
                          Text('文学'),
                          Text('儿童'),
                          Text('英语'),
                          Text('方言'),
                          Text('日语'),
                        ],
                        tabBarProperties: TabBarProperties(
                          height: Adapt.px(42),
                          isScrollable: true,
                          background: Container(
                            decoration: BoxDecoration(),
                          ),
                          position: TabBarPosition.top,
                          alignment: TabBarAlignment.center,
                          indicatorColor: Colors.white,
                          labelStyle: TextStyle(fontSize: Adapt.px(30)),
                          indicatorWeight: 1,
                          indicatorPadding: EdgeInsets.only(
                            left: Adapt.px(24),
                            right: Adapt.px(24),
                          ),
                          labelPadding: EdgeInsets.only(
                              left: Adapt.px(24), right: Adapt.px(24)),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.grey[400],
                        ),
                        views: [
                          Container(
                            padding: EdgeInsets.only(
                              top: Adapt.px(30),
                            ),
                            alignment: Alignment.topLeft,
                            child: MediaQuery.removePadding(
                                removeTop: true,
                                removeBottom: true,
                                context: context,
                                child: GridView.count(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: Adapt.px(26),
                                  crossAxisSpacing: Adapt.px(26),
                                  childAspectRatio: 1 / 0.35,
                                  children: [
                                    ItemVoice(),
                                    ItemVoice(),
                                    ItemVoice(),
                                    ItemVoice(),
                                    ItemVoice(),
                                    ItemVoice(),
                                    ItemVoice(),
                                    ItemVoice()
                                  ],
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              '测试2',
                              style: TextStyle(
                                  fontSize: Adapt.px(28), color: Colors.white),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              '测试3',
                              style: TextStyle(
                                  fontSize: Adapt.px(28), color: Colors.white),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              '测试4',
                              style: TextStyle(
                                  fontSize: Adapt.px(28), color: Colors.white),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              '测试5',
                              style: TextStyle(
                                  fontSize: Adapt.px(28), color: Colors.white),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              '测试6',
                              style: TextStyle(
                                  fontSize: Adapt.px(28), color: Colors.white),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              '测试7',
                              style: TextStyle(
                                  fontSize: Adapt.px(28), color: Colors.white),
                            ),
                          ),
                        ])),
                Collapse(
                  title: Container(
                      padding: EdgeInsets.only(left: Adapt.px(6)),
                      child: Row(children: [
                        Icon(
                          Icons.settings,
                          size: Adapt.px(40),
                          color: Colors.white,
                        ),
                        Padding(padding: EdgeInsets.only(right: Adapt.px(10))),
                        Text('参数设置',
                            style: TextStyle(
                                fontSize: Adapt.px(28), color: Colors.white))
                      ])),
                  body: Column(children: [
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: Row(children: [
                          SizedBox(
                              width: 50,
                              child: Text('音量',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: Adapt.px(26)))),
                          Expanded(
                            flex: 1,
                            child: SfSlider(
                              min: 0,
                              max: 100,
                              stepSize: 1,
                              value: _transparencyValue,
                              showTicks: false,
                              showLabels: false,
                              enableTooltip: true,
                              tooltipShape: SfPaddleTooltipShape(),
                              minorTicksPerInterval: 1,
                              activeColor: Color(0xFFAFAFAF),
                              inactiveColor: Color.fromARGB(255, 150, 150, 150),
                              onChanged: (dynamic value) {
                                setState(() {
                                  _transparencyValue = value;
                                });
                              },
                            ),
                          )
                        ])),
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: Row(children: [
                          SizedBox(
                              width: 50,
                              child: Text('语速',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: Adapt.px(26)))),
                          Expanded(
                            flex: 1,
                            child: SfSlider(
                              min: 0,
                              max: 100,
                              stepSize: 1,
                              value: _speedValue,
                              showTicks: false,
                              showLabels: false,
                              enableTooltip: true,
                              tooltipShape: SfPaddleTooltipShape(),
                              activeColor: Color(0xFFAFAFAF),
                              inactiveColor: Color.fromARGB(255, 150, 150, 150),
                              minorTicksPerInterval: 1,
                              onChanged: (dynamic value) {
                                setState(() {
                                  _speedValue = value;
                                });
                              },
                            ),
                          )
                        ])),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, Adapt.px(20)),
                        child: Row(children: [
                          SizedBox(
                              width: 50,
                              child: Text('语调',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: Adapt.px(26)))),
                          Expanded(
                            flex: 1,
                            child: SfSlider(
                              min: 0,
                              max: 100,
                              stepSize: 1,
                              value: _speedValue,
                              showTicks: false,
                              showLabels: false,
                              enableTooltip: true,
                              activeColor: Color(0xFFAFAFAF),
                              inactiveColor: Color.fromARGB(255, 150, 150, 150),
                              minorTicksPerInterval: 1,
                              // thumbIcon: Icon(
                              //   Icons.home,
                              //   color: Colors.green,
                              //   size: 20.0,
                              // ),
                              onChanged: (dynamic value) {
                                setState(() {
                                  _speedValue = value;
                                });
                              },
                            ),
                          )
                        ])),
                  ]),
                  value: isCollapse,
                  onChange: (bool) {
                    print(bool);
                    setState(() {
                      isCollapse = !isCollapse;
                    });
                  },
                ),
              ])),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
