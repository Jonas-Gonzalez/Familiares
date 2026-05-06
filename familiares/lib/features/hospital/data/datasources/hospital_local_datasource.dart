import 'dart:convert';
import 'package:fwd_app/core/error/exceptions.dart';
import 'package:fwd_app/core/network/api_constants.dart';
import 'package:fwd_app/core/storage/local_storage.dart';
import 'package:fwd_app/features/hospital/data/dto/hospital_data_dto.dart';

abstract class HospitalLocalDataSource {
  Future<HospitalDataDto> getCachedHospitalData();
  Future<void> cacheHospitalData(HospitalDataDto dto);
  Future<bool> isCacheValid();
}

class HospitalLocalDataSourceImpl implements HospitalLocalDataSource {
  final LocalStorage _storage;

  HospitalLocalDataSourceImpl(this._storage);

  @override
  Future<HospitalDataDto> getCachedHospitalData() async {
    final json = await _storage.getString('app_data');
    if (json == null) throw CacheException('No hay datos en caché');
    return HospitalDataDto.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }

  @override
  Future<void> cacheHospitalData(HospitalDataDto dto) async {
    final timestamp = DateTime.now().toIso8601String();
    await _storage.setString('app_data', jsonEncode(dto.toJson()));
    await _storage.setString('cache_timestamp', timestamp);
  }

  @override
  Future<bool> isCacheValid() async {
    final timestamp = await _storage.getString('cache_timestamp');
    if (timestamp == null) return false;

    final lastUpdate = DateTime.tryParse(timestamp);
    if (lastUpdate == null) return false;

    final difference = DateTime.now().difference(lastUpdate);
    return difference < ApiConstants.cacheMaxAge;
  }
}