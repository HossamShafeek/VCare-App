import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/core/utils/app_strings.dart';
import 'package:vcare_app/core/widgets/custom_text_field.dart';
import 'package:vcare_app/core/widgets/title_and_subtitle.dart';
import 'package:vcare_app/feature/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:vcare_app/feature/authentication/presentation/cubits/login_cubit/login_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: const LoginViewBody(),
    );
  }
}

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndSubtitle(
          subtitle: AppStrings.loginTitle,
          title: AppStrings.loginSubtitle,
        ),

      ],
    );
  }
}


class LoginTextsFieldsSection extends StatelessWidget {
  const LoginTextsFieldsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(
      listener: (context, state) {

      },
        builder: (context, state) {
          return Column(
            children: [
              CustomTextField(
                textInputType: TextInputType.emailAddress,
                controller: LoginCubit.get(context).emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                title: 'Email',
                hintText: 'Enter your email',
              ),
              CustomTextField(
                textInputType: TextInputType.visiblePassword,
                controller: LoginCubit.get(context).passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 8) {
                    return 'Password is too short';
                  }
                  return null;
                },
                title: 'Password',
                hintText: 'Enter your password',
              ),
            ],
          );
        },

    );
  }
}
