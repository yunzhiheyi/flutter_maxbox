// ignore_for_file: library_private_types_in_public_api, file_names, prefer_const_constructors, unnecessary_const, unused_local_variable, no_leading_underscores_for_local_identifiers, avoid_print

// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import '../model/conversionRecord.dart';
import '../utils/adApt.dart';
import 'AppButton.dart';

class ItemRecord extends StatefulWidget {
  final Widget? child;
  final String title;
  final ValueChanged<dynamic>? onChange;
  final int? state;
  // final int? data;
  final String subtitle;
  const ItemRecord(
      {Key? key,
      required this.title,
      required this.subtitle,
      this.onChange,
      this.state,
      this.child})
      : super(key: key);
  // final ConversionRecordModel data;
  @override
  _ItemRecordState createState() => _ItemRecordState();
}

class _ItemRecordState extends State<ItemRecord> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
          onTap: () async {
            widget.onChange?.call('1');
          },
          child: Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                color: Color(0xFFFFFFFF),
                border: Border.all(
                    color: Color.fromARGB(255, 229, 229, 229), width: 0.5),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(187, 187, 187, 0.2),
                      offset: Offset(0, 0),
                      blurRadius: 8.0,
                      spreadRadius: 1.0)
                ],
              ),
              height: Adapt.px(138),
              // padding: EdgeInsets.only(top: Adapt.px(6), bottom: Adapt.px(6)),
              margin: EdgeInsets.only(
                  left: Adapt.px(36),
                  right: Adapt.px(36),
                  bottom: Adapt.px(26)),
              child: GridTileBar(
                // backgroundColor: Color(0x0F242424),
                title: Text(widget.title,
                    style: TextStyle(
                        color: Color.fromARGB(255, 54, 54, 54),
                        fontSize: Adapt.px(26))),
                subtitle: Padding(
                    padding: EdgeInsets.only(
                      top: Adapt.px(12),
                    ),
                    child: Text(widget.subtitle,
                        style: TextStyle(
                            color: Color.fromARGB(255, 133, 133, 133),
                            fontSize: Adapt.px(22)))),
                trailing: Visibility(
                    visible: widget.state == 1,
                    child: Padding(
                        padding: EdgeInsets.only(
                          right: Adapt.px(8),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: Adapt.px(28),
                          color: Color.fromARGB(255, 48, 47, 47),
                        ))),
              ))),
      Positioned(
        right: Adapt.px(36),
        top: 0,
        child: Container(
            padding: EdgeInsets.only(
                left: Adapt.px(8),
                right: Adapt.px(8),
                top: Adapt.px(3),
                bottom: Adapt.px(3)),
            decoration: BoxDecoration(
              color: widget.state == 1 ? Color(0xFF189E49) : Color(0xFFF01E3A),
              borderRadius: BorderRadius.only(topRight: Radius.circular(6.0)),
            ),
            child: Text(
                widget.state == 1
                    ? '已完成'
                    : widget.state == 2
                        ? '转换失败'
                        : '转换中',
                style: TextStyle(
                    color: Color(0xFFFFFFFF), fontSize: Adapt.px(20)))),
      ),
      Positioned(
        right: Adapt.px(46),
        bottom: Adapt.px(38),
        child: Visibility(
            visible: widget.state == 2,
            child: AppButton(
                title: '重新转换',
                type: 'gradient',
                onTap: () {
                  print('重新购买');
                },
                width: 104,
                height: 36,
                fontSize: Adapt.px(20),
                padding: EdgeInsets.fromLTRB(Adapt.px(10), 0, Adapt.px(10), 0),
                margin: EdgeInsets.all(0),
                radius: 32)),
      )
    ]);
  }
}
