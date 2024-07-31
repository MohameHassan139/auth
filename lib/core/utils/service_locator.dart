import 'package:auth/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

import '../../feature/profile/data/repo/profile_repo_impl.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
  
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
  getIt.registerSingleton<ProfileRepoImpl>(ProfileRepoImpl());
}
