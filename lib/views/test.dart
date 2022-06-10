// ignore_for_file: unused_import, unnecessary_new, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:max_box/common/AppToBar.dart';
import 'package:max_box/router/Routes.dart';
import 'package:max_box/utils/adApt.dart';

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: testHome());
  }
}

class testHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const AppToBar(
        title: '测试路由',
      ),
      SizedBox(
        height: 20,
      ),
      Center(
          child: TextButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.grey, width: 1)),
              ),
              onPressed: () => {
                    Routes.navigateTo(
                        context, '/test2', {}, TransitionType.fadeIn)
                  },
              child: const Text('fadeIn'))),
      Center(
          child: TextButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.grey, width: 1)),
              ),
              onPressed: () => {
                    Routes.navigateTo(
                        context, '/test2', {}, TransitionType.material)
                  },
              child: const Text('material'))),
      Center(
          child: TextButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.grey, width: 1)),
              ),
              onPressed: () => {
                    Routes.navigateTo(context, '/test2', {},
                        TransitionType.materialFullScreenDialog)
                  },
              child: Text('materialFullScreenDialog'))),
      Center(
          child: TextButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.grey, width: 1)),
              ),
              onPressed: () => {
                    Routes.navigateTo(
                        context, '/test2', {}, TransitionType.inFromBottom)
                  },
              child: Text('inFromBottom'))),
      Center(
          child: TextButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.grey, width: 1)),
              ),
              onPressed: () => {
                    Routes.navigateTo(
                        context, '/test2', {}, TransitionType.inFromRight)
                  },
              child: Text('inFromRight'))),
      Center(
          child: TextButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.grey, width: 1)),
              ),
              onPressed: () => {
                    Routes.navigateTo(
                        context, '/test2', {}, TransitionType.inFromLeft)
                  },
              child: Text('inFromLeft'))),
      Center(
          child: TextButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.grey, width: 1)),
              ),
              onPressed: () => {
                    Routes.navigateTo(
                        context, '/test2', {}, TransitionType.inFromTop)
                  },
              child: Text('inFromTop'))),
      Center(
          child: TextButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.grey, width: 1)),
              ),
              onPressed: () => {
                    Routes.navigateTo(
                        context, '/test2', {}, TransitionType.native)
                  },
              child: Text('native'))),
      Center(
          child: TextButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.grey, width: 1)),
              ),
              onPressed: () => {
                    Routes.navigateTo(
                        context, '/test2', {}, TransitionType.nativeModal)
                  },
              child: Text('nativeModal'))),
      Center(
          child: TextButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.grey, width: 1)),
              ),
              onPressed: () => {
                    Routes.navigateTo(
                        context, '/test2', {}, TransitionType.cupertino)
                  },
              child: Text('cupertino'))),
      Center(
          child: TextButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.grey, width: 1)),
              ),
              onPressed: () => {
                    Routes.navigateTo(context, '/test2', {},
                        TransitionType.cupertinoFullScreenDialog)
                  },
              child: Text('cupertinoFullScreenDialog')))
    ]);
  }
}
