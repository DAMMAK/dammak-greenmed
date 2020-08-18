part of 'onboarding_bloc.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingState {}

class LoadingOn extends OnboardingState {}

class LoadingOff extends OnboardingState {}

class OnboardingSuccessful extends OnboardingState {}

class OnboardingFailed extends OnboardingState {
  final String message;
  OnboardingFailed({this.message});
}
