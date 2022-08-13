// ignore_for_file: library_private_types_in_public_api, file_names, prefer_const_constructors, unnecessary_const, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import '../utils/adApt.dart';

class ItemPriceText extends StatefulWidget {
  final Color color;
  final ValueChanged<int>? onChange;
  final int value;
  final int? groupValue;
  final int? minFontSize;
  final int? fontSize;
  final String? price;
  const ItemPriceText(
      {Key? key,
      required this.color,
      this.fontSize = 24,
      this.minFontSize = 20,
      this.groupValue,
      this.price,
      required this.value,
      this.onChange})
      : super(key: key);

  @override
  _ItemPriceTextState createState() => _ItemPriceTextState();
}

class _ItemPriceTextState extends State<ItemPriceText> {
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
    int _groupValue = widget.value;
    return Row(children: [
      Text('￥',
          style: TextStyle(
              fontSize: Adapt.px(widget.minFontSize), color: widget.color)),
      Text('${widget.price}',
          style: TextStyle(
              fontSize: Adapt.px(widget.fontSize), color: widget.color))
    ]);
  }
}
