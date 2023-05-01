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

class OnLoginButtonClickOneMethod extends LoginEvent {
  BuildContext context;
  OnLoginButtonClickOneMethod(this.context);
  @override
  List<Object?> get props => [context];
}

class OnLoginClickSecondMethod extends LoginEvent {
  BuildContext context;
  String username;
  String password;

  OnLoginClickSecondMethod(this.context, this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}
