// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:io';

class Adapt {
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  static final double _width = mediaQuery.size.width;
  static final double _height = mediaQuery.size.height;
  static final double _topbarH = mediaQuery.padding.top;
  static final double _botbarH = mediaQuery.padding.bottom;
  static final double _pixelRatio = mediaQuery.devicePixelRatio;
  static final int _w = Platform.isIOS? 680: 720;
  static var _ratio;
  static init(int number) {
    // ignore: unnecessary_type_check
    int uiwidth = number is int ? number : _w;
    _ratio = _width / uiwidth;
  }

  static px(number) {
    if (!(_ratio is double || _ratio is int)) {
      Adapt.init(_w);
    }
    return number * _ratio;
  }

  static onepx() {
    return 1 / _pixelRatio;
  }

  static screenW() {
    return _width;
  }

  static screenH() {
    return _height;
  }

  static padTopH() {
    return _topbarH;
  }

  static padBotH() {
    return _botbarH;
  }
}
