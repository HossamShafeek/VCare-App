import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/core/api/api_services_implementation.dart';
import 'package:vcare_app/core/utils/app_strings.dart';
import 'package:vcare_app/feature/authentication/data/repository/authentication_repository_implementation.dart';
import 'package:vcare_app/feature/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:vcare_app/feature/authentication/presentation/views/register.dart';
import 'package:vcare_app/feature/home_view.dart';

class Routes {
  static const String loginView = '/';
  static const String homeView = '/home_view';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegisterCubit(
                AuthenticationRepositoryImplementation(
                    ApiServicesImplementation())),
            child: const RegisterView(),
          ),
        );
      case Routes.homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
    }
    return undefinedRoute();
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}
