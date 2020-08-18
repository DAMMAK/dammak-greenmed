import 'package:doctorappointment/utils/colors.dart';
import 'package:doctorappointment/widgets/platform/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// A Platform Specific Loader for both iOS and Android
class PlatformLoader extends PlatformWidget<CupertinoActivityIndicator,
    CircularProgressIndicator> {
  PlatformLoader({
    Key key,
  }) : super(key: key);

  @override
  CircularProgressIndicator createAndroidWidget(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>((AppColors.primaryColor)),
    );
  }

  @override
  CupertinoActivityIndicator createIosWidget(BuildContext context) {
    return CupertinoActivityIndicator(
      radius: 20,
    );
  }
}
