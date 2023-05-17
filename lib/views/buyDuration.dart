// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_new, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously, unused_import, avoid_unnecessary_containers, avoid_print, unnecessary_null_comparison, must_be_immutable, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_element, file_names

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fengchao/router/Routes.dart';
import 'package:fengchao/utils/LocalStorage.dart';
import 'package:fengchao/utils/adApt.dart';

import '../common/AppButton.dart';
import '../common/AppToBar.dart';
import '../common/ItemPrice.dart';

class BuyDuration extends StatefulWidget {
  Map<String, dynamic> params;
  BuyDuration({
    Key? key,
    required this.params,
  }) : super(key: key);
  @override
  _BuyDurationState createState() => new _BuyDurationState();
}

class _BuyDurationState extends State<BuyDuration> {
  late int groupValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
        appBar: AppToBar(title: '购买时长'),
        body: Column(children: [
          Container(
              margin: EdgeInsets.only(
                  top: Adapt.px(18), left: Adapt.px(36), right: Adapt.px(36)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '剩余时长：',
                      style: TextStyle(
                          fontSize: Adapt.px(24), color: Colors.white),
                    ),
                    Text(
                      '19时38分4秒',
                      style: TextStyle(
                          fontSize: Adapt.px(24), color: Colors.white),
                    ),
                  ])),
          Container(
              height: Adapt.px(1),
              color: Color.fromARGB(255, 127, 127, 127),
              margin: EdgeInsets.fromLTRB(
                  Adapt.px(36), Adapt.px(25), Adapt.px(36), Adapt.px(25))),
          Container(
              margin: EdgeInsets.fromLTRB(Adapt.px(20), 0, Adapt.px(20), 0),
              child: Row(children: [
                Expanded(
                    child: ItemPrice(
                  price: '268',
                  originalPprice: '369',
                  time: '100小时',
                  onChange: (int num) {
                    setState(() {
                      groupValue = num;
                    });
                  },
                  value: 1,
                  groupValue: groupValue,
                )),
                Expanded(
                    child: ItemPrice(
                  price: '86',
                  originalPprice: '118',
                  time: '30小时',
                  onChange: (int num) {
                    setState(() {
                      groupValue = num;
                    });
                  },
                  value: 2,
                  groupValue: groupValue,
                )),
                Expanded(
                    child: ItemPrice(
                  price: '36',
                  originalPprice: '89',
                  time: '12小时',
                  onChange: (int num) {
                    setState(() {
                      groupValue = num;
                    });
                  },
                  value: 3,
                  groupValue: groupValue,
                )),
              ])),
          Container(
              margin: EdgeInsets.fromLTRB(Adapt.px(36), 0, Adapt.px(36), 0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                  child: AppButton(
                    title: '支付宝支付',
                    height: 78,
                    icon: Image.asset("assets/images/icon-ali-pay.png",
                        width: Adapt.px(40), height: Adapt.px(40)),
                    color: Color(0xFF699EF0),
                    radius: 6,
                    borderColor: Color(0xFF699EF0),
                    margin: EdgeInsets.only(
                        top: Adapt.px(36),
                        bottom: Adapt.px(30),
                        right: Adapt.px(23)),
                    onTap: () {
                      print('去配音');
                    },
                  ),
                ),
                Expanded(
                    child: AppButton(
                  title: '微信支付',
                  icon: Image.asset("assets/images/icon-wechat-pay.png",
                      width: Adapt.px(40), height: Adapt.px(40)),
                  height: 78,
                  color: Color(0xFF048748),
                  radius: 6,
                  borderColor: Color(0xFF048748),
                  margin: EdgeInsets.only(
                      left: Adapt.px(23),
                      top: Adapt.px(36),
                      bottom: Adapt.px(30)),
                  onTap: () {
                    print('复制');
                  },
                ))
              ])),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                left: Adapt.px(36), top: Adapt.px(16), right: Adapt.px(36)),
            child: Text('购买说明：',
                style: TextStyle(
                    fontSize: Adapt.px(28),
                    color: Color.fromARGB(255, 170, 170, 170))),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                left: Adapt.px(36), top: Adapt.px(16), right: Adapt.px(36)),
            child: Text('1、购买时长不会过期，用完即止',
                style: TextStyle(
                    fontSize: Adapt.px(24),
                    color: Color.fromARGB(255, 170, 170, 170))),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                left: Adapt.px(36), top: Adapt.px(10), right: Adapt.px(36)),
            child: Text('2、转换准确度与语音效果有关，虚拟服务购买后恕不能退款',
                style: TextStyle(
                    fontSize: Adapt.px(24),
                    color: Color.fromARGB(255, 170, 170, 170))),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                left: Adapt.px(36), top: Adapt.px(10), right: Adapt.px(36)),
            child: Text('3、如需要发票，可在购买后添加客服微信开具',
                style: TextStyle(
                    fontSize: Adapt.px(24),
                    color: Color.fromARGB(255, 170, 170, 170))),
          ),
          AppButton(
              title: '确认支付',
              type: 'gradient',
              onTap: () {
                print('重新购买');
              },
              // width: 104,
              fontSize: Adapt.px(28),
              padding: EdgeInsets.fromLTRB(Adapt.px(10), 0, Adapt.px(10), 0),
              margin: EdgeInsets.only(top: Adapt.px(60)),
              radius: 32)
        ]));
  }
}
