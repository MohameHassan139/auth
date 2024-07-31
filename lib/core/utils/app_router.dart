import 'package:auth/core/utils/cashe_helper.dart';
import 'package:auth/core/utils/service_locator.dart';
import 'package:auth/feature/profile/data/repo/profile_repo_impl.dart';
import 'package:auth/feature/profile/presentation/model_view/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../feature/auth/data/repo/auth_repo_impl.dart';
import '../../feature/auth/presentation/model_view/auth/auth_cubit.dart';
import '../../feature/auth/presentation/view/screen/auth_view.dart';
import '../../feature/profile/presentation/view/profile_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: CacheHelper.prefs!.getString('token') == null
        ? AppRoutNamed.aurhView
        : AppRoutNamed.profileView,
    routes: [
      // SearchView

      // customGoRoute(
      //   name: AppRoutNamed.SearchView,
      //   path: AppRoutNamed.SearchView,
      //   child: BlocProvider<FetchSearchBooksCubit>(
      //     create: (context) => FetchSearchBooksCubit(
      //       searchRepo: getIt.get<SearchRepoImpl>(),
      //     ),
      //     child: AuthView(),
      //   ),
      // ),
      customGoRoute(
        name: AppRoutNamed.aurhView,
        path: AppRoutNamed.aurhView,
        child: BlocProvider(
          create: (context) => AuthCubit(
            authRepo: getIt.get<AuthRepoImpl>(),
          ),
          child: AuthView(),
        ),
      ),
      customGoRoute(
        name: AppRoutNamed.profileView,
        path: AppRoutNamed.profileView,
        child: BlocProvider(
          create: (context) => ProfileCubit(
             profileRepo: getIt.get<ProfileRepoImpl>()
          )..getProfile(),
          child: ProfileView(),
        ),
      ),
    ],
  );

  static GoRoute customGoRoute({
    required String path,
    required String name,
    required Widget child,
  }) {
    return GoRoute(
      path: path,
      name: name,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Change the opacity of the screen using a Curve based on the the animation's
            // value
            const begin = Offset(1.0, 1.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
      },
    );
  }
}

class AppRoutNamed {
  static const String aurhView = '/authView';
  static const String profileView = '/profileView';
}
