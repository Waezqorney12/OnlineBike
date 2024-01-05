part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState extends Equatable {}


final class DashboardInitial extends DashboardState{
  DashboardInitial();
  
  @override
  List<Object?> get props => [];
}
