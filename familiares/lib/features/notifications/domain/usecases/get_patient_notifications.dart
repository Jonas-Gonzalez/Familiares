import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_constants.dart';
import '../entities/patient_notification.dart';
import '../repositories/notification_repository.dart';

@lazySingleton
class GetPatientNotifications {
  final NotificationRepository _repository;

  const GetPatientNotifications(this._repository);

  Future<Either<Failure, List<PatientNotification>>> call(String codPublicoPaciente) {
    return _repository.getPatientNotifications(
      ApiConstants.hospitalId,
      codPublicoPaciente,
    );
  }
}