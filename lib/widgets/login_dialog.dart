import 'package:doctorappointment/widgets/platform/platform_dialog.dart';
import 'package:doctorappointment/widgets/platform/platform_loader.dart';
import 'package:flutter/material.dart';

class DialogManager {
  double height;
  double width;
  DialogManager({
    @required this.height,
    @required this.width,
  });
  showLoadingDialog(context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) {
        return PlatformDialog(
            title: SizedBox(),
            content: Column(
              children: [
                PlatformLoader(),
                SizedBox(
                  height: height * 0.015,
                ),
                Text(
                  "Loading...",
                  style: TextStyle(fontSize: width * 0.042),
                ),
              ],
            ));
      },
    );
  }

  showMessageDialog(context, {String message}) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return PlatformDialog(
            title: SizedBox(),
            content: Column(
              children: [
                SizedBox(
                  height: height * 0.015,
                ),
                Text(
                  message,
                  style: TextStyle(fontSize: width * 0.045),
                ),
              ],
            ));
      },
    );
  }
}
