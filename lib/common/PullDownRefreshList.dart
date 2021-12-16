import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:max_box/bloc/home/home_content_bloc.dart';
import 'package:max_box/utils/adApt.dart';
// import 'package:max_box/views/login.dart';
// import 'package:max_box/router/router_utils.dart';
import 'package:max_box/common/HomeSwiper.dart';
import 'friend_card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:android_window/main.dart' as android_window;

import 'package:flutter_bloc/flutter_bloc.dart';

class PullDownRefreshList extends StatefulWidget {
  const PullDownRefreshList({Key? key}) : super(key: key);
  @override
  _PullDownRefreshListState createState() => _PullDownRefreshListState();
}

class _PullDownRefreshListState extends State<PullDownRefreshList> {
  int itemExtent = 220;
  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      Fluttertoast.showToast(msg: "当前已是最新数据", fontSize: Adapt.px(25));
    });
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    print('_onRefresh');

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    context.read<HomeContentBloc>().add(HomeContentFetched());
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    context.read<HomeContentBloc>().add(HomeContentFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeContentBloc, HomeContentState>(
        builder: (context, state) {
      return Scaffold(
        body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          // header: WaterDropHeader(),
          footer: CustomFooter(
              loadStyle: LoadStyle.ShowWhenLoading,
              builder: (context, mode) {
                Widget body;
                print(mode);
                bool isLoading = state.currentPage == state.totalPage &&
                    state.currentPage > 0;
                print(isLoading);
                if (mode == LoadStatus.idle && !isLoading) {
                  body = Text("上拉加载更多",
                      style: TextStyle(
                        fontSize: Adapt.px(26),
                      ));
                } else if (mode == LoadStatus.loading && !isLoading) {
                  body = CupertinoActivityIndicator();
                } else if (mode == LoadStatus.failed &&
                    state.status == HomeContenStatus.failure) {
                  body = Text("加载失败!点击重试!",
                      style: TextStyle(
                        fontSize: Adapt.px(26),
                      ));
                } else if (mode == LoadStatus.canLoading && !isLoading) {
                  body = Text("释放以加载更多",
                      style: TextStyle(
                        fontSize: Adapt.px(26),
                      ));
                } else {
                  body = Text("没有更多的数据",
                      style: TextStyle(
                        fontSize: Adapt.px(26),
                      ));
                }
                return Container(
                  height: Adapt.px(100),
                  child: Center(child: body),
                );
              }),
          // header: BezierCircleHeader(
          //     bezierColor: Colors.orangeAccent,
          //     circleColor: Colors.white,
          //     rectHeight: Adapt.px(90)),
          // footerBuilder: () => ClassicFooter(),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.builder(
            itemBuilder: (_context, index) {
              if (index == 0) {
                return HomeSwiper();
              } else {
                switch (state.status) {
                  case HomeContenStatus.failure:
                    return const Center(child: Text('获取失败'));
                  case HomeContenStatus.success:
                    if (state.homeList.length == 0) {
                      return const Center(child: Text('无数据'));
                    }
                    return GestureDetector(
                        onTap: () {
                          // Navigator.push(context, Bottom2TopRouter(child: Login()));
                          android_window.open(
                            size: const Size(500, 600),
                            position: const Offset(280, 400),
                          );
                        },
                        child: new FriendCard(data: state.homeList[index]));
                  default:
                    return const Center(child: Text('正在加载中'));
                }
              }
            },
            // itemExtent:Adapt.px(220),
            itemCount: state.homeList.length,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _refreshController..dispose();
    super.dispose();
  }
}
