import 'package:fwd_app/core/network/api_client.dart';
import 'package:fwd_app/core/network/api_constants.dart';
import 'package:fwd_app/core/error/exceptions.dart';
import 'package:fwd_app/features/hospital/data/dto/hospital_data_dto.dart';

abstract class HospitalRemoteDataSource {
  Future<HospitalDataDto> getHospitalData();
}

class HospitalRemoteDataSourceImpl implements HospitalRemoteDataSource {
  final ApiClient _apiClient;

  HospitalRemoteDataSourceImpl(this._apiClient);

  @override
  Future<HospitalDataDto> getHospitalData() async {
    try {
      final response = await _apiClient.get(
        '/info-hospital/${ApiConstants.hospitalId}',
      );
      return HospitalDataDto.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw ServerException('Error al obtener datos del hospital');
    }
  }
}