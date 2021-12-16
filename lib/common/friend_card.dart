import 'package:flutter/material.dart';
import 'package:max_box/model/home_content.dart';
import 'package:max_box/utils/adApt.dart';

class FriendCard extends StatelessWidget {
  const FriendCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final HomeContentViewModel data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Adapt.px(200),
      padding: EdgeInsets.fromLTRB(
          Adapt.px(20), Adapt.px(24), Adapt.px(24), Adapt.px(14)),
      margin: EdgeInsets.fromLTRB(
          Adapt.px(30), Adapt.px(30), Adapt.px(30), Adapt.px(0)),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(71, 71, 71, 0.1),
              offset: Offset(4.0, 4.0),
              blurRadius: 12.0,
              spreadRadius: 2.0)
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Image.asset("assets/images/icon-text.png",
                      width: Adapt.px(32), height: Adapt.px(32)),
                  Padding(padding: EdgeInsets.only(right: Adapt.px(20))),
                  Text(
                    this.data.title,
                    style: TextStyle(
                      fontSize: Adapt.px(28),
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF333333),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: Adapt.px(10)),
                child: new Image.asset("assets/images/icon-operation.png",
                    width: Adapt.px(40), height: Adapt.px(10)),
              )
            ],
          ),
          Padding(padding: EdgeInsets.only(top: Adapt.px(15))),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    width: Adapt.px(500),
                    child: Text(
                      this.data.content,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Adapt.px(24),
                        color: Color(0xFF666666),
                      ),
                    )),
              ]),
          Padding(padding: EdgeInsets.only(top: Adapt.px(5))),
          Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(this.data.create_time,
                        style: TextStyle(
                          fontSize: Adapt.px(22),
                          color: Color(0xFF999999),
                        )),
                    Container(
                      width: Adapt.px(90),
                      height: Adapt.px(50),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: Adapt.px(4)),
                      decoration: new BoxDecoration(
                        color: Color.fromRGBO(251, 177, 17, 1),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      child: new Text('查看',
                          style: TextStyle(
                              fontSize: Adapt.px(24), color: Colors.white)),
                    )
                  ])),
        ],
      ),
    );
  }
}
