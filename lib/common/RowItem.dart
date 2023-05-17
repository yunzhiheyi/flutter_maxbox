// ignore_for_file: file_names, library_private_types_in_public_api, avoid_unnecessary_containers, unnecessary_const, prefer_const_constructors, sized_box_for_whitespace, unnecessary_new, prefer_const_literals_to_create_immutables, must_be_immutable, unnecessary_null_comparison, camel_case_types

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fengchao/model/models.dart';
import 'package:fengchao/utils/adApt.dart';

import '../router/Routes.dart';

class RowItem extends StatefulWidget {
  final UserUiModel data;
  final ValueChanged<int>? onTap;
  const RowItem({Key? key, this.onTap, required this.data}) : super(key: key);

  @override
  _RowItemState createState() => _RowItemState();
}

class _RowItemState extends State<RowItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - Adapt.px(70),
        alignment: Alignment.center,
        height: Adapt.px(65),
        margin: EdgeInsets.fromLTRB(
            Adapt.px(35), Adapt.px(10), Adapt.px(35), Adapt.px(10)),
        child: GestureDetector(
            onTap: () {
              if (widget.data.isH5) {
                Routes.navigateTo(context, '/webview', widget.data.params);
              } else {
                if (widget.data.isOnTap) {
                  widget.onTap?.call(widget.data.id);
                } else {
                  Routes.navigateTo(context, widget.data.path,
                      widget.data.params, TransitionType.cupertino);
                }
              }
            },
            child: Row(
              children: <Widget>[
                Visibility(
                    visible: widget.data.icon != null,
                    child: Image.asset(
                      "assets/images/${widget.data.icon}.png",
                      fit: BoxFit.contain,
                      width: Adapt.px(40),
                      height: Adapt.px(40),
                    )),
                SizedBox(
                  width: Adapt.px(18),
                ),
                Expanded(
                    child: Text(widget.data.name,
                        style: TextStyle(
                            fontSize: Adapt.px(28),
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
                Visibility(
                    visible: widget.data.lastName != null,
                    child: Padding(
                        padding: EdgeInsets.only(right: Adapt.px(10)),
                        child: Text("${widget.data.lastName}",
                            style: TextStyle(
                                fontSize: Adapt.px(26),
                                color: widget.data.icon == 'icon-my-2'
                                    ? Color.fromARGB(255, 226, 177, 42)
                                    : Color.fromARGB(255, 148, 148, 148))))),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: Adapt.px(30),
                  color: Color.fromARGB(255, 148, 148, 148),
                ),
              ],
            )));
  }
}
