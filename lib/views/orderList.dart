// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_new, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously, unused_import, avoid_unnecessary_containers, avoid_print, unnecessary_null_comparison, must_be_immutable, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_element

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:max_box/router/Routes.dart';
import 'package:max_box/utils/LocalStorage.dart';
//final demos = AppRoutes.getDemos();
import 'package:max_box/utils/adApt.dart';

import '../common/AppButton.dart';
import '../common/AppToBar.dart';
import '../common/IconText.dart';
import '../common/RowItem.dart';
import '../model/user.dart';

class OrderList extends StatefulWidget {
  Map<String, dynamic> params;
  OrderList({
    Key? key,
    required this.params,
  }) : super(key: key);
  @override
  _OrderListState createState() => new _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
      appBar: AppToBar(title: '我的订单'),
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_context, index) {
            return Container(
                margin: EdgeInsets.only(
                    top: Adapt.px(16),
                    bottom: Adapt.px(20),
                    left: Adapt.px(36),
                    right: Adapt.px(36)),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  color: Color.fromARGB(255, 69, 69, 69),
                ),
                child: GridTileBar(
                    title: Text('购买时长卡30分钟',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF), fontSize: Adapt.px(28))),
                    subtitle: Padding(
                        padding: EdgeInsets.only(top: Adapt.px(10)),
                        child: Text('2022.10.23 12:00:32',
                            style: TextStyle(
                                fontSize: Adapt.px(22),
                                color: Color(0xFF9E9E9E)))),
                    trailing: Padding(
                        padding: EdgeInsets.only(right: Adapt.px(10)),
                        child: Text('￥4',
                            style: TextStyle(
                                fontSize: Adapt.px(28),
                                color: Color(0xFFFFFFFF))))));
          },
          // itemExtent: Adapt.px(220),
          itemCount: 3,
        ),
      ),
    );
  }
}
