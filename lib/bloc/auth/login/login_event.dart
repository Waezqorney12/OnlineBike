part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

final class LoginEmailPasswordEvent extends LoginEvent{
  final String email;
  final String password;
  final BuildContext context;
  LoginEmailPasswordEvent({required this.email, required this.password, required this.context});
}

final class LoginGoogleEvent extends LoginEvent{
  final BuildContext context;
  LoginGoogleEvent({required this.context});
}