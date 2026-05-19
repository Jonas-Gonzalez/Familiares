import 'package:injectable/injectable.dart';
import '../../../../core/network/api_client.dart';
import '../dto/notification_dto.dart';

abstract class NotificationRemoteDataSource {
  Future<List<PatientNotificationDto>> getPatientNotifications(
    int idHospital,
    String codPublicoPaciente,
  );
}

@LazySingleton(as: NotificationRemoteDataSource)
class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final ApiClient _apiClient;

  const NotificationRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<PatientNotificationDto>> getPatientNotifications(
    int idHospital,
    String codPublicoPaciente,
  ) async {
    final response = await _apiClient.get<List<dynamic>>('/notificaciones');
    

    return (response.data as List)
        .map((e) => PatientNotificationDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}