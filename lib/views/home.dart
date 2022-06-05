// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, must_call_super, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:max_box/bloc/global/bloc/global_bloc.dart';
import 'package:max_box/common/topAppBar.dart';
// import 'package:max_box/common/PullDownRefreshList.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/HomeContentRow.dart';
import '../common/HomeContentColumn.dart';
import '../common/HomeSwiper.dart';

class HomeIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: BlocProvider(create: (_) => GlobalBloc(), child: HomeDada()));
  }
}

class HomeDada extends StatefulWidget {
  HomeDada({
    Key? key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => HomeDadaState();
}

class HomeDadaState extends State<HomeDada>
    with SingleTickerProviderStateMixin {
  late final ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(47, 47, 47, 1),
      body: Column(children: <Widget>[
        topAppBar(),
        HomeSwiper(),
        HomeContentRow(),
        Expanded(
            flex: 1,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              scrollDirection: Axis.vertical,
              child: HomeContentColumn(),
            ))
      ]),
    );
  }
}
