// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member, unused_local_variable, unnecessary_new, unused_field, prefer_final_fields, must_be_immutable, no_leading_underscores_for_local_identifiers, prefer_const_constructors_in_immutables, library_private_types_in_public_api, no_logic_in_create_state, unnecessary_this, unnecessary_brace_in_string_interps, unused_element, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_const, prefer_const_literals_to_create_immutables

// import 'package:fluro/fluro.dart';
// import 'dart:html';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:max_box/utils/adApt.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../router/Routes.dart';
import 'AppButton.dart';

// import '../router/Routes.dart';

class TeleprompterHead extends StatefulWidget {
  const TeleprompterHead({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => TeleprompterHeadState();
}

class TeleprompterHeadState extends State<TeleprompterHead>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(
            Adapt.px(30), Adapt.px(15), Adapt.px(30), Adapt.px(10)),
        // height: Adapt.px(52),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(47, 47, 47, 1),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            height: Adapt.px(50),
            decoration: BoxDecoration(
              color: Color(0xFF3A3A3A),
              border: Border.all(color: const Color(0xFF6A6A6A), width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(62.0)),
            ),
            child: ToggleSwitch(
              minWidth: Adapt.px(120),
              initialLabelIndex: 0,
              cornerRadius: 20.0,
              fontSize: Adapt.px(24),
              activeFgColor: Colors.white,
              inactiveBgColor: Color.fromRGBO(58, 58, 58, 1),
              inactiveFgColor: Color(0xFFDBDBDB),
              totalSwitches: 2,
              labels: ['列表', '回收站'],
              // icons: [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
              activeBgColors: [
                [Color.fromRGBO(76, 76, 76, 1)],
                [Color.fromRGBO(76, 76, 76, 1)],
              ],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
          ),
          AppButton(
              title: '+文本',
              onTap: () {
                Routes.navigateTo(context, '/home/teleprompter/text',
                    {'type': 'add'}, TransitionType.cupertino);
              },
              width: 107,
              height: 48,
              color: Color(0xFF555555),
              fontSize: Adapt.px(24),
              borderColor: Color(0xFF555555),
              padding: EdgeInsets.fromLTRB(Adapt.px(20), 0, Adapt.px(20), 0),
              margin: EdgeInsets.all(0),
              radius: 50),
        ]));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
