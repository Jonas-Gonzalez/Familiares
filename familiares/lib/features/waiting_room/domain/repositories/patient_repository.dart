import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/patient_status.dart';

abstract class PatientRepository {
  Future<Either<Failure, List<PatientStatus>>> getPatientStatuses(
      String publicCode);
}