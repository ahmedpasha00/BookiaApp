part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

final class LoginLodingState extends AuthState {}
final class LoginSuccessState extends AuthState {}
final class LoginErrorState extends AuthState {
  final String errorMassage;
  LoginErrorState(this.errorMassage);
}

final class RegisterLodingState extends AuthState {}
final class RegisterSuccessState extends AuthState {}
final class RegisterErrorState extends AuthState {
  final String errorMassage;
  RegisterErrorState(this.errorMassage);
}

