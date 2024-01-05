part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordState extends Equatable{}

final class ForgotPasswordInitial extends ForgotPasswordState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
final class ForgotPasswordLoadingState extends ForgotPasswordState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
final class ForgotPasswordSuccessState extends ForgotPasswordState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
final class ForgotPasswordErrorState extends ForgotPasswordState{
  final String errorMessage;
  ForgotPasswordErrorState({required this.errorMessage});
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
