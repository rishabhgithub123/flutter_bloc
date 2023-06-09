import 'package:bloc/bloc.dart';
import 'package:bloc_api/LoginService.dart';
import 'package:bloc_api/home_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String username = "";
  String password = "";

  LoginService loginService = LoginService();

  LoginBloc() : super(LoginInitial()) {
    // on<LoginEvent>((event, emit) {
    //
    // });

    on<UsernameChange>(usernameChange);
    on<PasswordChange>(passwordChange);
    on<OnLoginButtonClickOneMethod>(onLoginButtonClickOneMethod);

    on<OnLoginClickSecondMethod>(onLoginClickSecondMethod);
  }

  onLoginClickSecondMethod(OnLoginClickSecondMethod event, emit) {
    emit(const LoginLoading());
    if (event.username.isEmpty) {
      emit(LoginFailed("Enter Valid Username"));
      return;
    }

    if (event.password.isEmpty) {
      emit(LoginFailed("Enter Valid Password"));
      return;
    }

    bool response = loginService.initiateLogin(event.username, event.password);

    if (response) {
      emit(const LoginSuccess());
      Navigator.push(
        event.context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(title: "Logged In")),
      );
    } else {
      emit(LoginFailed("Username password doesn't matched"));
    }
  }

  usernameChange(UsernameChange event, emit) {
    username = event.username;
  }

  passwordChange(PasswordChange event, emit) {
    password = event.password;
  }

  onLoginButtonClickOneMethod(OnLoginButtonClickOneMethod event, emit) {
    emit(const LoginLoading());
    if (username.isEmpty) {
      emit(LoginFailed("Enter Valid Username"));
      return;
    }

    if (password.isEmpty) {
      emit(LoginFailed("Enter Valid Password"));
      return;
    }

    bool response = loginService.initiateLogin(username, password);

    if (response) {
      emit(const LoginSuccess());
      Navigator.push(
        event.context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(title: "Logged In")),
      );
    } else {
      emit(LoginFailed("Username password doesn't matched"));
    }
  }
}
