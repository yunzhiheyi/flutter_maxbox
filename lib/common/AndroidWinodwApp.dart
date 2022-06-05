// ignore_for_file: file_names, unused_field, unused_import, unnecessary_import, duplicate_import, library_prefixes, avoid_print, library_private_types_in_public_api, override_on_non_overriding_member, unnecessary_new, camel_case_types, prefer_final_fields, non_constant_identifier_names, unused_local_variable, unnecessary_brace_in_string_interps, unused_element, unnecessary_this, prefer_const_constructors, sort_child_properties_last, no_leading_underscores_for_local_identifiers
import 'dart:async';

import 'ScrollLoopScroll.dart';
import 'package:android_window/android_window.dart';
import 'package:flutter/material.dart';
import 'package:max_box/utils/adApt.dart';
import 'package:max_box/common/AnimatedRotate.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'string_parser.dart';
import 'dart:ui';

class AndroidWindowApp extends StatelessWidget {
  const AndroidWindowApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: teleprompterWindowPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class teleprompterWindowPage extends StatefulWidget {
  const teleprompterWindowPage({Key? key}) : super(key: key);
  @override
  _teleprompterWindowState createState() => new _teleprompterWindowState();
}

class _teleprompterWindowState extends State<teleprompterWindowPage> {
  double end_counter = 0;
  double begin_counter = 0;
  late InlineSpan span;

  final String content =
      """一点不错，”狐狸说。\n“对我来说，你还只是一个小男孩，就像其他千万个小男孩一样。我不需要你。\n你也同样用不着我。对你来说，我也不过是一只狐狸，和其他千万只狐狸一样。\n\n但是，如果你驯服了我，我们就互相不可缺少了。对我来说，你就是世界上唯一的了；我对你来说，也是世界上唯一的了。""";

  late StringParser parser;
  int endIndex = 0;
  bool flag = false;
  bool isPlay = false;
  bool isReset = false;
  bool enableScrollInput = true;
  int moveTop = 0;
  late Timer time;
  late Timer timePlay;
  @override
  void initState() {
    super.initState();
    parser = StringParser(content: content, endIndex: endIndex);
    span = parser.parser();
  }

  void dataDefault(index) {
    parser = StringParser(content: content, endIndex: index);
    span = parser.parser();
  }

  _starPlay(flag) {
    if (endIndex == content.length || !flag) {
      time.cancel();
      return;
    }
    endIndex++;
    dataDefault(endIndex);
    setState(() {});
    time = Timer(Duration(milliseconds: 300), () {
      _starPlay(this.flag);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ToggleRotate(
        beginAngle: begin_counter, // 起始角度
        endAngle: end_counter, // 终止角度
        curve: Curves.linear, // 动画曲线
        durationMs: 500, // 动画时长
        clockwise: true, // 顺时针旋转
        onEnd: (bool isExpanded) {
          setState(() {
            begin_counter = end_counter;
          });
          // AndroidWindow.resize(600, 600);
          //  AndroidWindow.setPosition(0, 0);
        },
        child: AndroidWindow(
          child: Scaffold(
              backgroundColor:
                  const Color.fromARGB(255, 75, 77, 73).withOpacity(0),
              body: Stack(children: <Widget>[
                Container(
                  // width: 185,
                  // height: 185,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(60, 0, 0, 0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: GestureDetector(
                      onTap: () => {
                            setState(() {
                              isPlay = !isPlay;
                              timePlay =
                                  Timer(Duration(milliseconds: 3000), () {
                                isPlay = true;
                              });
                            })
                          },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 20),
                            Expanded(
                                child: ScrollLoopAutoScroll(
                              play: flag,
                              reset: isReset,
                              onEnd: (bool isExpanded) {
                                setState(() {
                                  flag = false;
                                  isPlay = false;
                                  enableScrollInput = true;
                                  endIndex = 0;
                                });
                                time.cancel();
                                dataDefault(endIndex);
                              },
                              child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20.0, 100.0, 20.0, 20.0),
                                  child: Text.rich(span)),
                              scrollDirection: Axis.vertical,
                              enableScrollInput: enableScrollInput,
                              duration: Duration(seconds: 50),
                            )),
                            SizedBox(height: 20),
                          ])),
                ),
                Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: Visibility(
                        visible: !isPlay,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(0, 0, 0, 0),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    flag = !flag;
                                    isPlay = flag;
                                    enableScrollInput = false;
                                  });
                                  _starPlay(flag);
                                },
                                child: Icon(
                                  flag
                                      ? Icons.stop_circle_rounded
                                      : Icons.play_circle,
                                  size: Adapt.px(128),
                                  color: Colors.white,
                                ))))),
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Visibility(
                      visible: !isPlay,
                      child: Container(
                          alignment: Alignment.center,
                          height: 38,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(40, 0, 0, 0),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0)),
                          ),
                          child: Row(children: <Widget>[
                            TextButton(
                                onPressed: () {
                                  // AndroidWindow.resize(winWidth, winWidth);
                                  setState(() {
                                    if (end_counter == 360) {
                                      begin_counter = 0;
                                      end_counter = 90;
                                    } else if (end_counter == 90) {
                                      end_counter = 270;
                                    } else {
                                      end_counter += 90;
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.rotate_90_degrees_ccw,
                                  size: Adapt.px(62),
                                  color: Colors.white,
                                )),
                            Expanded(
                              child: TextButton(
                                  onPressed: () {
                                    if (flag) {
                                      setState(() {
                                        isReset = !isReset;
                                      });
                                    }
                                  },
                                  child: Icon(
                                    Icons.cached,
                                    size: Adapt.px(62),
                                    color: Colors.white,
                                  )),
                            ),
                            TextButton(
                                onPressed: () {
                                  AndroidWindow.close();
                                },
                                child: Icon(
                                  Icons.close,
                                  size: Adapt.px(62),
                                  color: Colors.white,
                                )),
                          ]))),
                ),
              ])),
        ));
  }

  @override
  void dispose() {
    // _refreshController..dispose();
    time.cancel();
    timePlay.cancel();
    super.dispose();
  }
}
