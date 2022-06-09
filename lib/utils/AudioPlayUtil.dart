// ignore_for_file: avoid_print, unnecessary_null_comparison, unnecessary_brace_in_string_interps, file_names

import 'package:audioplayers/audioplayers.dart';

class AudioPlayUtil {
  late AudioPlayer audioPlayer;

  // static _instance，_instance会在编译期被初始化，保证了只被创建一次
  static final AudioPlayUtil _instance = AudioPlayUtil._internal();

  //提供了一个工厂方法来获取该类的实例
  factory AudioPlayUtil() {
    return _instance;
  }

  // 通过私有方法_internal()隐藏了构造方法，防止被误创建
  AudioPlayUtil._internal() {
    audioPlayer = AudioPlayer();
  }

  /// 播放
  Future play(String videoPath) async {
    int result = await audioPlayer.setUrl(videoPath);
    await audioPlayer.resume();
    callback();
    return result;
  }

  /// 继续播放
  Future continuePlay() async {
    int result = await audioPlayer.resume();
    return result;
  }

  /// 继续播放
  Future reset() async {
    int result = await audioPlayer.stop();
    return result;
  }

  /// 暂停
  Future pause() async {
    int result = await audioPlayer.pause();
    return result;
  }

  /// 拖动播放
  Future seekPlay(Duration duration) async {
    int result = await audioPlayer.seek(duration);
    return result;
  }

  /// 回调
  Future callback() async {
    audioPlayer.onPlayerStateChanged.listen((PlayerState playerState) {
      /// 广播部分，event为Duration类
      print('callback_${playerState}');
    });
  }
}
