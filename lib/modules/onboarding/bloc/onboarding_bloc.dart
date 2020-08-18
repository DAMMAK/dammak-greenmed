import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doctorappointment/modules/onboarding/model/user.dart';
import 'package:doctorappointment/modules/onboarding/service/api_client.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  UserApiClient _client = UserApiClient();
  @override
  OnboardingState get initialState => OnboardingInitial();

  @override
  Stream<OnboardingState> mapEventToState(
    OnboardingEvent event,
  ) async* {
    if (event is AddSignUpEvent) {
      yield* _mapSignUpToState(event);
    }
  }

  Stream<OnboardingState> _mapSignUpToState(AddSignUpEvent event) async* {
    // trigger Loading State
    yield LoadingOn();
    try {
      // connect to the Sign Up method in the Client class
      var response = await _client.signUp(event.user);
      // remove loading state
      yield LoadingOff();
      // check if response is type of boolean
      if (response is bool) {
        yield OnboardingSuccessful();
      } else {
        // if response is type of String, then return the error message
        yield OnboardingFailed(message: response);
      }
    } catch (e) {
      // return error message
      yield OnboardingFailed(message: e);
    }
  }
}
