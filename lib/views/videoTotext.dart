// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, avoid_unnecessary_containers, unnecessary_const, must_be_immutable, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, override_on_non_overriding_member, avoid_print, unused_local_variable, non_constant_identifier_names, must_call_super, sized_box_for_whitespace, unused_field, avoid_types_as_parameter_names, unused_import, depend_on_referenced_packages, file_names

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:max_box/common/AppToBar.dart';
import 'package:max_box/utils/adApt.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:video_player/video_player.dart';

import '../common/AppButton.dart';
import '../common/ItemVoice.dart';
import '../common/conversionRecord.dart';
import '../router/Routes.dart';
import '../ui/collapse.dart';

class VideoTotext extends StatefulWidget {
  Map<String, dynamic> params;
  VideoTotext({
    Key? key,
    required this.params,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => VideoTotextState();
}

class VideoTotextState extends State<VideoTotext>
    with SingleTickerProviderStateMixin {
  int labelIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isText = widget.params['type'] == 'text';
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
        appBar: AppToBar(
            title: widget.params['type'] == 'text'
                ? '音视频提取文字'
                : widget.params['type'] == 'pic'
                    ? '图片转文字'
                    : '视频提取音频'),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  barrierColor: Color(0x2DD1D1D1),
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return ConversionRecord(
                        title: widget.params['type'] == 'text'
                            ? '转换记录'
                            : widget.params['type'] == 'pic'
                                ? '图片转文字'
                                : '提取记录',
                        type: widget.params['type'],
                        onTap: (bool isOp) {
                          Navigator.pop(context);
                        });
                  });
            },
            child: Icon(
              Icons.cloud_outlined,
              size: Adapt.px(60),
            )),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.only(
                    top: Adapt.px(18), left: Adapt.px(36), right: Adapt.px(36)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '当前剩余时长：5分钟',
                        style: TextStyle(
                            fontSize: Adapt.px(24), color: Colors.white),
                      ),
                      AppButton(
                          title: '购买时长',
                          type: 'gradient',
                          onTap: () {
                            Routes.navigateTo(context, '/user/buy/duration', {},
                                TransitionType.cupertino);
                          },
                          width: 138,
                          height: 52,
                          fontSize: Adapt.px(24),
                          padding: EdgeInsets.fromLTRB(
                              Adapt.px(20), 0, Adapt.px(20), 0),
                          margin: EdgeInsets.all(0),
                          radius: 52),
                    ])),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF474747),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                padding: EdgeInsets.only(bottom: Adapt.px(32)),
                margin: EdgeInsets.only(
                    top: Adapt.px(30),
                    bottom: Adapt.px(50),
                    left: Adapt.px(35),
                    right: Adapt.px(35)),
                child: Column(children: <Widget>[
                  Visibility(
                      visible: widget.params['type'] != 'pic',
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0)),
                          child: Container(
                            width: double.infinity,
                            height: Adapt.px(80),
                            decoration: BoxDecoration(
                              // color: Color(0xFF3A3A3A),
                              // border: Border.all(
                              //     color: const Color(0xFF6A6A6A), width: 0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            child: ToggleSwitch(
                              minWidth: Adapt.px(338),
                              initialLabelIndex: labelIndex,
                              cornerRadius: 0,
                              fontSize: Adapt.px(30),
                              activeFgColor: Colors.white,
                              inactiveBgColor: Color(0xFF3A3A3A),
                              inactiveFgColor: Color(0xFF9E9E9E),
                              totalSwitches: 2,
                              labels: ['视频', '音频'],
                              // icons: [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
                              activeBgColors: [
                                [Color(0xFF474747)],
                                [Color(0xFF474747)],
                              ],
                              onToggle: (index) {
                                print('switched to: $index');
                              },
                            ),
                          ))),

                  Container(
                    height: Adapt.px(130),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 93, 93, 93),
                      // border: Border.all(
                      //     color: const Color(0xFF6A6A6A), width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    margin: EdgeInsets.only(
                      left: Adapt.px(42),
                      right: Adapt.px(42),
                      top: Adapt.px(36),
                    ),
                    child: GridTileBar(
                      backgroundColor: Color(0x0F242424),
                      leading: Icon(
                        Icons.icecream,
                        size: Adapt.px(62),
                        color: Colors.white,
                      ),
                      title: Text('相册视频',
                          style: TextStyle(fontSize: Adapt.px(26))),
                      subtitle: Padding(
                          padding: EdgeInsets.only(top: Adapt.px(6)),
                          child: Text('从手机相册选择视频',
                              style: TextStyle(
                                  color: Color(0xFF9E9E9E),
                                  fontSize: Adapt.px(22)))),
                    ),
                  ),
                  Container(
                    height: Adapt.px(130),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 93, 93, 93),
                      // border: Border.all(
                      //     color: const Color(0xFF6A6A6A), width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    margin: EdgeInsets.only(
                      left: Adapt.px(42),
                      right: Adapt.px(42),
                      top: Adapt.px(36),
                    ),
                    child: GridTileBar(
                      backgroundColor: Color(0x0F242424),
                      leading: Icon(
                        Icons.icecream,
                        size: Adapt.px(62),
                        color: Colors.white,
                      ),
                      title: Text(
                          widget.params['type'] == 'pic' ? '文件管理器' : '手机视频',
                          style: TextStyle(fontSize: Adapt.px(26))),
                      subtitle: Padding(
                          padding: EdgeInsets.only(top: Adapt.px(6)),
                          child: Text(
                              widget.params['type'] == 'pic'
                                  ? '从文件管理选择图片'
                                  : '从文件管理选择视频',
                              style: TextStyle(
                                  color: Color(0xFF9E9E9E),
                                  fontSize: Adapt.px(22)))),
                    ),
                  ),
                  Visibility(
                      visible: widget.params['type'] != 'pic',
                      child: Container(
                        height: Adapt.px(130),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 93, 93, 93),
                          // border: Border.all(
                          //     color: const Color(0xFF6A6A6A), width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        margin: EdgeInsets.only(
                          left: Adapt.px(42),
                          right: Adapt.px(42),
                          top: Adapt.px(36),
                        ),
                        child: GridTileBar(
                          backgroundColor: Color(0x0F242424),
                          leading: Icon(
                            Icons.icecream,
                            size: Adapt.px(62),
                            color: Colors.white,
                          ),
                          title: Text('在线识别',
                              style: TextStyle(fontSize: Adapt.px(26))),
                          subtitle: Padding(
                              padding: EdgeInsets.only(top: Adapt.px(6)),
                              child: Text('在线识别抖音、西瓜、快手等短视频',
                                  style: TextStyle(
                                      color: Color(0xFF9E9E9E),
                                      fontSize: Adapt.px(22)))),
                        ),
                      )),

                  Visibility(
                      visible: widget.params['type'] != 'pic',
                      child: AppButton(
                          margin: EdgeInsets.only(top: Adapt.px(22)),
                          textUnderline: true,
                          type: 'text',
                          title: '查看指南'))

                  // 列表
                ])),
            Visibility(
                visible: widget.params['type'] != 'pic',
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: Adapt.px(36), right: Adapt.px(36)),
                      child: Text(
                          '支持wav,ogg-opus,speex,silk,m4a,aac,mp3,mp4等音视频格式、时长2小时以内、大小100MB以内的文件。',
                          style: TextStyle(
                              fontSize: Adapt.px(24),
                              color: Color.fromARGB(255, 170, 170, 170))),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(
                          left: Adapt.px(36),
                          top: Adapt.px(16),
                          right: Adapt.px(36)),
                      child: Text('音视频时长至少大于10秒钟。',
                          style: TextStyle(
                              fontSize: Adapt.px(24),
                              color: Color.fromARGB(255, 170, 170, 170))),
                    )
                  ],
                )),
          ]),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
