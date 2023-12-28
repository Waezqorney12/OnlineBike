part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordEvent {}

final class ForgotPasswordSubmitEvent extends ForgotPasswordEvent{
  final BuildContext context;
  final String email;
  ForgotPasswordSubmitEvent({required this.email, required this.context});
}