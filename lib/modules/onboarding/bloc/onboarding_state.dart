part of 'onboarding_bloc.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingState {}

class OnboardingLoading extends OnboardingState {}

class OnboardingLoadingOff extends OnboardingState {}

class OnboardingSuccessful extends OnboardingState {}

class OnboardingFailed extends OnboardingState {
  final String message;
  OnboardingFailed({this.message});
}
