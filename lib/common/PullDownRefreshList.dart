// ignore_for_file: unnecessary_import,unused_import, library_private_types_in_public_api, file_names, no_leading_underscores_for_local_identifiers, unnecessary_new, duplicate_import, avoid_print, prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:max_box/bloc/teleprompter/teleprompter_bloc.dart';
import 'package:max_box/utils/adApt.dart';
// import 'package:max_box/views/login.dart';
// import 'package:max_box/router/router_utils.dart';
// import 'package:max_box/common/HomeSwiper.dart';
import 'friend_card.dart';
import 'dart:ui';
// import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PullDownRefreshList extends StatefulWidget {
  const PullDownRefreshList({Key? key}) : super(key: key);
  @override
  _PullDownRefreshListState createState() => _PullDownRefreshListState();
}

class _PullDownRefreshListState extends State<PullDownRefreshList> {
  int itemExtent = 220;
  double width = 0;
  double height = 0;
  double offsetX = 0;
  double offsetY = 0;
  double winWidth = window.physicalSize.width.toDouble();
  double winHeight = window.physicalSize.height.toDouble();
  @override
  void initState() {
    context.read<TeleprompterBloc>().add(TeleprompterFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeleprompterBloc, TeleprompterState>(
        builder: (context, state) {
      return Scaffold(
          backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
          body: MediaQuery.removePadding(
            // removeTop: true,
            context: context,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_context, index) {
                // if (index == 0) {
                //   return Container(height: Adapt.px(30));
                // } else {
                return FriendCard(data: state.homeList[index]);
                // }
              },
              // itemExtent: Adapt.px(220),
              itemCount: state.homeList.length,
            ),
          ));
    });
  }

  @override
  void dispose() {
    // _refreshController..dispose();
    super.dispose();
  }
}
