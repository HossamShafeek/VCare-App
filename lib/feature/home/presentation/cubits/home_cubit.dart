import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/feature/home/data/models/home_model/home_model.dart';
import 'package:vcare_app/feature/home/data/repository/home_repository.dart';
import 'package:vcare_app/feature/home/presentation/cubits/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(HomeInitialState());

  final HomeRepository homeRepository;

  static HomeCubit get(context) => BlocProvider.of(context);

  HomeModel? homeModel;

  Future<void> homeList() async {
    emit(HomeLoadingState());
    Either<Failure, HomeModel> result;
    result = await homeRepository.getHomeData();
    result.fold((failure) {
      emit(HomeFailureState(failure.error));
    }, (homeModel) {
      this.homeModel = homeModel;
      emit(HomeSuccessState(homeModel));
    });
  }
}
