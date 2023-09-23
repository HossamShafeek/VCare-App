import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare_app/config/icons/icons_broken.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/feature/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:vcare_app/feature/home/presentation/cubits/bottom_navigation_cubit/bottom_navigation_state.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.indigo,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: Text(
            'VCare',
            style: TextStyle(color: AppColors.white),
          ),
        ),
        body: BottomNavigationCubit.get(context)
            .bodyScreens[BottomNavigationCubit.get(context).currentIndex],
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.indigo,
          onPressed: () {
            BottomNavigationCubit.get(context).changeBottomNavigation(2);
          },
          child: const Icon(IconBroken.Search),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.w,
          child: SizedBox(
            height: 55.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    BottomNavigationCubit.get(context)
                        .changeBottomNavigation(0);
                  },
                  icon: Icon(
                    IconBroken.Home,
                    color: BottomNavigationCubit.get(context).currentIndex == 2
                        ? AppColors.indigo
                        : AppColors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    BottomNavigationCubit.get(context)
                        .changeBottomNavigation(1);
                  },
                  icon: Icon(
                    IconBroken.Plus,
                    color: BottomNavigationCubit.get(context).currentIndex == 2
                        ? AppColors.indigo
                        : AppColors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    BottomNavigationCubit.get(context)
                        .changeBottomNavigation(3);
                  },
                  icon: Icon(
                    IconBroken.Time_Circle,
                    color: BottomNavigationCubit.get(context).currentIndex == 2
                        ? AppColors.indigo
                        : AppColors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    BottomNavigationCubit.get(context)
                        .changeBottomNavigation(4);
                  },
                  icon: Icon(
                    IconBroken.Profile,
                    color: BottomNavigationCubit.get(context).currentIndex == 2
                        ? AppColors.indigo
                        : AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
// bottomNavigationBar: BottomNavigationBar(
// onTap: (index) {
// BottomNavigationCubit.get(context).changeBottomNavigation(index);
// },
// currentIndex: BottomNavigationCubit.get(context).currentIndex,
// items: BottomNavigationCubit.get(context).bottomNavigationBarItems,
// ),
