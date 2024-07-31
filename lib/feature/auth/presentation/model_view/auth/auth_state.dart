part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLogin extends AuthState {}

class AuthRegister extends AuthState {}

class AuthRememberMeUpdated extends AuthState {
  final bool rememberMe;

  AuthRememberMeUpdated(this.rememberMe);
}

class ShowPassword extends AuthState{}


final class LoginLoading extends AuthState {}

final class LoginFailure extends AuthState {
  final String error;
  LoginFailure({required this.error});
}

final class LoginSuccess extends AuthState {
 
  LoginSuccess();
}



final class RegisterFailure extends AuthState {
  final String error;
  RegisterFailure({required this.error});
}

final class RegisterSuccess extends AuthState {
  RegisterSuccess();
}

final class RegisterLoading extends AuthState {}
