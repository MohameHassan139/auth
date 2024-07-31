import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../constant/enum.dart';
import '../../../../../core/utils/cashe_helper.dart';
import '../../../data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());
  AuthRepo authRepo;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool ispassword = true;
  bool isChecked = false;
  Auth auth = Auth.login;
  IconData icon = Icons.remove_red_eye;
  bool isloading = false;
  void toggleAuth() {
    if (auth == Auth.login) {
      auth = Auth.register;
      emit(AuthRegister());
    } else {
      auth = Auth.login;

      emit(AuthLogin());
    }
  }

  void showPassword() {
    ispassword = !ispassword;
    if (ispassword) {
      icon = Icons.remove_red_eye;
    } else {
      icon = Icons.password_sharp;
    }
    emit(ShowPassword());
  }

  void updateRememberMe(bool value) {
    emit(AuthRememberMeUpdated(value));
  }



   Future<void> login() async {
    isloading = true;
    emit(LoginLoading());
    var result = await authRepo.login(email: emailController.text, password: passwordController.text);
    result.fold((success) {
      print('>>>>>>>>>success >> $success <<<<<<<<<<<<<<<<<<');
      if (success.isNotEmpty && isChecked) {
        CacheHelper.prefs?.setString('token', success);
      }

      isloading = false;
      emit(LoginSuccess());
    }, (failure) {
      isloading = false;
      emit(LoginFailure(error: failure.errorMessage));
    });
  }


   Future<void> register() async {
    emit(RegisterLoading());
    
    var result = await authRepo.register(
        email: emailController.text, password: passwordController.text);
    result.fold((success) {
      if (success.isNotEmpty && isChecked) {
        CacheHelper.prefs?.setString('token', success);
      }
     
      emit(RegisterSuccess());
    }, (failure) {
      emit(RegisterFailure(error: failure.errorMessage));
    });
  }

}
