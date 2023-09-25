import 'package:flutter/material.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_styles.dart';
import 'package:vcare_app/feature/search/presentation/cubit/search_cubit.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: SearchCubit.get(context).searchController,
      maxLines: 1,
      cursorColor: AppColors.white,
      //textInputAction: TextInputAction.search,
      onChanged: (value) {
        SearchCubit.get(context).getSearchedDoctorsList(doctorName: value);
      },
      style: AppStyles.textStyle18.copyWith(color: AppColors.white),
      decoration:  InputDecoration(
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: AppStyles.textStyle16.copyWith(color: AppColors.white),
      ),
    );
  }
}
