import 'package:dartz/dartz.dart';
import 'package:vcare_app/core/errors/failures.dart';
import 'package:vcare_app/feature/appointment/data/model/appointments_model/appointments_model.dart';

abstract class AppointmentRepository {
  Future<Either<Failure, AppointmentsModel>> getAppointments();
}
