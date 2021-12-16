import 'dart:convert';
// import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:max_box/utils/LocalStorage.dart';
import 'package:max_box/utils/tools.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
///加载动画
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Request {
  // 配置 Dio 实例
  static BaseOptions _options = BaseOptions(
    ///Api地址
    baseUrl: 'http://192.168.1.16:3000',

    ///打开超时时间
    connectTimeout: 50000,

    ///接收超时时间
    receiveTimeout: 30000,
  );
  // 创建 Dio 实例
  static Dio _dio = Dio(_options);

  // _request 是核心函数，所有的请求都会走这里
  // ignore: missing_return
  static Future _request<T>(String path,
      {method, Map<String, dynamic>? params}) async {
    // String _params;
    String? Token = await LocalStorage.get(LocalStorage.accessTokenKey);
    Map<String, dynamic> httpHeaders = {
      'Accept-Language': 'zh_CN',
      'Content-Type': 'application/json'
    };
    print('accessToken--------$Token');
    if (Token != null && Token.isNotEmpty) {
      httpHeaders['app-access-token'] = Token;
    }
    // get 请求处理
    if (params != null && method == 'get') {
      path = path + '?' + tools.serialization(params);
    }
    try {
      ///执行加载动画
      EasyLoading.show();
      print("path----${path}");
      print("params----${json.encode(params)}");
      print("method----${method}");
      Response<dynamic> response = await _dio.request(path,
          data: json.encode(params),
          options: Options(
            method: method,
            headers: httpHeaders,
            contentType: Headers.jsonContentType,
          ));
      // var data = jsonDecode(response.data);
      // var data = response.data;
      // print(response.statusCode);
      int? statusCode = response.statusCode;
      if (statusCode == 200 || statusCode == 201) {
        ///如果请求到，则关闭弹窗动画
        EasyLoading.dismiss();

        /// 格式化接收到的数据

        Map data = Map<String, dynamic>.from(response.data);

        // var data = response.data;
        try {
          // 如果状态吗不等于0，说明错误，则进行提示
          print('code');
          print(data['code']);
          if (data['code'] > 200 && data['code'] != 201) {
            EasyLoading.showToast("${data['message']}");
            return data;
          } else if (data['code'] == 4000) {
            /// 如果状态丢失了，将用户token数据清空，让引导页可以直接登录
            EasyLoading.showToast("当前数据状态丢失，请重新登录");
            return Future.error(data['message']);

            /// 这里写你的重新登录逻辑
          } else {
            ///其他状态说明正常
            return data;
          }
        } catch (e) {
          // LogUtil.v(e, tag: '解析响应数据异常');
          print('catch${e}');
          return Future.error('解析响应数据异常');
        }
      } else {
        // LogUtil.v(response.statusCode, tag: 'HTTP错误，状态码为：');
        EasyLoading.showToast('HTTP错误，状态码为：${statusCode}');
        _handleHttpError(statusCode!);
        return Future.error('HTTP错误');
      }
      // ignore: unused_catch_stack
    } on DioError catch (e, s) {
      // LogUtil.v(_dioError(e), tag: '请求异常');
      print('_DioError__${e}---${s}');
      EasyLoading.showToast(_dioError(e));
      return Future.error(_dioError(e));
      // ignore: unused_catch_stack
    } catch (e, s) {
      return Future.error('未知异常');
    }
  }

  // 处理 Dio 异常
  static String _dioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return "网络连接超时，请检查网络设置";
      case DioErrorType.receiveTimeout:
        return "服务器异常，请稍后重试！";
      case DioErrorType.sendTimeout:
        return "网络连接超时，请检查网络设置";
      case DioErrorType.response:
        return "服务器异常，请稍后重试！";
      case DioErrorType.cancel:
        return "请求已被取消，请重新请求";
      case DioErrorType.other:
        return "网络异常，请稍后重试！";
      default:
        return "Dio异常";
    }
  }

  // 处理 Http 错误码
  static void _handleHttpError(int errorCode) {
    String message;
    switch (errorCode) {
      case 400:
        message = '请求语法错误';
        break;
      case 401:
        message = '未授权，请登录';
        break;
      case 403:
        message = '拒绝访问';
        break;
      case 404:
        message = '请求出错';
        break;
      case 408:
        message = '请求超时';
        break;
      case 500:
        message = '服务器异常';
        break;
      case 501:
        message = '服务未实现';
        break;
      case 502:
        message = '网关错误';
        break;
      case 503:
        message = '服务不可用';
        break;
      case 504:
        message = '网关超时';
        break;
      default:
        message = '请求失败，错误码：$errorCode';
    }
    EasyLoading.showError(message);
  }

  static Future get<T>(String path, {Map<String, dynamic>? params}) {
    return _request(path, method: 'get', params: params);
  }

  static Future post<T>(String path, {Map<String, dynamic>? params}) {
    return _request(path, method: 'post', params: params);
  }
}
