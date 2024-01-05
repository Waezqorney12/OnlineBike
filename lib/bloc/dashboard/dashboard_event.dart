part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent extends Equatable{}

final class LoadProfile extends DashboardEvent{
  final String email;
  LoadProfile({required this.email});
  
  @override
  List<Object?> get props => [email];
}
