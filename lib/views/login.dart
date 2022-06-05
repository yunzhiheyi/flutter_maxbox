// ignore_for_file: unused_import, library_private_types_in_public_api, unnecessary_new, avoid_returning_null_for_void, sort_child_properties_last, unnecessary_string_interpolations, prefer_const_constructors, avoid_unnecessary_containers, prefer_final_fields
import 'dart:async';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max_box/bloc/user/user_bloc.dart';
import 'package:max_box/router/Routes.dart';
import 'package:max_box/utils/adApt.dart';
import 'package:max_box/common/LoginPrivacy.dart';
import 'package:max_box/utils/api.dart';

import '../common/AppButton.dart';

// import 'dart:io';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController phoneController;
  String _phone = '';
  String _code = '';

  @override
  void initState() {
    // _statusBar();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _onPressedSubmit() async {
    BlocProvider.of<UserBloc>(context)
        .add(submitLogin(mobile: _phone, code: _code));
  }

  void _listenerLoginState(BuildContext context, UserState state) {
    if (state.status == LoginStatus.success) {
      Routes.navigateTo(context, '/home', {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
        body: BlocConsumer<UserBloc, UserState>(
            listener: _listenerLoginState,
            builder: (context, state) {
              return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    // 触摸收起键盘
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(
                            top: topPadding + Adapt.px(20), left: Adapt.px(35)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            if (state.isCheck) {
                              BlocProvider.of<UserBloc>(context)
                                  .add(onCheckBox(isCheck: false));
                            }
                          },
                          child: Icon(
                            Icons.close_rounded,
                            size: Adapt.px(44),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: Adapt.px(120),
                        height: Adapt.px(120),
                        margin: EdgeInsets.only(top: Adapt.px(165)),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(80.0)),
                            color: Color(0xFFFFFFFF)),
                      ),
                      Image.asset("assets/images/icon-logo.png",
                          width: Adapt.px(158), height: Adapt.px(101)),
                      AppButton(
                        title: '微信登录',
                        icon: Image.asset("assets/images/icon-wechat.png",
                            width: Adapt.px(36), height: Adapt.px(36)),
                        onTap: _onPressedSubmit,
                        color: Color(0xFF048748),
                        borderColor: Color(0xFF048748),
                        margin: EdgeInsets.fromLTRB(
                            Adapt.px(50), Adapt.px(35), Adapt.px(50), 0),
                      ),
                      AppButton(
                        title: '苹果登录',
                        icon: Image.asset("assets/images/icon-apple.png",
                            width: Adapt.px(36), height: Adapt.px(36)),
                        onTap: _onPressedSubmit,
                        margin: EdgeInsets.fromLTRB(
                            Adapt.px(50), Adapt.px(35), Adapt.px(50), 0),
                      ),
                      AppButton(
                        title: '手机号登录/注册',
                        type: 'text',
                        height: 50,
                        onTap: () {
                          Routes.navigateTo(context, '/login/code', {},
                              TransitionType.cupertino);
                        },
                        fontSize: Adapt.px(24),
                        textUnderline: true,
                        fontColor: Color(0xFF9E9E9E),
                        margin: EdgeInsets.fromLTRB(Adapt.px(50), Adapt.px(35),
                            Adapt.px(50), Adapt.px(20)),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.fromLTRB(
                              Adapt.px(55), Adapt.px(35), Adapt.px(45), 0),
                          child: const LoginPrivacy()),
                    ],
                  ));
            }));
  }
}
