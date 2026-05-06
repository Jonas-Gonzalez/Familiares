import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/patient_status.dart';
import '../repositories/patient_repository.dart';

class GetPatientStatuses {
  final PatientRepository repository;
  const GetPatientStatuses(this.repository);

  Future<Either<Failure, List<PatientStatus>>> call(String publicCode) =>
      repository.getPatientStatuses(publicCode);
}