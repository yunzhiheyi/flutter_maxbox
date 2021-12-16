import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max_box/bloc/user/user_bloc.dart';
import 'package:max_box/router/Routes.dart';

class LoginPrivacy extends StatefulWidget {
  @override
  _LoginPrivacyState createState() => _LoginPrivacyState();
}

class _LoginPrivacyState extends State<LoginPrivacy> {
  final TextStyle linkStyle = const TextStyle(
      color: Colors.blue,
      decoration: TextDecoration.underline,
      decorationColor: Colors.blue);
  var isCheck = false;
  final TextStyle defaultStyle = const TextStyle();

  late TapGestureRecognizer _tapServer;
  late TapGestureRecognizer _tapPolicy;

  @override
  void initState() {
    super.initState();
    _tapServer = TapGestureRecognizer()
      ..onTap = () {
        Routes.navigateTo(context, '/webview', {
          'url':
              'http://192.168.1.16:8081/user-statement?isHome=true&isNav=true&arrow=true',
          'isAppBar': 'true',
          'title': '用户协议'
        });
      };

    _tapPolicy = TapGestureRecognizer()
      ..onTap = () {
        Routes.navigateTo(context, '/webview', {
          'url':
              'http://192.168.1.16:8081/user-privacy?isHome=true&isNav=true&arrow=true',
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

  Future<void> _onChanged(value) async {
    // setState(() {
    //   isCheck = !isCheck;
    // });
    BlocProvider.of<UserBloc>(context).add(onCheckBox(isCheck: !isCheck));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
        // listener: _CheckBoxState,
        builder: (context, state) {
      return Text.rich(TextSpan(children: [
        WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Checkbox(
                value: state.isCheck,
                shape: CircleBorder(
                    side: BorderSide(width: 1, color: Colors.green)),
                activeColor: Colors.orange,
                onChanged: _onChanged)),
        TextSpan(text: '我已阅读 '),
        TextSpan(text: '服务条款', style: linkStyle, recognizer: _tapServer),
        TextSpan(
          text: ' 和 ',
        ),
        TextSpan(text: '隐私政策', style: linkStyle, recognizer: _tapPolicy),
      ]));
    });
  }
}
