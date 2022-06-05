// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:max_box/common/AppToBar.dart';

class test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: testHome());
  }
}

class testHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppToBar(
          title: '二级测试路由',
          child: Text(''),
        ),
        Expanded(
            child: Center(
                child: TextButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          BorderSide(color: Colors.grey, width: 1)),
                    ),
                    onPressed: () => {Navigator.of(context)..pop()},
                    child: Text('返回上一级'))))
      ],
    );
  }
}
