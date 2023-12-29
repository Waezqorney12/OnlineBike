part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterLoading extends RegisterState{}
final class RegisterSuccess extends RegisterState{}
final class RegisterErrorState extends RegisterState{}
