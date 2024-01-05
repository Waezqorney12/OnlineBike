part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState extends Equatable {}


final class ProfileInitial extends DashboardState {
  ProfileInitial();
  @override
  List<Object?> get props => [];
}

final class ProfileLoaded extends DashboardState{
  final Profile profile;
  ProfileLoaded({required this.profile});
  
  @override
  List<Object?> get props => [profile];


}
final class ProfileError extends DashboardState {
  final String errorMessage;
  ProfileError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
