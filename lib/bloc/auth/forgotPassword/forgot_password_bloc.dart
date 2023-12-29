import 'package:bike_online_application/common/component/AlertDialog.dart';
import 'package:bike_online_application/repository/firebase/auth/Forgot%20Password/ForgotPasswordAuth.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {

  final ForgotAuth _forgot = ForgotAuth();
  ForgotPasswordBloc()
      : super(ForgotPasswordInitial()) {
    on<ForgotPasswordEvent>((ForgotPasswordEvent event, Emitter<ForgotPasswordState> emit) async {
      if (event is ForgotPasswordSubmitEvent) {
        try {
          await _forgot.sendEmail(event.context, email: event.email);
        } catch (e) {
          throw Exception(e);
        }
      }
    });
  }
}
