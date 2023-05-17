// ignore_for_file: file_names, unnecessary_new, override_on_non_overriding_member, camel_case_types
import 'package:flutter/material.dart';
import 'package:fengchao/utils/adApt.dart';

class topAppBar extends StatefulWidget {
  const topAppBar({Key? key}) : super(key: key);
  @override
  topAppBarState createState() => topAppBarState();
}

class topAppBarState extends State<topAppBar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Container(
        margin: EdgeInsets.fromLTRB(5, paddingTop + 10, 5, 0),
        height: Adapt.px(60),
        child: new Image.asset("assets/images/icon-logo.png",
            width: Adapt.px(158), height: Adapt.px(101)));
  }
}
