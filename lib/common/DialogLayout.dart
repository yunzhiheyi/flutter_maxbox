// ignore_for_file: library_private_types_in_public_api, file_names, prefer_const_constructors, unnecessary_const, unused_local_variable

import 'package:flutter/material.dart';
import '../utils/adApt.dart';
import 'AppButton.dart';

class DialogLayout extends StatefulWidget {
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final Widget? child;
  final String? title;
  final String? cancelTitle;
  final String? confirmTitle;
  final bool enableScrollInput;
  const DialogLayout(
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
  _DialogLayoutState createState() => _DialogLayoutState();
}

class _DialogLayoutState extends State<DialogLayout> {
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
    return Column(children: [
      Container(
          padding: EdgeInsets.only(top: Adapt.px(20), bottom: Adapt.px(20)),
          child: Text(widget.title ?? '提示',
              style: TextStyle(
                  fontSize: Adapt.px(28),
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 39, 39, 39)))),
      Expanded(
          flex: 1,
          child: SingleChildScrollView(
              physics: widget.enableScrollInput
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: widget.child)),
      Container(
          padding: EdgeInsets.only(
              left: Adapt.px(25),
              right: Adapt.px(25),
              top: Adapt.px(20),
              bottom: Adapt.px(20)),
          margin: EdgeInsets.only(bottom: Adapt.px(8)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            AppButton(
              title: widget.cancelTitle ?? '取消',
              onTap: () {
                widget.onCancel?.call();
              },
              width: 180,
              height: 60,
              fontSize: Adapt.px(26),
              color: Color(0xFFEEEEEE),
              fontColor: Color.fromARGB(255, 55, 55, 55),
              borderColor: Color(0xFFEEEEEE),
              margin: EdgeInsets.all(Adapt.px(0)),
            ),
            AppButton(
              title: widget.confirmTitle ?? '确认',
              onTap: () {
                widget.onConfirm?.call();
              },
              type: 'gradient',
              width: 180,
              height: 60,
              fontSize: Adapt.px(26),
              margin: EdgeInsets.only(
                  left: Adapt.px(40), top: 0, right: 0, bottom: 0),
            ),
          ]))
    ]);
  }
}
