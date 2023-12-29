part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState{}
final class LoginSuccess extends LoginState{}
final class LoginError extends LoginState{
  
}
