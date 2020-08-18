import 'package:doctorappointment/data/base_user_client.dart';
import 'package:doctorappointment/data/dbms.dart';
import 'package:doctorappointment/modules/authentication/model/login.dart';
import 'package:doctorappointment/modules/onboarding/model/user.dart';

class AuthenticationClient extends BaseUserClient {
  signIn(LoginModel model) async {
    // hash user password
    model.password = super.hashPassword(model.password);
    // check if user exist in the database.
    var response =
        await DB.find(User.tablename, [model.phoneNumber], "phoneNumber = ?");

    if (response.length > 0) {
      var user = User.fromMap(response.first);
      return user;
    }
    return false;
  }
}
