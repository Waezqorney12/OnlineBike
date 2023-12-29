part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

final class RegisterEmailSubmitEvent extends RegisterEvent{
  final String email;
  final String password;
  final String confirmation;
  final BuildContext context;
  RegisterEmailSubmitEvent({required this.email, required this.password, required this.confirmation, required this.context});
}

final class RegisterGoogleSubmitEvent extends RegisterEvent{
  final BuildContext context;
  RegisterGoogleSubmitEvent({required this.context});
}
