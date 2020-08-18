import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:doctorappointment/data/base_user_client.dart';
import 'package:doctorappointment/data/dbms.dart';
import 'package:doctorappointment/modules/onboarding/model/user.dart';
import 'package:doctorappointment/utils/display.dart';

class UserApiClient extends BaseUserClient {
  signUp(User user) async {
    try {
      String data;
      // check if user already exist
      var response =
          await DB.find(User.tablename, [user.phoneNumber], "phoneNumber = ?");

      // use MD5 encryption algorithm to hash the password before saving to db
      user.password = super.hashPassword(user.password);
      // if user does not exist insert into database
      if (response.length < 1) {
        await DB.insert(User.tablename, user);
        return true;
      } else {
        return "User already exist!";
      }
    } catch (e) {
      print(e);
    }
  }
}
