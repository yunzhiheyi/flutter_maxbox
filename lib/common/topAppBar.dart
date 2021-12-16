// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:max_box/utils/adApt.dart';

// ignore: camel_case_types
class topAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Container(
      margin: EdgeInsets.fromLTRB(5, paddingTop + 10, 5, 5),
      padding: EdgeInsets.fromLTRB(20, 7, 15, 0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(19)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              '百变日历',
              style: TextStyle(fontSize: Adapt.px(38)),
            ),
          ),
          new Container(
              width: Adapt.px(175),
              height: Adapt.px(58),
              padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                  color: Color.fromARGB(255, 241, 241, 241)),
              child: Row(
                  //                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: new Image.asset("assets/images/icon-search.png",
                            width: Adapt.px(38), height: Adapt.px(38))),
                    Expanded(
                        child: Text("搜索",
                            style: TextStyle(
                              fontSize: Adapt.px(28),
                              color: Colors.grey,
                            )))
                  ])),
          Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: new Image.asset("assets/images/icon-msg.png",
                  width: Adapt.px(42), height: Adapt.px(42)))
        ],
      ),
    );
  }
}
