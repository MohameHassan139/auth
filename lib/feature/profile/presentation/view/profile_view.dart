import 'package:auth/constant/colors.dart';
import 'package:auth/feature/auth/presentation/view/widget/custom_bottom.dart';
import 'package:auth/feature/profile/data/models/user_data.dart';
import 'package:auth/feature/profile/presentation/model_view/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/cashe_helper.dart';
import '../../../auth/presentation/view/widget/custom_appbar.dart';
import '../../../auth/presentation/view/widget/page_tile.dart';
import 'widget/custom_textformfield.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  TextEditingController userNameController =
      TextEditingController(text: "mohamed hassan");
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProfileCubit>(context);
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is GetProfileScucess) {
            return SuccessWidget(
              userData: state.userData,
            );
          } else if (state is GetProfileFailure) {
            return Center(
              child: Text(state.error),
            );
          } else{
            return  const Center(
              child: CircularProgressIndicator(),
            );}
        },
      ),
    );
  }
}

class SuccessWidget extends StatelessWidget {
  SuccessWidget({
    super.key,
    required this.userData,
  });
  UserData userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar(),
        const SizedBox(
          height: 20,
        ),
        pageTile(
          text: "Log in to Your accont",
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextFormField(
                labelText: 'UserName',
                textController:
                    TextEditingController(text: "${userData.data?.firstName}"),
                readOnly: true,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                labelText: 'E-mail',
                textController:
                    TextEditingController(text: "${userData.data?.email}"),
                readOnly: true,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                labelText: 'Gender',
                textController:
                    TextEditingController(text: "${userData.support?.text}"),
                readOnly: true,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomBottom(
                onTap: () {
                  CacheHelper.prefs?.clear();

                  GoRouter.of(context).goNamed(AppRoutNamed.aurhView);
                },
                text: "Log out",
                color: AppColors.KredColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
