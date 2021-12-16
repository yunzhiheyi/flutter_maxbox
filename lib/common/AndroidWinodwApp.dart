import 'package:android_window/android_window.dart';
import 'package:flutter/material.dart';
import 'package:max_box/utils/adApt.dart';

class AndroidWindowApp extends StatelessWidget {
  const AndroidWindowApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AndroidWindow(
      child: Scaffold(
        backgroundColor: Colors.lightGreen.withOpacity(0.8),
        body: Container(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        Adapt.px(600), 0, Adapt.px(60), Adapt.px(220)),
                    height: Adapt.px(180),
                    child: TextButton(
                        onPressed: () {
                          AndroidWindow.close();
                        },
                        child: Icon(
                          Icons.close,
                          size: Adapt.px(62),
                          color: Colors.white,
                        )),
                  ),
                  Text('我是一个悬浮窗'),
                ])),
      ),
    );
  }
}
