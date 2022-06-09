// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, avoid_unnecessary_containers, unnecessary_const, must_be_immutable, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, override_on_non_overriding_member, avoid_print, unused_local_variable, non_constant_identifier_names, must_call_super, sized_box_for_whitespace, unused_field

// import 'dart:io';
// import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:max_box/bloc/global/bloc/global_bloc.dart';
import 'package:max_box/common/AppToBar.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max_box/utils/adApt.dart';
import 'package:video_player/video_player.dart';

import '../common/AppButton.dart';

class WatermarkIndex extends StatefulWidget {
  Map<String, dynamic> params;
  WatermarkIndex({
    Key? key,
    required this.params,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => WatermarkIndexState();
}

class WatermarkIndexState extends State<WatermarkIndex>
    with SingleTickerProviderStateMixin {
  late TextEditingController _ContentEditController;
  late Future<void> _initializeVideoPlayerFuture;
  late VideoPlayerController _controller;
  late String content = '';
  late Size contents;
  bool isCFocus = false;
  @override
  void initState() {
    super.initState();
    _ContentEditController = TextEditingController();
    _controller = VideoPlayerController.network(
        // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'
        'https://oss.taicibao.com/video/vip.mp4');

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
        body: GestureDetector(
          onTap: () {
            // 触摸收起键盘
            print('触摸收起键盘');
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(children: <Widget>[
            AppToBar(title: '视频去水印', child: Text('')),
            Container(
                height: Adapt.px(150),
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
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      onSubmitted: (val) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      // autofocus: true,
                      maxLines: 4,
                      maxLength: 200,
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
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
                              borderSide: BorderSide(color: Color(0x00000000)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          hintText: '复制粘贴短视频链接或直接输入',
                          // suffixText: '${title.length}/30',
                          // suffixStyle: TextStyle(color: Colors.grey),
                          hintStyle: TextStyle(
                              fontSize: Adapt.px(28), color: Colors.grey),
                          hintMaxLines: 1),
                    ))),
            FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Stack(children: [
                      Positioned(
                        child: Container(
                            width: Adapt.px(694),
                            height: _controller.value.aspectRatio < 1
                                ? Adapt.px(_controller.value.size.height *
                                    380 /
                                    _controller.value.size.width)
                                : Adapt.px(_controller.value.size.height),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Color.fromARGB(255, 12, 12, 12)),
                            margin: EdgeInsets.only(top: Adapt.px(30)),
                            child: Text('')),
                      ),
                      Positioned(
                          left: _controller.value.aspectRatio < 1
                              ? Adapt.px(694 - 380) / 2
                              : 0,
                          top: _controller.value.aspectRatio < 1
                              ? 0
                              : Adapt.px(694 - 380) / 2,
                          child: Container(
                              margin: EdgeInsets.only(top: Adapt.px(30)),
                              width: _controller.value.aspectRatio < 1
                                  ? Adapt.px(380)
                                  : Adapt.px(694),
                              child: Container(
                                  child: AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              )))),
                      Positioned(
                          left: Adapt.px(694 - 90) / 2,
                          top: Adapt.px(724 - 90) / 2,
                          child: FloatingActionButton(
                              backgroundColor:
                                  Color.fromRGBO(44, 111, 246, 0.6),
                              onPressed: () {
                                setState(() {
                                  //_controller.value.isPlaying：判断视频是否正在播放
                                  //_controller.pause()：如果是则暂停视频。
                                  // _controller.play():如果不是则播放视频
                                  _controller.value.isPlaying
                                      ? _controller.pause()
                                      : _controller.play();
                                });
                              },
                              child: Icon(
                                _controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              )))
                    ]);
                  } else {
                    return Container(
                        width: Adapt.px(694),
                        height: Adapt.px(694),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 12, 12, 12),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        margin: EdgeInsets.only(top: Adapt.px(24)),
                        child: SizedBox(
                            width: Adapt.px(64),
                            height: Adapt.px(64),
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                            )));
                  }
                }),
            AppButton(
              title: '立即解析',
              type: 'gradient',
              onTap: () {
                print('立即解析');
              },
            ),
            Container(
              margin: EdgeInsets.only(left: Adapt.px(30), right: Adapt.px(30)),
              child: Text('本功能仅供学习研究使用，视频内容版权归原作者所有，请勿违法违规使用。',
                  style: TextStyle(
                      fontSize: Adapt.px(24),
                      color: Color.fromARGB(255, 170, 170, 170))),
            ),
          ]),
        ));
    // //右下角图标按钮onPressed中需要调用setState方法，用于刷新界面
    // floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       setState(() {
    //         //_controller.value.isPlaying：判断视频是否正在播放
    //         //_controller.pause()：如果是则暂停视频。
    //         // _controller.play():如果不是则播放视频
    //         _controller.value.isPlaying
    //             ? _controller.pause()
    //             : _controller.play();
    //       });
    //     },

    //     //子组件为按钮图标
    //     //_controller.value.isPlaying：判断视频是否正在播放
    //     //Icons.pause：如果是则显示这个图标
    //     //Icons.play_arrow：如果不是，则显示这个图标
    //     child: Icon(
    //       _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
    //     )));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
