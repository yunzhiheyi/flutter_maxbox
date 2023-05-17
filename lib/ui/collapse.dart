// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors_in_immutables, deprecated_member_use, sort_child_properties_last, unnecessary_null_comparison, non_constant_identifier_names, constant_identifier_names, library_private_types_in_public_api, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:fengchao/utils/adApt.dart';
import 'animate_rotate.dart';

class Collapse extends StatefulWidget {
  /// 折叠面板
  const Collapse({
    Key? key,
    required this.title,
    this.icon = const Icon(
      Icons.expand_more,
      size: 24,
      color: Colors.white,
    ),
    this.value = true,
    required this.body,
    required this.onChange,
    this.showBorder = true,
  }) : super(key: key);

  /// 标题
  final Widget title;

  /// 是否展开 true:展开 false:收起 默认值:true
  final bool value;

  /// 内容
  final Widget body;

  /// 回调 返回当前value
  final Function(bool) onChange;

  /// icon 默认值：Icon(Icons.expand_more, size: 24,),
  final Widget icon;

  /// 是否显示border
  final bool showBorder;

  @override
  _CollapseState createState() => _CollapseState();
}

class _CollapseState extends State<Collapse> {
  double angle = 0;
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
      // padding: EdgeInsets.only(left: Adapt.px(15), right: Adapt.px(15)),
      child: Column(
        children: <Widget>[
          /// title
          InkWell(
            child: Container(
              padding: EdgeInsets.all(Adapt.px(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: widget.title,
                  ),
                  AnimatedRotate(
                      angle: !widget.value ? 0 : 180,
                      duration: const Duration(milliseconds: 300),
                      child: widget.icon)
                ],
              ),
            ),
            onTap: () {
              widget.onChange.call(!widget.value);
            },
          ),

          _Body(
            child: widget.body,
            sleep: const Duration(milliseconds: 120),
            value: widget.value,
          )
        ],
      ),
    );
  }
}

/// 内容区域
/// 为了获取当前内容的高度 实现展开收起动画，所以拆成状态组件
class _Body extends StatefulWidget {
  _Body({
    required this.child,
    required this.value,
    required this.sleep,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final bool value;
  final Duration sleep;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedSize(
          vsync: this,
          duration: widget.sleep,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: !widget.value ? 0 : double.infinity,
            ),
            child: widget.child,
          )),
    );
  }
}
