part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetProfileLoading extends ProfileState {}

final class GetProfileScucess extends ProfileState {
  final UserData userData;
  GetProfileScucess({required this.userData});
}

final class GetProfileFailure extends ProfileState {
  final String error;
  GetProfileFailure({required this.error});
}
