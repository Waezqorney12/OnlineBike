part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

final class DeleteProfileEvent extends ProfileEvent{
  final String email;
  final BuildContext context;
  DeleteProfileEvent({required this.email, required this.context});
}
final class ChangePhoneProfileEvent extends ProfileEvent{
  final String email;
  final String nomorTelepon;
  final BuildContext context;
  ChangePhoneProfileEvent({required this.email, required this.nomorTelepon, required this.context});
}
final class ChangeAddressProfileEvent extends ProfileEvent{
  final String email;
  final String address;
  final BuildContext context;
  ChangeAddressProfileEvent({required this.email, required this.address, required this.context});
  
}
final class ChangeNameEvent extends ProfileEvent{
  final String email;
  final String nama;
  final BuildContext context;
  ChangeNameEvent({required this.email, required this.nama, required this.context});
}