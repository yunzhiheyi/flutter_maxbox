// ignore_for_file: library_private_types_in_public_api, file_names, prefer_const_constructors, unnecessary_const, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import '../utils/adApt.dart';
import 'DialogLayout.dart';

class AnimatedDialog {
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final Widget? child;
  final String? title;
  final double? width;
  final double? height;
  final String? cancelTitle;
  final String? confirmTitle;
  final bool enableScrollInput;
  const AnimatedDialog(
      {Key? key,
      this.onConfirm,
      this.title,
      this.width,
      this.height,
      this.confirmTitle,
      this.cancelTitle,
      this.onCancel,
      this.enableScrollInput = true,
      required this.child});
  show(BuildContext context) {
    return showAnimatedDialog(
        context: context,
        animationType: DialogTransitionType.scale,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 500),
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              alignment: Alignment.center,
              child: Stack(children: [
                Container(
                    alignment: Alignment.center,
                    child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        alignment: Alignment.center,
                        width: Adapt.px(width ?? 500),
                        height: Adapt.px(height ?? 300),
                        child: DialogLayout(
                          title: title,
                          cancelTitle: cancelTitle,
                          confirmTitle: confirmTitle,
                          enableScrollInput: enableScrollInput,
                          onCancel: () {
                            onCancel?.call();
                            Navigator.pop(context);
                          },
                          onConfirm: () {
                            onConfirm?.call();
                          },
                          child: child,
                        ))),
                Positioned(
                  bottom: 0,
                  left: 10,
                  child: TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.cloud_outlined,
                        size: Adapt.px(62),
                        color: Color.fromARGB(255, 34, 34, 34),
                      )),
                )
              ]));
        });
  }
}
