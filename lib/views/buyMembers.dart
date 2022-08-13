// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_new, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously, unused_import, avoid_unnecessary_containers, avoid_print, unnecessary_null_comparison, must_be_immutable, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_element, file_names

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:max_box/router/Routes.dart';
import 'package:max_box/utils/LocalStorage.dart';
import 'package:max_box/utils/adApt.dart';

import '../common/AppButton.dart';
import '../common/AppToBar.dart';
import '../common/ItemPrice.dart';

class BuyMembers extends StatefulWidget {
  Map<String, dynamic> params;
  BuyMembers({
    Key? key,
    required this.params,
  }) : super(key: key);
  @override
  _BuyMembersState createState() => new _BuyMembersState();
}

class _BuyMembersState extends State<BuyMembers> {
  late int groupValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
        appBar: AppToBar(title: '会员购买'),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Container(
                  margin: EdgeInsets.fromLTRB(
                      Adapt.px(20), Adapt.px(20), Adapt.px(20), 0),
                  child: Row(children: [
                    Expanded(
                        child: ItemPrice(
                      price: '298',
                      originalPprice: '369',
                      time: '永久会员',
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
                      price: '99',
                      originalPprice: '118',
                      time: '专业会员',
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
                      price: '19',
                      originalPprice: '39',
                      time: '高级会员',
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
                margin: EdgeInsets.fromLTRB(
                    Adapt.px(36), Adapt.px(26), Adapt.px(36), Adapt.px(16)),
                padding: EdgeInsets.only(
                    top: Adapt.px(16),
                    right: Adapt.px(26),
                    left: Adapt.px(26),
                    bottom: Adapt.px(16)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    color: Color.fromARGB(255, 62, 61, 61),
                    border: Border.all(
                        color: Color.fromARGB(255, 141, 141, 141), width: 0.5)),
                child: Wrap(
                  children: [
                    SizedBox(
                      height: Adapt.px(54),
                      child: Padding(
                          padding: EdgeInsets.only(left: Adapt.px(14)),
                          child: Text('会员权益',
                              style: TextStyle(
                                  fontSize: Adapt.px(28),
                                  color: Color(0xFFAAAAAA)))),
                    ),
                    SizedBox(
                      height: Adapt.px(54),
                      child: GridTileBar(
                        leading: Icon(Icons.check,
                            size: Adapt.px(24), color: Colors.white),
                        title: Text('附赠时长20小时',
                            style: TextStyle(
                                fontSize: Adapt.px(24),
                                color: Color(0xFFCFCFCF))),
                      ),
                    ),
                    SizedBox(
                        height: Adapt.px(54),
                        child: GridTileBar(
                          leading: Icon(Icons.check,
                              size: Adapt.px(24), color: Colors.white),
                          title: Text('购买时长卡8折',
                              style: TextStyle(
                                  fontSize: Adapt.px(24),
                                  color: Color(0xFFCFCFCF))),
                        )),
                    SizedBox(
                        height: Adapt.px(54),
                        child: GridTileBar(
                          leading: Icon(Icons.check,
                              size: Adapt.px(24), color: Colors.white),
                          title: Text('所有高级会员的功能与服务',
                              style: TextStyle(
                                  fontSize: Adapt.px(24),
                                  color: Color(0xFFCFCFCF))),
                        )),
                    SizedBox(
                        height: Adapt.px(54),
                        child: GridTileBar(
                          leading: Icon(Icons.check,
                              size: Adapt.px(24), color: Colors.white),
                          title: Text('视频和记录缓存云端3个月',
                              style: TextStyle(
                                  fontSize: Adapt.px(24),
                                  color: Color(0xFFCFCFCF))),
                        )),
                    SizedBox(
                        height: Adapt.px(54),
                        child: GridTileBar(
                          leading: Icon(Icons.check,
                              size: Adapt.px(24), color: Colors.white),
                          title: Text('专属客服，1V1解决问题',
                              style: TextStyle(
                                  fontSize: Adapt.px(24),
                                  color: Color(0xFFCFCFCF))),
                        )),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(Adapt.px(36), 0, Adapt.px(36), 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                child: Text('会员说明:',
                    style: TextStyle(
                        fontSize: Adapt.px(28),
                        color: Color.fromARGB(255, 170, 170, 170))),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                    left: Adapt.px(36), top: Adapt.px(16), right: Adapt.px(36)),
                child: Text('1、如果在转换过程中任务失败或无法使用等产品问题，可联系客服处理',
                    style: TextStyle(
                        fontSize: Adapt.px(24),
                        color: Color.fromARGB(255, 170, 170, 170))),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                    left: Adapt.px(36), top: Adapt.px(10), right: Adapt.px(36)),
                child: Text('2、 时长计算基于音视频时长，仅提交任务需消耗时长，时长永久有效，不会过期。',
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
                  padding:
                      EdgeInsets.fromLTRB(Adapt.px(10), 0, Adapt.px(10), 0),
                  margin: EdgeInsets.only(top: Adapt.px(60)),
                  radius: 32)
            ])));
  }
}
