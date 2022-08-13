// ignore_for_file: library_private_types_in_public_api, file_names, prefer_const_constructors, unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max_box/bloc/user/user_bloc.dart';
import 'package:max_box/router/Routes.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../utils/adApt.dart';

class LogoutPrivacy extends StatefulWidget {
  const LogoutPrivacy({Key? key}) : super(key: key);

  @override
  _LogoutPrivacyState createState() => _LogoutPrivacyState();
}

class _LogoutPrivacyState extends State<LogoutPrivacy> {
  var isCheck = false;
  final TextStyle defaultStyle = const TextStyle();

  late TapGestureRecognizer _tapServer;
  late TapGestureRecognizer _tapText;
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

    _tapText = TapGestureRecognizer()
      ..onTap = () {
        BlocProvider.of<UserBloc>(context).add(onCheckBox(isCheck: !isCheck));
      };
  }

  @override
  void dispose() {
    _tapServer.dispose(); // 销毁对象
    _tapText.dispose(); // 销毁对象
    super.dispose();
  }

  Future<void> _onChanged(value) async {
    BlocProvider.of<UserBloc>(context).add(onCheckBox(isCheck: !isCheck));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Text.rich(TextSpan(children: [
        WidgetSpan(
          alignment: PlaceholderAlignment.bottom,
          child: RoundCheckBox(
            onTap: _onChanged,
            size: Adapt.px(28),
            isChecked: state.isCheck,
            borderColor:
                state.isCheck ? Color.fromRGBO(62, 90, 228, 1) : Colors.white,
            checkedColor: Color.fromRGBO(62, 90, 228, 1),
            checkedWidget:
                Icon(Icons.check, size: Adapt.px(20), color: Colors.white),
          ),
        ),
        TextSpan(
            text: '  我已阅读',
            style: TextStyle(
                fontSize: Adapt.px(26),
                color: Color.fromRGBO(158, 158, 158, 1)),
            recognizer: _tapText),
        TextSpan(
            text: '《账号注销协议》',
            style: TextStyle(
              color: Colors.white,
              fontSize: Adapt.px(26),
              // decoration: TextDecoration.underline,
            ),
            recognizer: _tapServer),
      ]));
    });
  }
}
