import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController _usernsmeController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginBloc _loginBloc = context.read<LoginBloc>();

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
          ));
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _usernsmeController,
                  onChanged: (value) => _loginBloc.add(UsernameChange(value)),
                ),
                TextField(
                  controller: _passwordController,
                  onChanged: (value) => _loginBloc.add(PasswordChange(value)),
                ),
                Center(
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const CircularProgressIndicator();
                      }
                      return ElevatedButton(
                        child: const Text("Login"),
                        onPressed: () {
                          //_loginBloc.add(OnLoginClick(context));

                          _loginBloc.add(OnLoginClickSecondMethod(
                              context,
                              _usernsmeController.text,
                              _passwordController.text));
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
