part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileState {}
final class ProfileSuccess extends ProfileState {}
final class ProfileError extends ProfileState {
  final String errorMessage;
  ProfileError({required this.errorMessage});
}
