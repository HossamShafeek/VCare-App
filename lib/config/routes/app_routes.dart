import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/core/animations/page_fade_transition.dart';
import 'package:vcare_app/core/animations/page_slide_transition.dart';
import 'package:vcare_app/core/api/api_services_implementation.dart';
import 'package:vcare_app/core/utils/app_strings.dart';
import 'package:vcare_app/feature/authentication/data/repository/authentication_repository_implementation.dart';
import 'package:vcare_app/feature/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:vcare_app/feature/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:vcare_app/feature/authentication/presentation/login_view.dart';
import 'package:vcare_app/feature/authentication/presentation/views/register.dart';
import 'package:vcare_app/feature/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:vcare_app/feature/home/presentation/views/home_view.dart';
import 'package:vcare_app/feature/home/presentation/views/layout_view.dart';
import 'package:vcare_app/feature/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:vcare_app/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:vcare_app/feature/splash/presentation/views/splash_view.dart';

class Routes {
  static const String slashView = '/';
  static const String loginView = '/login_view';
  static const String homeView = '/home_view';
  static const String onBoardingView = '/onBoarding_view';
  static const String registerView = '/register_view';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.slashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.onBoardingView:
        return PageFadeTransition(
          page: BlocProvider(
            create: (context) => OnBoardingCubit(),
            child: const OnBoardingView(),
          ),
        );
      case Routes.loginView:
        return PageFadeTransition(
          page: BlocProvider(
            create: (context) => LoginCubit(
                AuthenticationRepositoryImplementation(
                    ApiServicesImplementation())),
            child: const LoginView(),
          ),
        );
      case Routes.registerView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegisterCubit(
                AuthenticationRepositoryImplementation(
                    ApiServicesImplementation())),
            child: const RegisterView(),
          ),
        );
      case Routes.homeView:
        return PageSlideTransition(
          page: BlocProvider(
              create: (context) => BottomNavigationCubit(),
              child: const LayoutView()),
          direction: AxisDirection.left,
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
