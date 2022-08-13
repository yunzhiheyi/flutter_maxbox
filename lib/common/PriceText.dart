// ignore_for_file: library_private_types_in_public_api, file_names, prefer_const_constructors, unnecessary_const, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import '../utils/adApt.dart';

class PriceText extends StatefulWidget {
  final Color? color;
  final int? minFontSize;
  final int? fontSize;
  final String? price;
  final bool lineThrough;
  const PriceText(
      {Key? key,
      this.color,
      this.lineThrough = false,
      this.fontSize = 24,
      this.minFontSize = 20,
      this.price})
      : super(key: key);

  @override
  _PriceTextState createState() => _PriceTextState();
}

class _PriceTextState extends State<PriceText> {
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
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: '￥',
          style: TextStyle(
              fontSize: Adapt.px(widget.minFontSize),
              decoration: widget.lineThrough
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: widget.color ?? Colors.white)),
      TextSpan(
          text: '${widget.price}',
          style: TextStyle(
              fontSize: Adapt.px(widget.fontSize),
              decoration: widget.lineThrough
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: widget.color ?? Colors.white))
    ]));
  }
}
