part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  const LoginLoading();
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  const LoginSuccess();
  @override
  List<Object> get props => [];
}

class LoginFailed extends LoginState {
  String errorMessage;
  LoginFailed(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
