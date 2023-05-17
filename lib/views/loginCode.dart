// ignore_for_file: unused_import, library_private_types_in_public_api, unnecessary_new, avoid_returning_null_for_void, sort_child_properties_last, unnecessary_string_interpolations, prefer_const_constructors, avoid_unnecessary_containers, file_names
import 'dart:async';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fengchao/bloc/user/user_bloc.dart';
import 'package:fengchao/router/Routes.dart';
import 'package:fengchao/utils/adApt.dart';
import 'package:fengchao/common/LoginPrivacy.dart';
import 'package:fengchao/utils/api.dart';

import '../common/AppButton.dart';

// import 'dart:io';
class LoginCode extends StatefulWidget {
  const LoginCode({Key? key}) : super(key: key);

  @override
  _LoginCodeState createState() => new _LoginCodeState();
}

class _LoginCodeState extends State<LoginCode> {
  late TextEditingController phoneController;
  String _phone = '';
  String _code = '';
  bool isButtonEnable = true; //按钮状态  是否可点击
  String buttonText = '发送验证码'; //初始文本
  int count = 60; //初始倒计时时间
  late Timer timer; //倒计时的计时器

  void _buttonClickListen() {
    setState(() {
      if (isButtonEnable) {
        //当按钮可点击时
        BlocProvider.of<UserBloc>(context).add(getCode(mobile: _phone));
        return null; //返回null按钮禁止点击
      } else {
        //当按钮不可点击时
        return null; //返回null按钮禁止点击
      }
    });
  }

  void _initTimer() {
    timer = new Timer.periodic(const Duration(seconds: 1), (Timer timer) {
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

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _onPressedSubmit() async {
    BlocProvider.of<UserBloc>(context)
        .add(submitLogin(mobile: _phone, code: _code));
  }

  void _listenerLoginState(BuildContext context, UserState state) {
    // 登录成功
    if (state.status == LoginStatus.success) {
      Routes.navigateTo(context, '/home', {});
    }
    // 验证码发送成功
    if (state.codeVerified == VerifiedStatus.success) {
      _initTimer();
      isButtonEnable = true; //按钮状态标记
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
                            top: topPadding + Adapt.px(20), left: Adapt.px(45)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            if (state.isCheck) {
                              BlocProvider.of<UserBloc>(context)
                                  .add(onCheckBox(isCheck: false));
                            }
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: Adapt.px(34),
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
                      Container(
                          height: Adapt.px(80),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(80.0)),
                            border: Border.all(
                                color: Color.fromARGB(255, 168, 167, 167),
                                width: 0.5),
                          ),
                          padding: EdgeInsets.only(left: Adapt.px(30)),
                          margin: EdgeInsets.fromLTRB(
                              Adapt.px(50), Adapt.px(75), Adapt.px(50), 0),
                          child: Row(children: <Widget>[
                            Flexible(
                                child: TextField(
                              maxLength: 11,
                              keyboardType: TextInputType.number,
                              onChanged: (val) => _phone = val,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              decoration: InputDecoration(
                                  counterText: '',
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 1),
                                  counterStyle: TextStyle(color: Colors.grey),
                                  // contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                                  focusColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(0, 32, 31, 31)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0x00000000)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                  hintText: '请输入手机号码',
                                  hintStyle: TextStyle(
                                      fontSize: Adapt.px(26),
                                      color: Color.fromRGBO(158, 158, 158, 1)),
                                  hintMaxLines: 1),
                            )),
                          ])),
                      Container(
                          height: Adapt.px(80),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(80.0)),
                            border: Border.all(
                                color: Color.fromARGB(255, 168, 167, 167),
                                width: 0.5),
                          ),
                          padding: EdgeInsets.only(left: Adapt.px(30)),
                          margin: EdgeInsets.fromLTRB(
                              Adapt.px(50), Adapt.px(35), Adapt.px(50), 0),
                          child: Row(children: [
                            Expanded(
                                flex: 1,
                                child: TextField(
                                  maxLength: 6,
                                  keyboardType: TextInputType.number,
                                  onChanged: (val) => _code = val,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  decoration: InputDecoration(
                                      counterText: '',
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 1),
                                      focusColor:
                                          Color.fromRGBO(255, 255, 255, 1),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0x00FF0000)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100))),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0x00000000)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100))),
                                      hintText: '请输入验证码',
                                      hintStyle: TextStyle(
                                          fontSize: Adapt.px(26),
                                          color:
                                              Color.fromRGBO(158, 158, 158, 1)),
                                      hintMaxLines: 1),
                                )),
                            TextButton(
                                child: Text('$buttonText',
                                    style: TextStyle(
                                        color: isButtonEnable
                                            ? Colors.white
                                            : Colors.grey,
                                        fontSize: Adapt.px(26))),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) {
                                      //默认不使用背景颜色
                                      return null;
                                    }),
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(100, 30)),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.only(
                                            top: 0, bottom: 0)),
                                    shape: MaterialStateProperty.all(
                                        const StadiumBorder())), // 圆角),
                                onPressed: _buttonClickListen)
                          ])),
                      AppButton(
                        title: '立即登录',
                        type: 'gradient',
                        onTap: _onPressedSubmit,
                        margin: EdgeInsets.fromLTRB(
                            Adapt.px(50), Adapt.px(35), Adapt.px(50), 0),
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
