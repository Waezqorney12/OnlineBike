

import 'package:bike_online_application/common/component/AlertDialog.dart';
import 'package:bike_online_application/model/auth/profile.dart';
import 'package:bike_online_application/repository/firebase/profile/profile.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final PersonalInformation _profile = PersonalInformation();
  ProfileBloc() : super(ProfileInitial()) {
    on<ChangeNameEvent>((event, emit) async {
      try {
        await _profile.changeNama(event.context, event.nama, event.email);
      } catch (e) {
        emit(ProfileError(errorMessage: e.toString()));
      }
    });
    on<ChangePhoneProfileEvent>((event, emit) async {
      try {
        if (event.nomorTelepon.length > 12) {
          event.context.warning('Max length is 12');
        }else if(event.nomorTelepon.length == 12){
          await _profile.changeNumber(event.context, event.nomorTelepon,event.email);
        }else if(event.nomorTelepon.length < 12){
          event.context.warning('Unvalid number');
        }else if(event.nomorTelepon.isEmpty){
          event.context.error('No number has been inserted');
        }
        
      } catch (e) {
        emit(ProfileError(errorMessage: e.toString()));
      }
    });
    on<DeleteProfileEvent>((event, emit) async {
      try {
        await _profile.deleteAccount(event.context, event.email);
      } catch (e) {
        emit(ProfileError(errorMessage: e.toString()));
      }
    });
    on<ChangeAddressProfileEvent>((event, emit) async {
      try {
        await _profile.changeAddress(event.context, event.address, event.email);
      } catch (e) {
        emit(ProfileError(errorMessage: e.toString()));
      }
    });
    on<LoadProfile>((event, emit) async{
      try {
        final userProfile = await _profile.getUserProfile(email: event.email);
        emit(ProfileLoaded(profile: userProfile));
      } catch (e) {
        emit(ProfileError(errorMessage: e.toString()));
      }
    });
    on<SelectImage>((event, emit) async {
      try {
        await _profile.selectImage(event.email);
        final userProfile = await _profile.getUserProfile(email: event.email);
        emit(ProfileLoaded(profile: userProfile));
      } catch (e) {
        emit(ProfileError(errorMessage: e.toString()));
      }
    });
  }
}
extension Contexto on BuildContext{
  void error(String text)=> ShowDialog().errorDialogs(this, text);
  void warning(String text)=> ShowDialog().warningDialogs(this, text);
}