part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class UsernameChange extends LoginEvent {
  String username;
  UsernameChange(this.username);
  @override
  List<Object?> get props => [username];
}

class PasswordChange extends LoginEvent {
  String password;
  PasswordChange(this.password);
  @override
  List<Object?> get props => [password];
}

class OnLoginClick extends LoginEvent {
  BuildContext context;
  OnLoginClick(this.context);
  @override
  List<Object?> get props => [context];
}
