import 'package:bike_online_application/model/auth/profile.dart';
import 'package:bike_online_application/repository/firebase/auth/Register/RegisterAuth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final RegisterAuth _auth = RegisterAuth();
  DashboardBloc() : super(ProfileInitial()) {
    on<LoadProfile>((event, emit) async{
      try {
        final userProfile = await _auth.getUserProfile(email: event.email);
        emit(ProfileLoaded(profile: userProfile));
      } catch (e) {
        emit(ProfileError(errorMessage: e.toString()));
      }
    });
  }
}
