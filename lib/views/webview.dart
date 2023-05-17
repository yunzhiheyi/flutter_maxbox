// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:fengchao/common/Webview.dart';

// ignore: must_be_immutable
class WebviewH5 extends StatefulWidget {
  var url;
  var isAppBar;
  var title;
  @override
  WebviewH5State createState() => WebviewH5State();
  WebviewH5({Key? key, this.url, this.isAppBar, this.title}) : super(key: key);
}

class WebviewH5State extends State<WebviewH5> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
  }

  @override
  Widget build(BuildContext context) {
    return WebViewPage(
        url: widget.url ?? 'http://192.168.101.3:8081/',
        title: widget.title ?? 'H5互动',
        isLocalUrl: false,
        isAppBar: widget.isAppBar ?? false);
  }
}
