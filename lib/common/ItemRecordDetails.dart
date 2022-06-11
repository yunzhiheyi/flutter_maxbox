// ignore_for_file: library_private_types_in_public_api, file_names, prefer_const_constructors, unnecessary_const, unused_local_variable, no_leading_underscores_for_local_identifiers, avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import '../utils/adApt.dart';

class ItemRecordDetails extends StatefulWidget {
  final Widget? child;
  final String title;
  final ValueChanged<int>? onChange;
  final int? state;
  // final int? data;
  // final String subtitle;
  const ItemRecordDetails(
      {Key? key,
      required this.title,
      // required this.subtitle,
      this.onChange,
      this.state,
      this.child})
      : super(key: key);
  // final ConversionRecordModel data;
  @override
  _ItemRecordDetailsState createState() => _ItemRecordDetailsState();
}

class _ItemRecordDetailsState extends State<ItemRecordDetails> {
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
    return Container(
      width: double.infinity,
      // padding: EdgeInsets.only(top: Adapt.px(6), bottom: Adapt.px(6)),
      margin:
          EdgeInsets.only(left: Adapt.px(26), right: 0, bottom: Adapt.px(20)),
      child: Stack(children: [
        Container(
            padding: EdgeInsets.only(
              right: Adapt.px(176),
            ),
            child: Text(widget.title,
                style: TextStyle(
                    fontSize: Adapt.px(24),
                    color: Color.fromARGB(255, 192, 192, 192)))),
        Positioned(
            top: Adapt.px(2),
            right: Adapt.px(86),
            child: Text('02:00',
                style: TextStyle(
                    fontSize: Adapt.px(24), color: Color(0xFF9E9E9E)))),
        Positioned(
            top: Adapt.px(16),
            right: Adapt.px(25),
            child: Container(
              width: Adapt.px(60),
              height: Adapt.px(2),
              color: Color(0xFF929292),
            ))
      ]),
    );
  }
}
