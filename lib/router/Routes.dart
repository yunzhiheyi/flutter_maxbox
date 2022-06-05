// ignore_for_file: unnecessary_string_escapes, prefer_interpolation_to_compose_strings, file_names, avoid_print, prefer_const_constructors

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:max_box/views/teleprompter.dart';
import 'package:max_box/views/teleprompterText.dart';
import 'package:max_box/views/test.dart';
import '../views/login.dart';
import '../views/splash.dart';
import '../views/watermark.dart';
import '../views/webview.dart';
import '../views/test.dart';
import '../views/test2.dart';
import '../layout.dart';
import '../views/loginCode.dart';
import '../views/teleprompter.dart';

class Routes {
  static final router = FluroRouter();
  static Map<String, String> paramsData(params) {
    Map<String, String> dada = {};
    for (var key in params.keys) {
      dada[key] = params[key][0];
    }
    return dada;
  }

  static void configureRoutes() {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return;
    });
    //配置首页
    router.define('/splash', handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return Splash();
    }));
    //配置首页
    router.define('/home', handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return Layout();
    }));
    //配置登录页
    router.define('/login', handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const Login();
    }));
    router.define('/login/code', handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return const LoginCode();
    }));
    //提词器
    router.define('/teleprompter', handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return TeleprompterIndex();
    }));
    //提词器编辑
    router.define('/teleprompter/text', handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return TeleprompterText(params: paramsData(params));
    }));
    //去水印
    router.define('/watermark', handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return WatermarkIndex(params: paramsData(params));
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
