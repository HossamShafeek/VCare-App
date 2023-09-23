import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/core/widgets/gradient_button.dart';
import 'package:vcare_app/feature/home/data/models/home_model/doctor.dart';
import 'package:vcare_app/feature/home/presentation/views/widgets/DatePicker.dart';
import 'package:vcare_app/feature/home/presentation/views/widgets/TImeCard.dart';
import 'package:vcare_app/feature/home/presentation/views/widgets/image.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
    children: [
          const ImageWidget(),
          Padding(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(doctor.name!,
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w400,
                    )),
                SizedBox(
                  height: 17.h,
                ),
                 Text(
                    doctor.description!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
                SizedBox(
                  height: 11.h,
                ),
                Container(
                    width: double.infinity,
                    height: 1,
                    decoration: const BoxDecoration(color: Color(0x4c020d18))),
                SizedBox(
                  height: 12.h,
                ),
                Text("Select date",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )),
                const CustomDatePicker(),
                SizedBox(
                  height: 18.h,
                ),
                Text("Select time",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )),
                SizedBox(
                  height: 8.h,
                ),
                 const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TimeCard(time: "7:00"),
                    TimeCard(time: "9:00"),
                    TimeCard(time: "13:00"),
                    TimeCard(time: "15:00"),
                  ],
                ),
                SizedBox(
                  height: 33.h,
                ),
                GradientButton(onPressed: () {}, title: "Book An Appointment")
              ],
            ),
          )
    ],
          ),
        ),
      ),
    );
  }
}
