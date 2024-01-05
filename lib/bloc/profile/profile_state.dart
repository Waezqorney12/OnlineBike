part of 'profile_bloc.dart';

@immutable
abstract class ProfileState extends Equatable {}

final class ProfileInitial extends ProfileState {
  ProfileInitial();
  @override
  List<Object?> get props => [];
}

final class ProfileLoaded extends ProfileState{
  final Profile profile;
  ProfileLoaded({required this.profile});
  
  @override
  List<Object?> get props => [profile];


}
final class ProfileError extends ProfileState {
  final String errorMessage;
  ProfileError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
