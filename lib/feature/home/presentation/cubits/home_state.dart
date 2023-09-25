import 'package:vcare_app/feature/home/data/models/home_model/home_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final HomeModel homeModel;

  HomeSuccessState(this.homeModel);
}

class HomeFailureState extends HomeState {
  final String error;

  HomeFailureState(this.error);
}
