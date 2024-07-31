import 'package:auth/core/utils/cashe_helper.dart';
import 'package:auth/core/utils/service_locator.dart';
import 'package:auth/constant/colors.dart';
import 'package:flutter/material.dart';

import 'core/utils/app_router.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.KprimaryColor),
        useMaterial3: true,
      ),
      // home:  LoginView(),
        // routerConfig: AppRouter.router,
        routerConfig: AppRouter.router

      

    );
  }
}
