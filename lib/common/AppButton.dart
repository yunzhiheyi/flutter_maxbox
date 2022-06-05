// ignore_for_file: file_names, library_private_types_in_public_api, avoid_unnecessary_containers, unnecessary_const, prefer_const_constructors, sized_box_for_whitespace, unnecessary_new, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:max_box/utils/adApt.dart';

class AppButton extends StatefulWidget {
  final String title;
  final String type;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final Widget? child;
  final Widget? icon;
  final Color? color;
  final double? fontSize;
  final double? radius;
  final Color? fontColor;
  final Color? borderColor;
  final bool textUnderline;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  AppButton(
      {Key? key,
      this.title = '',
      this.onTap,
      this.width,
      this.height,
      this.color,
      this.fontColor,
      this.fontSize,
      this.padding,
      this.margin,
      this.radius,
      this.child,
      this.textUnderline = false,
      this.borderColor,
      this.type = 'default',
      this.icon})
      : super(key: key);

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _onPressedSubmit() async {
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _onPressedSubmit,
        child: Container(
            width: Adapt.px(widget.width ?? 690),
            height: Adapt.px(widget.height ?? 78),
            alignment: Alignment.center,
            margin: widget.margin ?? EdgeInsets.all(Adapt.px(30)),
            padding: widget.padding ?? EdgeInsets.only(bottom: Adapt.px(4)),
            decoration: widget.type == 'gradient'
                ? BoxDecoration(
                    gradient: LinearGradient(
                        //渐变位置
                        begin: Alignment.topRight, //右上
                        end: Alignment.bottomLeft, //左下
                        stops: [
                          0.0,
                          1.0
                        ], //[渐变起始点, 渐变结束点]
                        //渐变颜色[始点颜色, 结束颜色]
                        colors: [
                          Color.fromRGBO(44, 111, 246, 1),
                          Color.fromRGBO(112, 153, 255, 1)
                        ]),
                    borderRadius: BorderRadius.all(
                        Radius.circular(widget.radius ?? 78.0)),
                  )
                : widget.type == 'text'
                    ? BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(widget.radius ?? 78.0)),
                      )
                    : BoxDecoration(
                        color: widget.color,
                        borderRadius: BorderRadius.all(
                            Radius.circular(widget.radius ?? 78.0)),
                        border: Border.all(
                            color: widget.borderColor ?? Colors.white,
                            width: 0.5),
                      ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        right: Adapt.px(widget.icon != null ? 15 : 0)),
                    child: widget.icon),
                Text(widget.title,
                    style: widget.textUnderline
                        ? TextStyle(
                            fontSize: widget.fontSize ?? Adapt.px(28),
                            color: widget.fontColor ?? Colors.white,
                            decoration: TextDecoration.underline)
                        : TextStyle(
                            fontSize: widget.fontSize ?? Adapt.px(28),
                            color: widget.fontColor ?? Colors.white)),
              ],
            )));
  }
}
