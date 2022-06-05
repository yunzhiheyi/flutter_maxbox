// ignore_for_file: file_names, sort_child_properties_last, unnecessary_new, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class EasyDialog {
  final ImageProvider? topImage;
  final Text? title;
  final Text? description;
  final bool closeButton;
  final double height;
  final double width;
  final double fogOpacity;
  final double cornerRadius;
  final Color cardColor;
  List<Widget> _contentList = [];
  List<Widget>? contentList;
  EdgeInsets? contentPadding;
  EdgeInsets? titlePadding;
  EdgeInsets descriptionPadding;
  CrossAxisAlignment contentListAlignment;

  EasyDialog(
      {Key? key,
      this.topImage,
      this.title,
      this.description,
      this.closeButton = true,
      this.height = 140,
      this.width = 300,
      this.cornerRadius = 8.0,
      this.fogOpacity = 0.37,
      this.cardColor = const Color.fromRGBO(240, 240, 240, 1.0),
      this.contentList,
      this.contentPadding,
      this.descriptionPadding = const EdgeInsets.all(0.0),
      this.titlePadding = const EdgeInsets.only(bottom: 12.0),
      this.contentListAlignment = CrossAxisAlignment.center})
      : assert(fogOpacity >= 0 && fogOpacity <= 1.0);

  insertByIndex(EdgeInsets? padding, Widget? child, int index) {
    _contentList.insert(
        index,
        Container(
          padding: padding,
          child: child,
          alignment: Alignment.center,
        ));
  }

  show(BuildContext context) {
    ClipRRect? image;
    if (topImage != null) {
      image = ClipRRect(
        child: new Image(image: topImage!),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cornerRadius),
            topRight: Radius.circular(cornerRadius)),
      );
    }

    if (title != null && description != null) {
      insertByIndex(titlePadding, title, 0);
      insertByIndex(descriptionPadding, description, 1);
    }
    if (title != null && description == null) {
      insertByIndex(titlePadding, title, 0);
    }
    if (description != null && title == null) {
      insertByIndex(descriptionPadding, description, 0);
    }
    contentPadding ??= const EdgeInsets.fromLTRB(17.5, 12.0, 17.5, 13.0);

    if (contentList != null) {
      _contentList = contentList as List<Widget>;
    }

    return showAnimatedDialog(
      context: context,
      animationType: DialogTransitionType.scale,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 500),
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Material(
          color: Colors.transparent,
          child: Container(
            child: new Center(
              child: new Container(
                  decoration: BoxDecoration(
                    // boxShadow: const <BoxShadow>[
                    //   BoxShadow(
                    //     spreadRadius: 1.0,
                    //     color: Colors.black54,
                    //     offset: Offset(5.0, 5.0),
                    //     blurRadius: 30.0,
                    //   )
                    // ],
                    borderRadius:
                        BorderRadius.all(Radius.circular(cornerRadius)),
                    color: cardColor,
                  ),
                  height: height,
                  width: width,
                  child: new Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          image ??
                              Container(
                                alignment: Alignment.center,
                                height: height,
                                padding: contentPadding,
                                child: Column(
                                  crossAxisAlignment: contentListAlignment,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: _contentList,
                                ),
                              ),
                          closeButton == true
                              ? Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  height: 26,
                                  alignment: Alignment.topRight,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.black87,
                                      size: 19,
                                    ),
                                    backgroundColor: const Color.fromRGBO(
                                        240, 240, 240, 0.8),
                                    elevation: 2,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      image == null
                          ? Container()
                          : Expanded(
                              child: Container(
                                padding: contentPadding,
                                child: Column(
                                  crossAxisAlignment: contentListAlignment,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: _contentList,
                                ),
                              ),
                            ),
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
