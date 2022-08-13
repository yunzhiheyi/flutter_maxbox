// ignore_for_file: library_private_types_in_public_api, file_names, prefer_const_constructors, unnecessary_const, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import '../utils/AudioPlayUtil.dart';
import '../utils/adApt.dart';

class ItemVoice extends StatefulWidget {
  final Widget? child;
  final String title;
  final ValueChanged<int>? onChange;
  final int value;
  final int? groupValue;
  final String url;
  final String subtitle;
  const ItemVoice(
      {Key? key,
      required this.title,
      this.groupValue,
      required this.url,
      required this.subtitle,
      required this.value,
      this.onChange,
      this.child})
      : super(key: key);

  @override
  _ItemVoiceState createState() => _ItemVoiceState();
}

class _ItemVoiceState extends State<ItemVoice> {
  bool isPlay = false;
  int success = 0;
  bool isPlayCompleted = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    AudioPlayUtil().reset();
  }

  @override
  void didUpdateWidget(ItemVoice oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.groupValue != oldWidget.groupValue) {
      if (widget.groupValue == 0) {
        isPlayCompleted = false;
        isPlay = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    isPlayCompleted = widget.value == widget.groupValue;
    int _groupValue = widget.value;
    return Container(
        width: Adapt.px(180),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            color: Color.fromRGBO(69, 69, 69, 1),
            border: Border.all(
                color: isPlayCompleted
                    ? Color.fromARGB(255, 157, 157, 157)
                    : Color(0xFF383838),
                width: 0.5)),
        child: GridTileBar(
          backgroundColor: Color(0x0F242424),
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/icon-female.png'),
          ),
          title: Text(widget.title, style: TextStyle(fontSize: Adapt.px(26))),
          subtitle:
              Text(widget.subtitle, style: TextStyle(fontSize: Adapt.px(22))),
          trailing: GestureDetector(
              onTap: () async {
                widget.onChange?.call(_groupValue);
                // 选择外边框
                if (isPlayCompleted) {
                  setState(() {
                    isPlayCompleted = true;
                  });
                } else {
                  setState(() {
                    isPlayCompleted = false;
                    _groupValue = 0;
                  });
                }
                // 反选播放
                if (!isPlay) {
                  success = await AudioPlayUtil().play(widget.url);
                } else {
                  await AudioPlayUtil().pause();
                }
                setState(() {
                  isPlay = !isPlay;
                });
              },
              child: Icon(
                isPlay && isPlayCompleted ? Icons.pause : Icons.play_arrow,
                size: Adapt.px(32),
                color: Colors.white,
              )),
        ));
  }
}
