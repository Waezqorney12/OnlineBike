// ignore_for_file: use_build_context_synchronously
import 'package:bike_online_application/repository/firebase/auth/Login/LoginAuth.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginAuth _login = LoginAuth();
  AuthBloc() : super(AuthInitial()) {
    on<AuthEmailPasswordEvent>((event, emit) async {
        try {
          await _login.emailLogin(event.email, event.password, event.context);
        } catch (e) {
          emit(AuthError(errorMessage: e.toString()));
        }
    });
    on<AuthGoogleEvent>((event, emit) async{
      try {
        await _login.firebaseGoogleSignIn(event.context);
      } catch (e) {
        emit(AuthError(errorMessage: e.toString()));
      }
    });
    on<SignOutAccountEvent>((event, emit) async {
      try {
        await _login.signOut(event.context);
      } catch (e) {
        emit(AuthError(errorMessage: e.toString()));
      }
    });
    on<DeleteAccountEvent>((event,emit) async {
      try {
        await _login.deleteAccount(event.context, event.email);
      } catch (e) {
        emit(AuthError(errorMessage: e.toString()));
      }
    });
  }
}
