import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveButton extends StatelessWidget {
  final String title;
  final Function handler;

  AdaptiveButton(this.title, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handler,
            child: Text(title),
          )
        : FlatButton(
            onPressed: handler,
            child: Text(title),
            textColor: Theme.of(context).primaryColor,
          );
  }
}
