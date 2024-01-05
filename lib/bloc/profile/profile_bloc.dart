import 'package:bike_online_application/repository/firebase/profile/profile.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final DeleteAccount _delete = DeleteAccount();

  final ChangeNumberAccount _phone = ChangeNumberAccount();
  final ChangeAddressAccount _address = ChangeAddressAccount();
  final ChangeNamaAccount _name = ChangeNamaAccount();
  ProfileBloc() : super(ProfileInitial()) {
    on<ChangeNameEvent>((event, emit) async {
      try {
        await _name.changeNama(event.context, event.nama, event.email);
      } catch (e) {
        emit(ProfileError(errorMessage: e.toString()));
      }
    });
    on<ChangePhoneProfileEvent>((event, emit) async {
      try {
        await _phone.changeNumber(event.context, event.nomorTelepon,event.email);
      } catch (e) {
        emit(ProfileError(errorMessage: e.toString()));
      }
    });
    on<DeleteProfileEvent>((event, emit) async {
      try {
        await _delete.deleteAccount(event.context, event.email);
      } catch (e) {
        emit(ProfileError(errorMessage: e.toString()));
      }
    });
    on<ChangeAddressProfileEvent>((event, emit) async {
      try {
        await _address.changeAddress(event.context, event.address, event.email);
      } catch (e) {
        emit(ProfileError(errorMessage: e.toString()));
      }
    });
    
  }
}
