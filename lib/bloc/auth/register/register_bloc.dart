import 'package:bike_online_application/repository/firebase/auth/Register/RegisterAuth.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterAuth _register = RegisterAuth();
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEmailSubmitEvent>((event, emit) async {
      try {
        await _register.signUpWithEmailAndPassword(
            emailUser: event.email,
            password: event.password,
            confirm: event.confirmation,
            context: event.context);
      } catch (e) {
        throw Exception(e.toString());
      }
    });
    on<RegisterGoogleSubmitEvent>((event, emit) async{
      try {
        await _register.signUpWithGoogle(event.context);
      } catch (e) {
        throw Exception(e.toString());
      }
    });
  }
}
