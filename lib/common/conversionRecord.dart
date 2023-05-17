// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, avoid_unnecessary_containers, unnecessary_const, must_be_immutable, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, override_on_non_overriding_member, avoid_print, unused_local_variable, non_constant_identifier_names, must_call_super, sized_box_for_whitespace, unused_field, avoid_types_as_parameter_names, unused_import, file_names

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fengchao/common/AppToBar.dart';
import 'package:fengchao/utils/adApt.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:video_player/video_player.dart';

import '../common/AppButton.dart';
import '../common/ItemVoice.dart';
import '../router/Routes.dart';
import '../ui/collapse.dart';
import 'ItemRecord.dart';

class ConversionRecord extends StatefulWidget {
  final ValueChanged<bool>? onTap;
  final bool isBack;
  final String title;
  final String type;
  ConversionRecord(
      {Key? key,
      required this.title,
      required this.type,
      this.onTap,
      this.isBack = false})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => ConversionRecordState();
}

class ConversionRecordState extends State<ConversionRecord>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _onPressedSubmit() async {
    widget.onTap?.call(true);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF6F6F6),
          ),
          padding: EdgeInsets.only(bottom: Adapt.padBotH()),
          child: Column(children: [
            AppToBar(
                title: widget.title,
                isBack: widget.isBack,
                type: 'white',
                posRight: 0,
                fontSize: 30,
                rightChild: IconButton(
                    icon: Icon(
                      Icons.close_rounded,
                      size: Adapt.px(36),
                      color: Colors.black,
                    ),
                    onPressed: _onPressedSubmit)),
            Visibility(
                visible: widget.type != 'pic',
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                      top: 0,
                      left: Adapt.px(36),
                      right: Adapt.px(36),
                      bottom: Adapt.px(26)),
                  child: Text(
                    '备注：大文件转换提取过程中时间略长，请勿频繁查询结果',
                    style: TextStyle(
                        color: Color.fromARGB(255, 245, 10, 10),
                        fontSize: Adapt.px(24)),
                  ),
                )),
            Expanded(
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        ItemRecord(
                            state: 1,
                            title: '视频转文字.mp4',
                            subtitle: '2022-05-22 15:22:22',
                            onChange: (dynamic id) {
                              Routes.navigateTo(context, '/home/text/details',
                                  {'id': id}, TransitionType.cupertino);
                            }),
                        ItemRecord(
                            state: 2,
                            title: '视频转音频.mp4',
                            subtitle: '2022-05-22 15:22:22',
                            onChange: (dynamic id) {
                              Routes.navigateTo(context, '/home/voice/details',
                                  {'id': id}, TransitionType.cupertino);
                            }),
                        ItemRecord(
                            state: 1,
                            title: '图片转文字.png',
                            subtitle: '2022-05-22 15:22:22',
                            onChange: (dynamic id) {
                              Routes.navigateTo(
                                  context,
                                  '/home/picture/details',
                                  {'id': id},
                                  TransitionType.cupertino);
                            }),
                        ItemRecord(
                          state: 2,
                          title: '测试音频1112.mp4',
                          subtitle: '2022-05-22 15:22:22',
                        ),
                        ItemRecord(
                          state: 2,
                          title: '测试音频111.mp4',
                          subtitle: '2022-05-22 15:22:22',
                        ),
                        ItemRecord(
                          state: 1,
                          title: '测试音频2222.mp4',
                          subtitle: '2022-05-22 15:22:22',
                        )
                      ],
                    )))
          ]),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
