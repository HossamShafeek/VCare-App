import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/config/local/cache_helper.dart';
import 'package:vcare_app/config/routes/app_routes.dart';
import 'package:vcare_app/core/functions/show_snack_bar.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/utils/app_strings.dart';
import 'package:vcare_app/core/utils/app_styles.dart';
import 'package:vcare_app/core/widgets/custom_text_field.dart';
import 'package:vcare_app/core/widgets/gradient_button.dart';
import 'package:vcare_app/core/widgets/title_and_subtitle.dart';
import 'package:vcare_app/feature/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:vcare_app/feature/authentication/presentation/cubits/register_cubit/register_state.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion(
        value: AppConstants.systemUiOverlayStyle,
        child: RegisterViewBody(),
      ),
    );
  }
}

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          CacheHelper.setString(
            key: 'token',
            value: RegisterCubit.get(context).registerModel!.data!.token!,
          );
          Navigator.pushNamed(context, Routes.homeView);
          showSuccessSnackBar(
              context: context, message: state.authenticationModel.message!);
        }else if(state is RegisterFailureState){
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.defaultPadding),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TitleAndSubtitle(
                      subtitle: AppStrings.registerSubtitle,
                      title: AppStrings.registerTitle,
                    ),
                    const RegisterTextsFieldsSection(),
                    const UserGenderGroup(),
                    GradientButton(
                      title: AppStrings.register,
                      onPressed: () {
                        if(RegisterCubit.get(context).formKey.currentState!.validate()){
                          RegisterCubit.get(context).userRegister();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class RegisterTextsFieldsSection extends StatelessWidget {
  const RegisterTextsFieldsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: RegisterCubit.get(context).formKey,
          child: Column(
            children: [
              CustomTextField(
                textInputType: TextInputType.name,
                controller: RegisterCubit.get(context).nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                title: 'Name',
                hintText: 'Enter your name',
              ),
              CustomTextField(
                textInputType: TextInputType.emailAddress,
                controller: RegisterCubit.get(context).emailController,
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
                controller: RegisterCubit.get(context).passwordController,
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
              CustomTextField(
                textInputType: TextInputType.visiblePassword,
                controller: RegisterCubit.get(context).confirmPasswordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your confirm password';
                  } else if (RegisterCubit.get(context).passwordController.text !=
                      RegisterCubit.get(context).confirmPasswordController.text) {
                    return 'password didn\'t matched';
                  }
                  return null;
                },
                title: 'Confirm Password',
                hintText: 'Enter your confirm password',
              ),
              CustomTextField(
                textInputType: TextInputType.phone,
                controller: RegisterCubit.get(context).phoneController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone';
                  }
                  return null;
                },
                title: 'Phone',
                hintText: 'Enter your phone',
                maxLength: 11,
                paddingForBottom: 0,
              ),
            ],
          ),
        );
      },
    );
  }
}

class UserGenderGroup extends StatelessWidget {
  const UserGenderGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RadioMenuButton(
                value: 0,
                groupValue: RegisterCubit.get(context).gender,
                onChanged: (value) {
                  RegisterCubit.get(context).changeGroupValue(newValue: value!);
                },
                child: Text(
                  'Male',
                  style: AppStyles.textStyle14,
                ),
              ),
              RadioMenuButton(
                value: 1,
                groupValue: RegisterCubit.get(context).gender,
                child: Text(
                  'Female',
                  style: AppStyles.textStyle14,
                ),
                onChanged: (value) {
                  RegisterCubit.get(context).changeGroupValue(newValue: value!);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
