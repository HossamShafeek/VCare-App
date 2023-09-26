import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vcare_app/core/api/api_services.dart';
import 'package:vcare_app/core/api/end_points.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/core/utils/app_constants.dart';
import 'package:vcare_app/feature/appointment/data/model/appointments_model/appointments_model.dart';
import 'package:vcare_app/feature/appointment/data/repository/appointment_repository.dart';

class AppointmentRepositoryImplementation extends AppointmentRepository {
  final ApiServices apiServices;

  AppointmentRepositoryImplementation(this.apiServices);

  @override
  Future<Either<Failure, AppointmentsModel>> getAppointments() async {
    try {
      Response data = await apiServices.get(
        endPoint: EndPoints.getAllAppointment,
        token: AppConstants.token,
      );
      return Right(AppointmentsModel.fromJson(data.data));
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure(error.response!.data['message'].toString()));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
