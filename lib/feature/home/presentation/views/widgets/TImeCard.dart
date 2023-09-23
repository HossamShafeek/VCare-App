import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare_app/core/utils/app_colors.dart';

class TimeCard extends StatelessWidget {
  final String time;
  const TimeCard({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 29.h,
        width: 60.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: const Color.fromARGB(255, 222, 222, 222)),
        child: Center(
          child: Text(
            time,
            style: TextStyle(color: AppColors.black, fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
