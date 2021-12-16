import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max_box/bloc/user/user_bloc.dart';
import 'package:max_box/bloc/user/user_bloc.dart';
import 'package:max_box/router/Routes.dart';
import 'package:max_box/utils/adApt.dart';
import 'package:max_box/common/LoginPrivacy.dart';
import 'package:max_box/utils/api.dart';

// import 'dart:io';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController phoneController;
  // ignore: unused_field
  String _phone = '';
  // ignore: unused_field
  String _code = '';
  bool isButtonEnable = true; //按钮状态  是否可点击
  String buttonText = '发送验证码'; //初始文本
  int count = 60; //初始倒计时时间
  late Timer timer; //倒计时的计时器

  void _buttonClickListen() {
    setState(() {
      if (isButtonEnable) {
        //当按钮可点击时
        isButtonEnable = false; //按钮状态标记
        _initTimer();
        BlocProvider.of<UserBloc>(context).add(getCode(mobile: _phone));
        return null; //返回null按钮禁止点击
      } else {
        //当按钮不可点击时
//        debugPrint('false');
        return null; //返回null按钮禁止点击
      }
    });
  }

  void _initTimer() {
    timer = new Timer.periodic(Duration(seconds: 1), (Timer timer) {
      count--;
      setState(() {
        if (count == 0) {
          timer.cancel(); //倒计时结束取消定时器
          isButtonEnable = true; //按钮可点击
          count = 60; //重置时间
          buttonText = '发送验证码'; //重置按钮文本
        } else {
          buttonText = '$count秒重新发送'; //更新文本内容
        }
      });
    });
  }

  @override
  void initState() {
    // _statusBar();
    phoneController = TextEditingController();
    super.initState();
  }

  Future<void> _onPressedSubmit() async {
    BlocProvider.of<UserBloc>(context)
        .add(submitLogin(mobile: _phone, code: _code));
  }

  void _listenerLoginState(BuildContext context, UserState state) {
    print('UserState----');
    if (state.status == LoginStatus.success) {
      Routes.navigateTo(context, '/home', {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            Adapt.px(45),
                            Adapt.px(180 + topPadding),
                            Adapt.px(45),
                            Adapt.px(100)),
                        child: Text('手机号注册/登录',
                            style: TextStyle(
                              fontSize: Adapt.px(48),
                            )),
                      ),
                      Container(
                          height: Adapt.px(80),
                          margin: EdgeInsets.fromLTRB(
                              Adapt.px(0), Adapt.px(35), Adapt.px(60), 0),
                          child: Row(children: <Widget>[
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    Adapt.px(60), 0, Adapt.px(30), 0),
                                child: Text('+86',
                                    style: TextStyle(
                                      fontSize: Adapt.px(30),
                                    ))),
                            Flexible(
                                child: TextField(
                              maxLength: 11,
                              keyboardType: TextInputType.number,
                              onChanged: (val) => this._phone = val,
                              decoration: InputDecoration(
                                  counterText: '',
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 1),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0x00FF0000)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0x00000000)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                  hintText: '请输入手机号码',
                                  hintStyle: TextStyle(
                                      fontSize: Adapt.px(30),
                                      color: Colors.grey),
                                  hintMaxLines: 1),
                            )),
                          ])),
                      Divider(
                        height: 10,
                        thickness: 0.5,
                        color: Color.fromARGB(255, 221, 220, 220),
                        indent: Adapt.px(45),
                        endIndent: Adapt.px(45),
                      ),
                      Container(
                          height: Adapt.px(80),
                          margin: EdgeInsets.fromLTRB(
                              Adapt.px(60), Adapt.px(35), Adapt.px(60), 0),
                          child: Stack(children: <Widget>[
                            TextField(
                              maxLength: 6,
                              keyboardType: TextInputType.number,
                              onChanged: (val) => this._code = val,
                              decoration: InputDecoration(
                                  counterText: '',
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 1),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0x00FF0000)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0x00000000)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                  hintText: '请输入验证码',
                                  hintStyle: TextStyle(
                                      fontSize: Adapt.px(30),
                                      color: Colors.grey),
                                  hintMaxLines: 1),
                            ),
                            Positioned(
                                top: -Adapt.px(10),
                                right: 0,
                                child: TextButton(
                                    child: Text('$buttonText',
                                        style: TextStyle(
                                            color: isButtonEnable
                                                ? Colors.orange
                                                : Colors.grey,
                                            fontSize: Adapt.px(24))),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          //默认不使用背景颜色
                                          return null;
                                        }),
                                        side: MaterialStateProperty.all(
                                            BorderSide(
                                                color: isButtonEnable
                                                    ? Colors.orange
                                                    : Colors.grey,
                                                width: 1)),
                                        minimumSize: MaterialStateProperty.all(
                                            Size(100, 30)),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.only(top: 0, bottom: 0)),
                                        shape: MaterialStateProperty.all(
                                            StadiumBorder())), // 圆角),
                                    onPressed: _buttonClickListen))
                          ])),
                      Divider(
                        height: 10,
                        thickness: 0.5,
                        color: Color.fromARGB(255, 221, 220, 220),
                        indent: Adapt.px(45),
                        endIndent: Adapt.px(45),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(
                              Adapt.px(25), 0, Adapt.px(45), 0),
                          child: LoginPrivacy()),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            Adapt.px(45), Adapt.px(35), Adapt.px(45), 0),
                        child: RawMaterialButton(
                          elevation: 1,
                          fillColor: Colors.orange,
                          splashColor: Colors.blue,
                          textStyle: TextStyle(color: Colors.white),
                          onLongPress: () => print('onLongPress'),
                          child: Text('立即登录',
                              style: TextStyle(fontSize: Adapt.px(34))),
                          constraints: BoxConstraints(
                              minHeight: Adapt.px(90), minWidth: Adapt.px(670)),
                          onPressed: _onPressedSubmit,
                          shape: StadiumBorder(), // 圆角
                        ),
                      ),
                    ],
                  ));
            }));
  }
}
