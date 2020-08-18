import 'package:doctorappointment/data/dbms.dart';
import 'package:doctorappointment/modules/onboarding/model/user.dart';
import 'package:doctorappointment/modules/onboarding/service/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  UserApiClient _client = UserApiClient();
  await DB.init();

  group('Test for sign Up', () {
    test('test for firstName Validator', () {});

    test('it should pass', () async {
      User user =
          User(name: "Damola Adekoya", id: 2, phoneNumber: "0803433344554");
      var response = await _client.signUp(user);
      expect(response, true);
    });
  });
}
