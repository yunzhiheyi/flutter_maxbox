// ignore_for_file: file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, prefer_final_fields, unnecessary_string_interpolations, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:fengchao/utils/adApt.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'AppButton.dart';

class TeleprompterSetup extends StatefulWidget {
  final ValueChanged<bool>? onEnd;

  TeleprompterSetup({
    this.onEnd,
  });

  @override
  _TeleprompterSetupState createState() => _TeleprompterSetupState();
}

class _TeleprompterSetupState extends State<TeleprompterSetup>
    with SingleTickerProviderStateMixin {
  late double _transparencyValue = 0;
  late double _speedValue = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.fromLTRB(
              Adapt.px(40), Adapt.px(20), Adapt.px(24), Adapt.px(40)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '悬浮窗设置',
                style: TextStyle(
                  fontSize: Adapt.px(28),
                ),
              ),
              AppButton(
                  title: '保存',
                  type: 'gradient',
                  onTap: () {
                    print('IOS弹窗');
                  },
                  width: 100,
                  height: 52,
                  fontSize: Adapt.px(24),
                  padding:
                      EdgeInsets.fromLTRB(Adapt.px(20), 0, Adapt.px(20), 0),
                  margin: EdgeInsets.all(0),
                  radius: 52),
            ],
          )),
      Padding(
          padding:
              EdgeInsets.fromLTRB(Adapt.px(10), 0, Adapt.px(30), Adapt.px(15)),
          child: Row(children: [
            SizedBox(
                width: 80,
                child: Text('字号',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: Adapt.px(24)))),
            Expanded(
                flex: 1,
                child: Container(
                    child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(Adapt.px(30), 0, 0, 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.remove_circle_outline,
                        size: Adapt.px(34),
                        color: Color.fromARGB(255, 194, 194, 194),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('18', style: TextStyle(fontSize: Adapt.px(24))),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        size: Adapt.px(34),
                        color: Color.fromARGB(255, 77, 74, 74),
                      ),
                    ],
                  ),
                )))
          ])),
      Padding(
          padding: EdgeInsets.fromLTRB(
              Adapt.px(10), Adapt.px(30), Adapt.px(30), Adapt.px(15)),
          child: Row(children: [
            SizedBox(
                width: 80,
                child: Text('行间距',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: Adapt.px(24)))),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(Adapt.px(30), 0, 0, 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.remove_circle_outline,
                        size: Adapt.px(34),
                        color: Color.fromARGB(255, 194, 194, 194),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('15', style: TextStyle(fontSize: Adapt.px(24))),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        size: Adapt.px(34),
                        color: Color.fromARGB(255, 77, 74, 74),
                      ),
                    ],
                  ),
                ))
          ])),
      Padding(
          padding: EdgeInsets.fromLTRB(Adapt.px(10), 0, Adapt.px(30), 0),
          child: Row(children: [
            SizedBox(
                width: 80,
                child: Text('透明度',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: Adapt.px(24)))),
            Expanded(
              flex: 1,
              child: SfSlider(
                min: 0,
                max: 100,
                stepSize: 1,
                value: _transparencyValue,
                interval: 20,
                showTicks: true,
                showLabels: false,
                enableTooltip: true,
                minorTicksPerInterval: 1,
                onChanged: (dynamic value) {
                  setState(() {
                    _transparencyValue = value;
                  });
                },
              ),
            )
          ])),
      Padding(
          padding: EdgeInsets.fromLTRB(Adapt.px(10), 0, Adapt.px(30), 0),
          child: Row(children: [
            SizedBox(
                width: 80,
                child: Text('滚动速度',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: Adapt.px(24)))),
            Expanded(
              flex: 1,
              child: SfSlider(
                min: 0,
                max: 100,
                stepSize: 1,
                value: _speedValue,
                interval: 20,
                showTicks: true,
                showLabels: false,
                enableTooltip: true,
                minorTicksPerInterval: 1,
                onChanged: (dynamic value) {
                  setState(() {
                    _speedValue = value;
                  });
                },
              ),
            )
          ])),
      Padding(
          padding: EdgeInsets.fromLTRB(
              Adapt.px(10), Adapt.px(30), Adapt.px(30), Adapt.px(15)),
          child: Row(children: [
            SizedBox(
                width: 80,
                child: Text('倒计时',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: Adapt.px(24)))),
            Container(
              height: Adapt.px(50),
              padding: EdgeInsets.fromLTRB(Adapt.px(30), 0, 0, 0),
              child: ToggleSwitch(
                minWidth: Adapt.px(94),
                initialLabelIndex: 1,
                cornerRadius: 20.0,
                fontSize: Adapt.px(24),
                // activeFgColor: Colors.white,
                inactiveBgColor: Color.fromARGB(255, 188, 208, 248),
                // inactiveFgColor: Colors.white,
                totalSwitches: 3,
                labels: ['3秒', '5秒', '10秒'],
                // icons: [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
                activeBgColors: [
                  [Color.fromRGBO(44, 111, 246, 1)],
                  [Color.fromRGBO(44, 111, 246, 1)],
                  [Color.fromRGBO(44, 111, 246, 1)],
                ],
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
            )
          ])),
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(0, Adapt.px(30), 0, 0),
          child: GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.restart_alt_sharp,
                  size: Adapt.px(38),
                  color: Color.fromARGB(255, 77, 74, 74),
                ),
                Text('恢复初始参数', style: TextStyle(fontSize: Adapt.px(28)))
              ],
            ),
          ))
    ]);
  }
}
