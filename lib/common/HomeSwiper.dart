// ignore_for_file: file_names, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:max_box/utils/adApt.dart';

class HomeSwiper extends StatelessWidget {
  const HomeSwiper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Adapt.px(674),
        height: Adapt.px(160),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.withAlpha(68),
        ),
        margin:
            EdgeInsets.fromLTRB(Adapt.px(20), Adapt.px(20), Adapt.px(20), 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Swiper(
            scrollDirection: Axis.horizontal, // 横向
            itemCount: 1, // 数量
            loop: false,
            autoplay: false, // 自动翻页
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                  "https://cdn.maxbox.com.cn/image/icon-ad-1.png",
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                // int _loadingProgress = loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                return Container(
                  width: Adapt.px(30),
                  height: Adapt.px(30),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey.withAlpha(66),
                    strokeWidth: Adapt.px(8),
                    valueColor: const AlwaysStoppedAnimation(Color(0xFF2C6FF6)),
                    value: null,
                  ),
                );
              });
            }, // 构建
            onTap: (index) {
              // print('点击了第${index}');
            }, // 点击事件 onTap
            scale: 1, // 两张图片之间的间隔
          ),
        ));
  }
}
