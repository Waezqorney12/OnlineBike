// ignore_for_file: use_build_context_synchronously
import 'package:bike_online_application/repository/firebase/auth/Login/LoginAuth.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginAuth _login = LoginAuth();
  LoginBloc() : super(LoginInitial()) {
    on<LoginEmailPasswordEvent>((event, emit) async {
        try {
          await _login.emailLogin(event.email, event.password, event.context);
        } catch (e) {
          throw Exception(e);
        }
    });
    on<LoginGoogleEvent>((event, emit) async{
      try {
        await _login.firebaseGoogleSignIn(event.context);
      } catch (e) {
        throw Exception(e);
      }
    });
  }
}
