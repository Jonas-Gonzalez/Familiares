import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/patient_notification.dart';
import '../repositories/notification_repository.dart';

class GetPatientNotifications {
  final NotificationRepository repository;
  const GetPatientNotifications(this.repository);

  Future<Either<Failure, List<PatientNotification>>> call(String publicCode) =>
      repository.getPatientNotifications(publicCode);
}