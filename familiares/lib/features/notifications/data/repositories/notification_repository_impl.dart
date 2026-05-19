import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/logger/app_logger.dart';
import '../../domain/entities/patient_notification.dart';
import '../../domain/repositories/notification_repository.dart';
import '../datasources/notification_remote_datasource.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource _dataSource;

  const NotificationRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<PatientNotification>>> getPatientNotifications(
    int idHospital,
    String codPublicoPaciente,
  ) async {
    try {
      final dtos = await _dataSource.getPatientNotifications(
        idHospital,
        codPublicoPaciente,
      );
      return Right(dtos.map((dto) => dto.toDomain()).toList());
    } on DioException catch (e) {
      AppLogger.error('Error fetching notifications', e);
      return Left(ServerFailure(
        e.response?.statusMessage ?? 'Error de red',
        statusCode: e.response?.statusCode,
      ));
    } catch (e) {
      AppLogger.error('Unexpected error', e);
      return Left(ServerFailure('Error inesperado'));
    }
  }
}