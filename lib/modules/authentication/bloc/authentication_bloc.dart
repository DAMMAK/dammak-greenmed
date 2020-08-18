import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doctorappointment/modules/authentication/model/login.dart';
import 'package:doctorappointment/modules/authentication/service/api_client.dart';
import 'package:doctorappointment/modules/onboarding/model/user.dart';

import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationClient _client = AuthenticationClient();

  @override
  AuthenticationState get initialState => AuthenticationInitial();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is DoLogin) {
      yield* _mapLoginToState(event);
    }
  }

  Stream<AuthenticationState> _mapLoginToState(DoLogin event) async* {
    // trigger Loading State
    yield LoadingOn();
    try {
      // connect to the Sign In method in the Client class
      var response = await _client.signIn(event.loginModel);
      // remove loading state
      yield LoadingOff();
      // check if response is type of boolean
      if (response is User) {
        yield AuthenticationSuccessful(user: response);
      } else {
        // if response is type of String, then return the error message
        yield AuthenticationFailed(
            message: "Invalid Phone Number and Password");
      }
    } catch (e) {
      // return error message
      yield AuthenticationFailed(message: e);
    }
  }
}
