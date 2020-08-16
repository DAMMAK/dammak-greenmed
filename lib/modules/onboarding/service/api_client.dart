import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:doctorappointment/data/dbms.dart';
import 'package:doctorappointment/modules/onboarding/model/user.dart';

class UserApiClient {
  signUp(User user) async {
    // check if user already exist
    var response =
        await DB.find(User.tablename, [user.phoneNumber], "phoneNumber = ?");

    // use MD5 encryption algorithm to hash the password before saving to db
    var hashedPass = md5.convert(utf8.encode(user.password)).toString();
    user.password = hashedPass;
    // if user does not exist insert into database
    if (response.length < 1) {
      await DB.insert(User.tablename, user);
      return true;
    } else {
      return "User already exist!";
    }
  }
}
