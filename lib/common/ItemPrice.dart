// ignore_for_file: library_private_types_in_public_api, file_names, prefer_const_constructors, unnecessary_const, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
// import '../utils/AudioPlayUtil.dart';
// import '../utils/adApt.dart';
import '../utils/adApt.dart';
import 'PriceText.dart';

class ItemPrice extends StatefulWidget {
  final Widget? child;
  final ValueChanged<int>? onChange;
  final int value;
  final int? groupValue;
  final String? originalPprice;
  final String? price;
  final String? time;
  const ItemPrice(
      {Key? key,
      this.groupValue,
      required this.value,
      this.onChange,
      this.price,
      this.originalPprice,
      this.time,
      this.child})
      : super(key: key);
  @override
  _ItemPriceState createState() => _ItemPriceState();
}

class _ItemPriceState extends State<ItemPrice> {
  bool isPlayCompleted = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(ItemPrice oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.groupValue != oldWidget.groupValue) {
      if (widget.groupValue == 0) {
        isPlayCompleted = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    isPlayCompleted = widget.value == widget.groupValue;
    int _groupValue = widget.value;
    return GestureDetector(
        onTap: () {
          widget.onChange?.call(widget.value);
        },
        child: Container(
            padding: EdgeInsets.only(top: Adapt.px(28), bottom: Adapt.px(28)),
            alignment: Alignment.center,
            margin: EdgeInsets.all(Adapt.px(15)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                color: Color(0xFF454545),
                border: Border.all(
                    color:
                        isPlayCompleted ? Color(0xFFFFFFFF) : Color(0xFF383838),
                    width: 0.5)),
            child: Column(children: [
              PriceText(
                price: widget.price,
                fontSize: 32,
              ),
              PriceText(
                price: widget.originalPprice,
                lineThrough: true,
                fontSize: 20,
                color: Color(0xFF9E9E9E),
              ),
              Text(
                '${widget.time}',
                style:
                    TextStyle(fontSize: Adapt.px(24), color: Color(0xFF929292)),
              )
            ])));
  }
}
