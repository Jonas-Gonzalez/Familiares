import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/patient_notification.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<PatientNotification>>> getPatientNotifications(
      String publicCode);
}