import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/feature/authentication/data/models/authentication_model/authentication_model.dart';
import 'package:vcare_app/feature/authentication/data/repository/authentication_repository.dart';
import 'package:vcare_app/feature/authentication/presentation/cubits/login_cubit/login_state.dart';
import 'package:vcare_app/feature/authentication/presentation/cubits/register_cubit/register_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authenticationRepository) : super(LoginInitialState());

  final AuthenticationRepository authenticationRepository;

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isShowPassword = true;

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    emit(LoginChangePasswordVisibilityState());
  }

  AuthenticationModel? loginModel;

  Future<void> userRegister() async {
    emit(LoginLoadingState());
    Either<Failure, AuthenticationModel> result;
    result = await authenticationRepository.userLogin(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold((failure) {
      emit(LoginFailureState(failure.error));
    }, (loginModel) {
      this.loginModel = loginModel;
      AppConstants.token = loginModel.data!.token!;
      print(loginModel.data!.username);
      emit(LoginSuccessState(loginModel));
    });
  }
}