import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/config/icons/icons_broken.dart';
import 'package:vcare_app/config/routes/app_routes.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/feature/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:vcare_app/feature/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_state.dart';
import 'package:vcare_app/feature/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) => Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.indigo,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: const Text(
            'VCare',
            style: TextStyle(color: AppColors.white),
          ),
        ),
        body: BottomNavigationCubit.get(context)
            .bodyScreens[BottomNavigationCubit.get(context).currentIndex],
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.indigo,
          onPressed: () {
            Navigator.pushNamed(context, Routes.searchView);
          },
          child: const Icon(IconBroken.Search),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
