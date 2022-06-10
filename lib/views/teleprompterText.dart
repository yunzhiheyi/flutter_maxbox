// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, must_call_super, prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, non_constant_identifier_names, avoid_print, unnecessary_brace_in_string_interps, unused_field, unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';

import '../common/AppButton.dart';
import '../common/AppToBar.dart';
import '../utils/adApt.dart';

class TeleprompterText extends StatefulWidget {
  Map<String, dynamic> params;
  TeleprompterText({
    Key? key,
    required this.params,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => TeleprompterTextState();
}

class TeleprompterTextState extends State<TeleprompterText>
    with SingleTickerProviderStateMixin {
  late TextEditingController _TextEditController;
  late TextEditingController _ContentEditController;
  late String title = '';
  late String content = '';
  bool isTFocus = false;
  bool isCFocus = false;

  @override
  void initState() {
    _TextEditController = TextEditingController();
    _ContentEditController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
        body: GestureDetector(
          onTap: () {
            // 触摸收起键盘
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(children: <Widget>[
            AppToBar(
                title: widget.params['type'] == 'add' ? '添加文本' : '编辑文本',
                rightChild: AppButton(
                    title: '保存',
                    type: 'gradient',
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          barrierColor: Color(0x2DD1D1D1),
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return Container(
                                height: Adapt.px(298) + Adapt.padBotH(),
                                alignment: Alignment.topCenter,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(12.0))),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: Adapt.px(80),
                                          padding: EdgeInsets.only(
                                              top: Adapt.px(22)),
                                          alignment: Alignment.center,
                                          child: Text('保存去提词',
                                              style: TextStyle(
                                                  fontSize: Adapt.px(28)))),
                                      Divider(
                                        color:
                                            Color.fromARGB(255, 216, 216, 216),
                                      ),
                                      Container(
                                          height: Adapt.px(70),
                                          alignment: Alignment.center,
                                          child: Text('保存后返回',
                                              style: TextStyle(
                                                  fontSize: Adapt.px(28)))),
                                      Divider(
                                        color:
                                            Color.fromARGB(255, 216, 216, 216),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                              height: Adapt.px(70),
                                              alignment: Alignment.center,
                                              child: Text('取消',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          135, 135, 135, 1),
                                                      fontSize:
                                                          Adapt.px(28))))),
                                    ]));
                          });
                    },
                    width: 90,
                    height: 40,
                    fontSize: Adapt.px(24),
                    padding: EdgeInsets.only(bottom: Adapt.px(2)),
                    margin: EdgeInsets.all(0),
                    radius: 40)),
            Container(
                height: Adapt.px(80),
                margin: EdgeInsets.fromLTRB(
                    Adapt.px(30), Adapt.px(10), Adapt.px(30), 0),
                padding: EdgeInsets.fromLTRB(Adapt.px(30), 0, Adapt.px(30), 0),
                decoration: BoxDecoration(
                  color: Color(0xFF383838),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(
                      color: isTFocus
                          ? Color.fromARGB(255, 157, 157, 157)
                          : Color(0xFF383838),
                      width: 0.5),
                ),
                child: Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        isTFocus = hasFocus;
                        if (!hasFocus) {
                          title = _TextEditController.text;
                        }
                      });
                    },
                    child: TextField(
                      controller: _TextEditController,
                      onChanged: (val) {
                        setState(() {
                          title = _TextEditController.text;
                        });
                        // print('onChanged_${val}');
                      },
                      //限制长度
                      onEditingComplete: () {
                        // print('onEditingComplete');
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      onSubmitted: (val) {
                        // print('onSubmitted_${val}');
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      // autofocus: true,
                      maxLength: 30,
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      decoration: InputDecoration(
                          counterText: '',
                          counterStyle: TextStyle(color: Colors.grey),
                          // contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                          focusColor: Color.fromARGB(255, 255, 255, 255),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 1),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(0, 32, 31, 31)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00000000)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          hintText: '请输入标题',
                          suffixText: '${title.length}/30',
                          suffixStyle: TextStyle(color: Colors.grey),
                          hintStyle: TextStyle(
                              fontSize: Adapt.px(28), color: Colors.grey),
                          hintMaxLines: 1),
                    ))),
            Expanded(
              flex: 1,
              child: Container(
                  height: Adapt.px(80),
                  margin: EdgeInsets.fromLTRB(Adapt.px(30), Adapt.px(30),
                      Adapt.px(30), Adapt.px(30) + bottomPadding),
                  padding: EdgeInsets.fromLTRB(
                      Adapt.px(24), Adapt.px(20), Adapt.px(24), Adapt.px(20)),
                  decoration: BoxDecoration(
                    color: Color(0xFF383838),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    border: Border.all(
                        color: isCFocus
                            ? Color.fromARGB(255, 157, 157, 157)
                            : Color(0xFF383838),
                        width: 0.5),
                  ),
                  child: Column(children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Focus(
                            onFocusChange: (hasFocus) {
                              setState(() {
                                isCFocus = hasFocus;
                                if (!hasFocus) {
                                  content = _ContentEditController.text;
                                }
                              });
                            },
                            child: TextField(
                              controller: _ContentEditController,
                              onChanged: (val) {
                                setState(() {
                                  content = _ContentEditController.text;
                                });
                                // print('onChanged_${val}');
                              },
                              maxLines: 34,
                              //限制长度
                              onEditingComplete: () {
                                // print('onEditingComplete');
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                              onSubmitted: (val) {
                                // print('onSubmitted_${val}');
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                              // autofocus: true,
                              maxLength: 6000,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              decoration: InputDecoration(
                                  counterText: '',
                                  counterStyle: TextStyle(color: Colors.grey),
                                  // contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                                  focusColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 1),
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
                                  hintText: '请输入内容',
                                  // suffixText: '${content.length}/600',
                                  // suffixStyle: TextStyle(color: Colors.grey),
                                  hintStyle: TextStyle(
                                      fontSize: Adapt.px(28),
                                      color: Colors.grey),
                                  hintMaxLines: 1),
                            ))),
                    Container(
                        alignment: Alignment.bottomRight,
                        child: Visibility(
                            visible: isCFocus,
                            child: Text(
                              '${content.length}/6000',
                              style: TextStyle(color: Colors.grey),
                            )))
                  ])),
            )
          ]),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _TextEditController.clear();
    _ContentEditController.clear();
  }
}
