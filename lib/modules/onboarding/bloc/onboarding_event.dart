part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class AddSignUpEvent extends OnboardingEvent {
  final User user;
  AddSignUpEvent({this.user});
  @override
  List<Object> get props => [user];
}
