import 'package:flutter/material.dart';
import 'package:max_box/bloc/home/home_content_bloc.dart';
import 'package:max_box/common/topAppBar.dart';
import 'package:max_box/common/PullDownRefreshList.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: BlocProvider(
            create: (_) => HomeContentBloc(), child: HomeBannerList()));
  }
}

class HomeBannerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        verticalDirection: VerticalDirection.down,
        mainAxisSize: MainAxisSize.max,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          topAppBar(),
          Expanded(flex: 1, child: new Container(child: PullDownRefreshList()))
        ]);
  }
}
