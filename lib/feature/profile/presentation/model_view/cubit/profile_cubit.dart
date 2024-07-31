import 'package:auth/feature/profile/data/models/user_data.dart';
import 'package:auth/feature/profile/data/repo/profile_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());
  ProfileRepo profileRepo;

  Future<void> getProfile() async {
    emit(GetProfileLoading());
    var result = await profileRepo.getProfile(id: 2);
    result.fold((success) {
      print('>>>>>>>>>success >> $success <<<<<<<<<<<<<<<<<<');

      emit(GetProfileScucess(userData: success));
    }, (failure) {
      emit(GetProfileFailure(error: failure.errorMessage));
    });
  }
}
