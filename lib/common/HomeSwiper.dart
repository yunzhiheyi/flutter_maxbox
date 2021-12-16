import 'package:flutter/material.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';
import 'package:max_box/utils/adApt.dart';
// ignore: import_of_legacy_library_into_null_safe

class HomeSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Adapt.px(680),
        height: Adapt.px(255),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withAlpha(68),
        ),
        margin:
            EdgeInsets.fromLTRB(Adapt.px(30), Adapt.px(20), Adapt.px(30), 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Swiper(
            scrollDirection: Axis.horizontal, // 横向
            itemCount: 2, // 数量
            autoplay: true, // 自动翻页
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                  index == 0
                      ? "https://oss.taicibao.com/junr/test/b_3.jpeg"
                      : 'https://oss.taicibao.com/junr/test/b_4.jpeg',
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                // int _loadingProgress = loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                return Container(
                  width: Adapt.px(40),
                  height: Adapt.px(40),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey.withAlpha(66),
                    strokeWidth: Adapt.px(8),
                    valueColor: AlwaysStoppedAnimation(Colors.orange),
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
