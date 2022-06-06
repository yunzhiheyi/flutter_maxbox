// ignore_for_file: library_private_types_in_public_api, file_names, prefer_const_constructors, unnecessary_const, unused_local_variable

// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../utils/AudioPlayUtil.dart';
import '../utils/adApt.dart';

class ItemVoice extends StatefulWidget {
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final Widget? child;
  final String? title;
  final String? cancelTitle;
  final String? confirmTitle;
  final bool enableScrollInput;
  const ItemVoice(
      {Key? key,
      this.onConfirm,
      this.title,
      this.enableScrollInput = true,
      this.confirmTitle,
      this.cancelTitle,
      this.onCancel,
      this.child})
      : super(key: key);

  @override
  _ItemVoiceState createState() => _ItemVoiceState();
}

class _ItemVoiceState extends State<ItemVoice> {
  bool isPlay = false;
  bool isPlayCompleted = false;
  int success = 0;

  @override
  void initState() {
    super.initState();
    // openAudio();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          title: Text('艾其', style: TextStyle(fontSize: Adapt.px(26))),
          subtitle: Text('温柔女声', style: TextStyle(fontSize: Adapt.px(22))),
          trailing: GestureDetector(
              onTap: () async {
                if (!isPlay) {
                  setState(() {
                    isPlayCompleted = true;
                  });
                  success = await AudioPlayUtil().play(
                      'https://cdn.maxbox.com.cn/upload/5faa3a39fdab4747b518a3fb9f9432f0.mp3');
                } else {
                  await AudioPlayUtil().pause();
                }
                setState(() {
                  isPlay = !isPlay;
                });
                AudioPlayUtil()
                    .audioPlayer
                    .onPlayerStateChanged
                    .listen((PlayerState playerState) {
                  if (playerState == PlayerState.COMPLETED) {
                    setState(() {
                      isPlayCompleted = false;
                      isPlay = false;
                    });
                  }
                });
              },
              child: Icon(
                isPlay ? Icons.pause : Icons.play_arrow,
                size: Adapt.px(32),
                color: Colors.white,
              )),
        ));
  }
}
