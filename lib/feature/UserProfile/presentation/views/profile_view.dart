import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare_app/config/icons/icons_broken.dart';
import 'package:vcare_app/core/utils/app_assets.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/utils/app_styles.dart';
import 'package:vcare_app/feature/UserProfile/presentation/views/widgets/BookingCard.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Image.asset(
                AppAssets.user,
                height: 100.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "user name",
                style: AppStyles.textStyle25.copyWith(color: AppColors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("edit account details ",
                      style: AppStyles.textStyle18
                          .copyWith(color: AppColors.grey)),
                  InkWell(onTap: () {}, child: const Icon(IconBroken.Edit)),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                  width: 302,
                  height: 1,
                  decoration: const BoxDecoration(color: Color(0xb2030e19))),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    const Icon(IconBroken.Message),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text("employee@email.com", style: AppStyles.textStyle18)
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    const Icon(IconBroken.Call),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text("+20123178903", style: AppStyles.textStyle18)
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    const Icon(IconBroken.Lock),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text("•••••••••••", style: AppStyles.textStyle18),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Icon(IconBroken.Show),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("History",
                            style: AppStyles.textStyle25
                                .copyWith(color: AppColors.black)),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                            width: 57,
                            height: 1,
                            decoration:
                                const BoxDecoration(color: Color(0xb2030e19))),
                        SizedBox(
                          height: 20.h,
                        ),
                        const BookingCard(
                            date: "Booking date", status: "status"),
                        const BookingCard(
                            date: "Booking date", status: "status"),
                        const BookingCard(
                            date: "Booking date", status: "status"),
                        const BookingCard(
                            date: "Booking date", status: "status"),
                        const BookingCard(
                            date: "Booking date", status: "status")
                      ],
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
