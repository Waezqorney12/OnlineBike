part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}
final class ForgotPasswordLoadingState extends ForgotPasswordState{}
final class ForgotPasswordSuccessState extends ForgotPasswordState{}
final class ForgotPasswordErrorState extends ForgotPasswordState{
  final String errorMessage;
  ForgotPasswordErrorState({required this.errorMessage});
}
