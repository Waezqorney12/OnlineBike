part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent extends Equatable {}

final class DeleteProfileEvent extends ProfileEvent {
  final String email;
  final BuildContext context;
  DeleteProfileEvent({required this.email, required this.context});

  @override
  List<Object?> get props => [email, context];
}

final class ChangePhoneProfileEvent extends ProfileEvent {
  final String email;
  final String nomorTelepon;
  final BuildContext context;
  ChangePhoneProfileEvent(
      {required this.email, required this.nomorTelepon, required this.context});

  @override
  List<Object?> get props => [email, nomorTelepon, context];
}

final class ChangeAddressProfileEvent extends ProfileEvent {
  final String email;
  final String address;
  final BuildContext context;
  ChangeAddressProfileEvent(
      {required this.email, required this.address, required this.context});

  @override
  List<Object?> get props => [email, address, context];
}

final class ChangeNameEvent extends ProfileEvent {
  final String email;
  final String nama;
  final BuildContext context;
  ChangeNameEvent(
      {required this.email, required this.nama, required this.context});

  @override
  List<Object?> get props => [email, nama, context];
}

final class LoadProfile extends ProfileEvent{
  final String email;
  LoadProfile({required this.email});
  
  @override
  List<Object?> get props => [email];
}

