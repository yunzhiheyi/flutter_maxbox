import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:max_box/views/test.dart';
import '../views/webview.dart';
import '../views/test.dart';
import '../views/test2.dart';
import '../layout.dart';
import '../views/login.dart';

class Routes {
  static final router = FluroRouter();
  static void configureRoutes() {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    //配置首页
    router.define('/home', handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return Layout();
    }));
    //配置登录页
    router.define('/login', handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return Login();
    }));
    //配置webview
    router.define('/test', handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return test();
    }));
    //配置webview
    router.define('/test2', handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return test2();
    }));
    //配置webview
    router.define('/webview', handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return WebviewH5(
        url: params['url'][0],
        isAppBar: params['isAppBar'][0] == 'true',
        title: params['title'][0] ?? '',
      );
    }));
  }

  static navigateTo(BuildContext context, String path,
      [Map<String, dynamic>? params, transition]) {
    String query = "";
    int index = 0;
    if (params != null) {
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        print(query);
        index++;
      }
      path = path + query;
    }
    router.navigateTo(
      context,
      path,
      transition: transition ?? TransitionType.cupertino,
    );
  }
}
