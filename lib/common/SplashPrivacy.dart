// ignore_for_file: library_private_types_in_public_api, file_names, prefer_const_constructors, unnecessary_const, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:max_box/router/Routes.dart';

import '../utils/adApt.dart';

class SplashPrivacy extends StatefulWidget {
  final VoidCallback? onTap;
  final VoidCallback? onTapNo;
  const SplashPrivacy({Key? key, this.onTap, this.onTapNo}) : super(key: key);

  @override
  _SplashPrivacyState createState() => _SplashPrivacyState();
}

class _SplashPrivacyState extends State<SplashPrivacy> {
  late TapGestureRecognizer _tapServer;
  late TapGestureRecognizer _tapPolicy;
  @override
  void initState() {
    super.initState();
    _tapServer = TapGestureRecognizer()
      ..onTap = () {
        Routes.navigateTo(context, '/webview', {
          'url':
              'http://192.168.101.3:8080/user-statement?isHome=true&isNav=true&arrow=true',
          'isAppBar': 'true',
          'title': '用户协议'
        });
      };

    _tapPolicy = TapGestureRecognizer()
      ..onTap = () {
        Routes.navigateTo(context, '/webview', {
          'url':
              'http://192.168.101.3:8080/user-privacy?isHome=true&isNav=true&arrow=true',
          'isAppBar': 'true',
          'title': '隐私政策'
        });
      };
  }

  @override
  void dispose() {
    _tapServer.dispose(); // 销毁对象
    _tapPolicy.dispose(); // 销毁对象
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double size = Adapt.px(24);
    const Color textColor = Color(0xFF4D4D4D);
    return Column(children: [
      Container(
          padding: EdgeInsets.only(left: Adapt.px(25), right: Adapt.px(25)),
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text:
                    '感谢你选择蜜蜂转码APP，我们非常重视你的个人信息和隐私保护，为了更好地保障您的个人权益，请务必审慎阅读、充分理解',
                style: TextStyle(fontSize: size, color: textColor)),
            TextSpan(
                text: '《用户协议》',
                style: TextStyle(
                  color: Color(0xFF2C6FF6),
                  fontSize: size,
                ),
                recognizer: _tapServer),
            TextSpan(
                text: '和', style: TextStyle(fontSize: size, color: textColor)),
            TextSpan(
                text: '《隐私政策》',
                style: TextStyle(
                  color: Color(0xFF2C6FF6),
                  fontSize: size,
                ),
                recognizer: _tapPolicy),
            TextSpan(
                text: '各项条款，但不限于:',
                style: TextStyle(fontSize: size, color: textColor)),
          ]))),
      Container(
          padding: EdgeInsets.only(
              top: Adapt.px(10), left: Adapt.px(25), right: Adapt.px(25)),
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text:
                    '1、在你使用软件及服务的过程中，向你提供相关基本功能，我们将根据合法、正当、必要的原则，收集或使用必要的个人信息;',
                style: TextStyle(fontSize: size, color: textColor)),
          ]))),
      Container(
          padding: EdgeInsets.only(left: Adapt.px(25), right: Adapt.px(25)),
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: '2、基本您的授权, 我们可能会获取您的地理位置、通讯录、相机等相关软件权限;',
                style: TextStyle(fontSize: size, color: textColor)),
          ]))),
      Container(
          padding: EdgeInsets.only(left: Adapt.px(25), right: Adapt.px(25)),
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: '3、我们会采取符合标准的技术措施和数据安全措施来保护您个人信息安全;',
                style: TextStyle(fontSize: size, color: textColor)),
          ]))),
      Container(
          padding: EdgeInsets.only(left: Adapt.px(25), right: Adapt.px(25)),
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: '4、您可以查询、更正、管理个人信息，我们也提供账户注销渠道;',
                style: TextStyle(fontSize: size, color: textColor)),
          ]))),
      Container(
          padding: EdgeInsets.only(
              left: Adapt.px(25), top: Adapt.px(30), right: Adapt.px(25)),
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: '如您同意以上协议内容,请点击“同意”开始使用我们的产品和服务;',
                style: TextStyle(fontSize: size, color: textColor)),
          ])))
    ]);
  }
}
