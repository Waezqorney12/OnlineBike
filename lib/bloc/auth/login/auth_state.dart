part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState{}
final class AuthSuccess extends AuthState{}
final class AuthError extends AuthState{
  final String errorMessage;
  AuthError({required this.errorMessage});
}
