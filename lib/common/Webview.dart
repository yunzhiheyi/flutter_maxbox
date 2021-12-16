import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:max_box/router/router_utils.dart';
import 'package:max_box/utils/adApt.dart';
import 'package:max_box/views/login.dart';
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
  /*拍照*/
  _takePhoto() async {
    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 90);
    if (image != null) {
      String script =
          "window._Vue._store.dispatch('setImgPath', '${image.path}')";
      widget._webViewController.runJavascript(script);
    }
  }

  /*相册*/
  _openGallery() async {
    XFile? _image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 90);
    print(_image);
    // ignore: unnecessary_null_comparison
    if (_image != null) {
      String script =
          "window._Vue._store.dispatch('setImgPath', '${_image.path}')";
      widget._webViewController.runJavascript(script);
    }
  }

  // 打开相机
  // ignore: non_constant_identifier_names
  JavascriptChannel JsOpenCamera(BuildContext context) => JavascriptChannel(
      name: 'JsOpenCamera',
      onMessageReceived: (JavascriptMessage message) async {
        _takePhoto();
      });
  // 打开相册
  // ignore: non_constant_identifier_names
  JavascriptChannel JsOpenGallery(BuildContext context) => JavascriptChannel(
      name: 'JsOpenGallery',
      onMessageReceived: (JavascriptMessage message) async {
        _openGallery();
      });
  // 退出登录
  // ignore: non_constant_identifier_names
  JavascriptChannel JsExitLogin(BuildContext context) => JavascriptChannel(
      name: 'JsExitLogin',
      onMessageReceived: (JavascriptMessage message) async {
        // 退出登录暂时这样写
        Navigator.push(context, Bottom2TopRouter(child: Login()));
      });
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isAppBar
        ? Scaffold(appBar: _buildAppbar(), body: _buildBody())
        : Scaffold(body: _buildBody());
  }

  _buildAppbar() {
    return AppBar(
        elevation: 0,
        backgroundColor: Color(0xccd0d7),
        title: Text(
          widget.title,
          style: TextStyle(fontSize: Adapt.px(36), color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: Adapt.px(40),
              color: Color.fromARGB(255, 56, 56, 56),
            ),
            onPressed: () {
              Navigator.of(context)..pop();
            }));
  }

  _buildBody() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: widget.isAppBar ? 1 : 0,
          width: double.infinity,
          child: const DecoratedBox(
              decoration: BoxDecoration(color: Color(0xFFEEEEEE))),
        ),
        Expanded(
          flex: 1,
          child: WebView(
            initialUrl: widget.isLocalUrl
                ? Uri.dataFromString(widget.url,
                        mimeType: 'text/html',
                        encoding: Encoding.getByName('utf-8'))
                    .toString()
                : widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: <JavascriptChannel>[
              JsOpenCamera(context),
              JsOpenGallery(context),
              JsExitLogin(context)
            ].toSet(),
            onWebViewCreated: (WebViewController controller) {
              widget._webViewController = controller;
              if (widget.isLocalUrl) {
                _loadHtmlAssets(controller);
              } else {
                EasyLoading.show(status: '加载中');
                controller.loadUrl(widget.url);
              }
              controller
                  .canGoBack()
                  .then((value) => debugPrint(value.toString()));
              controller
                  .canGoForward()
                  .then((value) => debugPrint(value.toString()));
              controller.currentUrl().then((value) => debugPrint(value));
            },
            // 加载失败
            onWebResourceError: (WebResourceError error) {
              debugPrint(error.toString());
              EasyLoading.dismiss();
            },
            // // // 加载中
            // onProgress: (int progress) {
            //   EasyLoading.show(status: '加载中');
            // },
            // 加载完成
            onPageFinished: (String value) {
              EasyLoading.dismiss();
              // widget._webViewController
              //     .runJavascriptReturningResult('document.title')
              //     .then((title) => debugPrint(title));
            },
          ),
        )
      ],
    );
  }

//加载本地文件
  _loadHtmlAssets(WebViewController controller) async {
    String htmlPath = await rootBundle.loadString(widget.url);
    controller.loadUrl(Uri.dataFromString(htmlPath,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
