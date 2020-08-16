import 'dart:convert';

import 'package:crypto/crypto.dart';

abstract class BaseUserClient {
  String hashPassword(String password) {
    // use MD5 encryption algorithm to hash the password before saving to db
    return md5.convert(utf8.encode(password)).toString();
  }
}
