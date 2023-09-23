import 'package:dartz/dartz.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/feature/home/data/models/home_model/home_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeModel>> getHomeData();
}
