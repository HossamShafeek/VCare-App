import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/core/api/api_services_implementation.dart';
import 'package:vcare_app/core/utils/app_colors.dart';
import 'package:vcare_app/feature/home/data/models/home_model/data.dart';
import 'package:vcare_app/feature/home/data/models/home_model/doctor.dart';
import 'package:vcare_app/feature/home/data/repository/home_repository_implementaion.dart';
import 'package:vcare_app/feature/home/presentation/cubits/home_cubit.dart';
import 'package:vcare_app/feature/home/presentation/cubits/home_state.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(HomeRepositoryImplementation(ApiServicesImplementation()))
            ..homeList(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccessState) {
            return ListView.separated(
                itemBuilder: (context, index) => buildHomeList(
                    HomeCubit.get(context).homeModel!.data![index]),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                itemCount: HomeCubit.get(context).homeModel!.data!.length);
          } else if (state is HomeFailureState) {
            return Text(state.error.toString());
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Padding buildHomeList(Data model) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.name!,
                style: const TextStyle(color: AppColors.grey, fontSize: 18),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  'view all',
                  style: TextStyle(color: AppColors.black, fontSize: 18),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 225,
            child: buildDoctorsList(model),
          ),
        ],
      ),
    );
  }

  ListView buildDoctorsList(Data model) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            buildFirstListItem(model.doctors![index]),
        separatorBuilder: (context, index) => const SizedBox(
              width: 25,
            ),
        itemCount: model.doctors!.length);
  }

  Container buildFirstListItem(Doctor model) => Container(
        width: 200,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.indigo, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.indigo,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          model.name!,
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        model.description!,
                        style: const TextStyle(
                            color: AppColors.grey, fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(
                    'more details',
                    style: TextStyle(color: AppColors.grey, fontSize: 15),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: AppColors.indigo,
                        size: 25,
                      )),
                ],
              ),
            )
          ],
        ),
      );
}
