part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class DoLogin extends AuthenticationEvent {
  final LoginModel loginModel;
  DoLogin({this.loginModel});
  @override
  List<Object> get props => [loginModel];
}
