import 'package:doctorappointment/modules/onboarding/model/user.dart';
import 'package:flutter/material.dart';

class UserData extends InheritedWidget {
  User user;
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
  UserData({Key key, Widget child, this.user}) : super(key: key, child: child);

  static UserData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserData>();
  }
}
