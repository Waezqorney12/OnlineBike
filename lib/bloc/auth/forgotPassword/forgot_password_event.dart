part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordEvent extends Equatable{}

final class ForgotPasswordSubmitEvent extends ForgotPasswordEvent{
  final BuildContext context;
  final String email;
  ForgotPasswordSubmitEvent({required this.email, required this.context});
  
  @override
  List<Object?> get props => [email,context];
}