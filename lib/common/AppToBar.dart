import 'package:flutter/material.dart';
import 'package:max_box/utils/adApt.dart';
// ignore: import_of_legacy_library_into_null_safe

// ignore: must_be_immutable
class AppToBar extends StatefulWidget {
  final String title;
  AppToBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _AppToBar createState() => _AppToBar();
}

class _AppToBar extends State<AppToBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Color(0xccd0d7),
        title: Text(
          widget.title,
          style: TextStyle(fontSize: Adapt.px(36), color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: Adapt.px(40),
              color: Color.fromARGB(255, 56, 56, 56),
            ),
            onPressed: () {
              Navigator.of(context)..pop();
            }));
    ;
  }
}
