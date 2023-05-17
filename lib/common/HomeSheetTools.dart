// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:fengchao/router/Routes.dart';
import 'package:fengchao/utils/adApt.dart';

class HomeSheetTools extends StatefulWidget {
  const HomeSheetTools({Key? key}) : super(key: key);
  @override
  _HomeSheetTools createState() => _HomeSheetTools();
}

class _HomeSheetTools extends State<HomeSheetTools> {
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
      height: Adapt.px(220),
      margin: EdgeInsets.fromLTRB(Adapt.px(25), Adapt.px(65), Adapt.px(25), 0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/icon-home-folder.png",
                      width: Adapt.px(120),
                      height: Adapt.px(120),
                    ),
                    Text(
                      '新建文件夹',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 126, 126, 126),
                        fontSize: Adapt.px(26),
                      ),
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/icon-home-text.png",
                      width: Adapt.px(120),
                      height: Adapt.px(120),
                    ),
                    Text(
                      '新建文本',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 126, 126, 126),
                        fontSize: Adapt.px(26),
                      ),
                    )
                  ],
                )),
                Expanded(
                    child: GestureDetector(
                        onTap: () => {Routes.navigateTo(context, '/test')},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/icon-home-import.png",
                              width: Adapt.px(120),
                              height: Adapt.px(120),
                            ),
                            Text(
                              '测试路由',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 126, 126, 126),
                                fontSize: Adapt.px(26),
                              ),
                            )
                          ],
                        )))
              ],
            ),
          ]),
    );
  }
}
