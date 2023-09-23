import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/feature/onboarding/presentation/views/widgets/onboarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: AppColors.transparent,
        ),
        child: OnBoardingViewBody(),
      ),
    );
  }
}
