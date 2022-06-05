// ignore_for_file: unused_import, avoid_print, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:string_scanner/string_scanner.dart';
import 'package:max_box/utils/adApt.dart';

class StringParser {
  // 导入的文本
  final String content;
  // 高亮部分尾部索引, 也就是两段的区分位置
  final int endIndex;

  StringParser({required this.content, required this.endIndex});

  late StringScanner _scanner;

  // 解析函数
  InlineSpan parser() {
    _scanner = StringScanner(content);
    parseContent();

    final List<InlineSpan> spans = [];

    int currentPosition = 0;

    // 需要高亮的部分
    spans.add(TextSpan(style: _spans.style, text: _spans.text(content)));
    currentPosition = _spans.end;

    // 未高亮的部分
    if (currentPosition != content.length) {
      spans.add(
          TextSpan(text: content.substring(currentPosition, content.length)));
    }

    return TextSpan(style: TextStyleSupport.defaultStyle, children: spans);
  }

  late SpanBean _spans;

  // 解析需要变成高亮的字符
  void parseContent() {
    int startIndex = 0;
    print('endIndex----${endIndex}');
    _spans = SpanBean(startIndex, endIndex);

    if (!_scanner.isDone) {
      _scanner.position++;
    }
  }
}

class SpanBean {
  SpanBean(this.start, this.end);

  final int start;
  final int end;

  String text(String src) {
    return src.substring(start, end);
  }

  TextStyle get style => TextStyleSupport.highLightStyle;
}

class TextStyleSupport {
  static const defaultStyle =
      TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20);
  static const highLightStyle = TextStyle(color: Colors.green, fontSize: 20);
}
