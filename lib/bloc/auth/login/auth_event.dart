part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

final class AuthEmailPasswordEvent extends AuthEvent{
  final String email;
  final String password;
  final BuildContext context;
  AuthEmailPasswordEvent({required this.email, required this.password, required this.context});
}

final class AuthGoogleEvent extends AuthEvent{
  final BuildContext context;
  AuthGoogleEvent({required this.context});
}

final class SignOutAccountEvent extends AuthEvent{
  final BuildContext context;
  SignOutAccountEvent({required this.context});
}
