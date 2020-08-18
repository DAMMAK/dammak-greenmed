import 'package:doctorappointment/widgets/platform/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformDialog extends PlatformWidget<CupertinoAlertDialog, AlertDialog> {
  final Widget title;
  final Widget content;
  final List<Widget> actions;
  PlatformDialog({
    Key key,
    this.content,
    this.title,
    this.actions,
  }) : super(key: key);

  @override
  AlertDialog createAndroidWidget(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions ?? [],
    );
  }

  @override
  CupertinoAlertDialog createIosWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: title,
      content: content,
      actions: actions ?? [],
    );
  }
}
