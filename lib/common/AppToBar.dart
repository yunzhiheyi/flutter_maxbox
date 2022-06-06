// ignore_for_file: file_names, library_private_types_in_public_api, avoid_unnecessary_containers, unnecessary_const, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:max_box/utils/adApt.dart';

class AppToBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  const AppToBar({
    Key? key,
    required this.child,
    required this.title,
  }) : super(key: key);

  @override
  _AppToBar createState() => _AppToBar();

  @override
  Size get preferredSize => Size(100, Adapt.px(88));
}

class _AppToBar extends State<AppToBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;
    return Stack(children: <Widget>[
      Column(children: [
        Container(
          height: topPadding,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(47, 47, 47, 1),
            // borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
        ),
        Container(
            height: Adapt.px(88),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(47, 47, 47, 1),
              // borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: Adapt.px(34), color: Colors.white),
            )),
      ]),
      Positioned(
          left: 6,
          top: topPadding,
          child: Container(
              height: Adapt.px(88),
              alignment: Alignment.bottomCenter,
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: Adapt.px(34),
                    color: Colors.white,
                  ),
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus &&
                        currentFocus.focusedChild != null) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                    EasyLoading.dismiss();
                    Navigator.of(context).pop();
                  }))),
      Positioned(
          top: topPadding,
          right: 15,
          child: Container(
              height: Adapt.px(88),
              alignment: Alignment.center,
              child: widget.child))
    ]);
  }
}
