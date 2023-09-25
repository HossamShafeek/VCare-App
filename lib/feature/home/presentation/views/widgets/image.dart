import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare_app/core/utils/app_colors.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.indigo,
          borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(20),
              bottomEnd: Radius.circular(20))),
      alignment: Alignment.topLeft,
      height: 210.5.h,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xff0E194D).withOpacity(0.3),
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.close,
                    size: 30.sp,
                  ),
                  color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
