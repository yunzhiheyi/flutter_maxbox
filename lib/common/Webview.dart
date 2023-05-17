// ignore_for_file: file_names, library_private_types_in_public_api, no_leading_underscores_for_local_identifiers,unnecessary_null_comparison, non_constant_identifier_names, unused_import, prefer_const_constructors
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fengchao/common/AppToBar.dart';
import 'package:fengchao/utils/adApt.dart';
import 'package:fengchao/views/loginCode.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class WebViewPage extends StatefulWidget {
  String url;
  final String title;
  final bool isLocalUrl;
  final bool isAppBar;
  late WebViewController _webViewController;
  WebViewPage(
      {Key? key,
      required this.url,
      required this.title,
      required this.isLocalUrl,
      required this.isAppBar})
      : super(key: key);

  @override
  _WebViewPage createState() => _WebViewPage();
}

class _WebViewPage extends State<WebViewPage> {
  final ImagePicker _picker = ImagePicker();
  late WebViewController controller;
  // /*拍照*/
  // _takePhoto() async {
  //   XFile? image =
  //       await _picker.pickImage(source: ImageSource.camera, imageQuality: 90);
  //   if (image != null) {
  //     String script =
  //         "window._Vue._store.dispatch('setImgPath', '${image.path}')";
  //     widget._webViewController.runJavascript(script);
  //   }
  // }
  //
  // /*相册*/
  // _openGallery() async {
  //   XFile? _image =
  //       await _picker.pickImage(source: ImageSource.gallery, imageQuality: 90);
  //   if (_image != null) {
  //     String script =
  //         "window._Vue._store.dispatch('setImgPath', '${_image.path}')";
  //     widget._webViewController.runJavascript(script);
  //   }
  // }
  //
  // // 打开相机
  // JavascriptChannel JsOpenCamera(BuildContext context) => JavascriptChannel(
  //     name: 'JsOpenCamera',
  //     onMessageReceived: (JavascriptMessage message) async {
  //       _takePhoto();
  //     });
  // // 打开相册
  // JavascriptChannel JsOpenGallery(BuildContext context) => JavascriptChannel(
  //     name: 'JsOpenGallery',
  //     onMessageReceived: (JavascriptMessage message) async {
  //       _openGallery();
  //     });
  // // 退出登录
  // JavascriptChannel JsExitLogin(BuildContext context) => JavascriptChannel(
  //     name: 'JsExitLogin',
  //     onMessageReceived: (JavascriptMessage message) async {
  //       // 退出登录暂时这样写
  //       // Navigator.push(context, Bottom2TopRouter(child: const Login()));
  //     });
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.isLocalUrl
          ? Uri.dataFromString(widget.url,
                  mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
              .toString()
          : widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  _buildBody() {
    return Column(
      children: <Widget>[
        AppToBar(title: widget.title),
        SizedBox(
          height: widget.isAppBar ? 1 : 0,
          width: double.infinity,
          child: const DecoratedBox(
              decoration: BoxDecoration(color: Color(0xFFEEEEEE))),
        ),
        Expanded(flex: 1, child: WebViewWidget(controller: controller))
      ],
    );
  }
}
