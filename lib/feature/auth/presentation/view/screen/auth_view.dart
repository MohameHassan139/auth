import 'package:auth/core/utils/app_router.dart';
import 'package:auth/feature/auth/presentation/model_view/auth/auth_cubit.dart';
import 'package:auth/feature/auth/presentation/view/widget/custom_textformfield.dart';
import 'package:auth/constant/colors.dart';
import 'package:auth/constant/constant.dart';
import 'package:auth/constant/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';

import '../widget/custom_appbar.dart';
import '../widget/custom_bottom.dart';
import '../widget/page_tile.dart';

class AuthView extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppbar(),
                const SizedBox(
                  height: 20,
                ),
                pageTile(
                  text: cubit.auth == Auth.login
                      ? "Log in to your account"
                      : "Create new account",
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          textController: cubit.emailController,
                          labelText: 'Email',
                          validator:
                              ValidationBuilder().email().maxLength(50).build(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Visibility(
                          visible: cubit.auth == Auth.register,
                          child: Column(
                            children: [
                              CustomTextFormField(
                                textController: cubit.userNameController,
                                labelText: 'User Name',
                                validator:
                                    ValidationBuilder().maxLength(50).build(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        CustomTextFormField(
                          labelText: 'password',
                          textController: cubit.passwordController,
                          ispassword: cubit.ispassword,
                          validator: ValidationBuilder()
                              .minLength(6)
                              .maxLength(50)
                              .build(),
                          suffix: IconButton(
                              onPressed: cubit.showPassword,
                              icon: Icon(cubit.icon)),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: cubit.isChecked,
                              onChanged: (value) {
                                cubit.isChecked = value!;
                                cubit.updateRememberMe(value);
                              },
                            ),
                            Text(
                              'Remember me',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: cubit.auth == Auth.login
                                  ? () {
                                      // TODO
                                    }
                                  : () {
                                      // TODO
                                    },
                              child: Text(
                                cubit.auth == Auth.login
                                    ? 'Forgot password?'
                                    : 'Have a problem?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                          ],
                        ),
                        Visibility(
                          visible: !cubit.isloading,
                          replacement: const CupertinoActivityIndicator(animating: true, radius: 24,),
                          child: CustomBottom(
                            onTap: () async {
                              if (_key.currentState!.validate()) {
                                try {
                                  cubit.auth == Auth.login
                                      ? await cubit.login().then((_){
                                        GoRouter.of(context)
                                      .goNamed(AppRoutNamed.profileView);
                                      })
                                      : await cubit.register().then((_) {
                                          GoRouter.of(context).goNamed(
                                              AppRoutNamed.profileView);
                                        });
                                   
                                }  catch (e) {
                                 
                                  if (state is LoginFailure) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(state.error),
                                    ));
                                  }else  if (state is RegisterFailure) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(state.error),
                                    ));
                                  }else {
                                     ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(e.toString()),
                                    ));
                                  }
                                }
                                // Perform login or register action
                              }
                            },
                            text: cubit.auth == Auth.login ? "Login" : "Register",
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Text(
                              cubit.auth == Auth.login
                                  ? 'Don’t have an account?'
                                  : "Already have an account?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: AppColors.KgreyColor,
                                  ),
                            ),
                            TextButton(
                              onPressed: () {
                                cubit.emailController.clear();
                                cubit.passwordController.clear();
                                cubit.userNameController.clear();

                                _key.currentState!.reset();

                                cubit.toggleAuth();
                              },
                              child: Text(
                                cubit.auth == Auth.login ? 'Register' : "Login",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
