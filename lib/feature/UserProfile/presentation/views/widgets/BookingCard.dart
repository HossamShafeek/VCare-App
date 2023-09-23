import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/core/utils/app_styles.dart';

class BookingCard extends StatefulWidget {
  final String date;
  final String status;
  const BookingCard({super.key, required this.date, required this.status});

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          height: 25.h,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.black),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              Text(widget.date,
                  style: AppStyles.textStyle12.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.black)),
              const Spacer(),
              Text(widget.status,
                  style: AppStyles.textStyle12.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.black))
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
