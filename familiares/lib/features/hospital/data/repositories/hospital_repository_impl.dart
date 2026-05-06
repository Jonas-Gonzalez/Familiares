// lib/features/hospital/data/repositories/hospital_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:fwd_app/core/error/exceptions.dart';
import 'package:fwd_app/core/error/failures.dart';
import 'package:fwd_app/core/logger/app_logger.dart';
import 'package:fwd_app/features/hospital/data/datasources/hospital_local_datasource.dart';
import 'package:fwd_app/features/hospital/data/datasources/hospital_remote_datasource.dart';
import 'package:fwd_app/features/hospital/domain/entities/estado_publico.dart';
import 'package:fwd_app/features/hospital/domain/entities/hospital.dart';
import 'package:fwd_app/features/hospital/domain/entities/idioma.dart';
import 'package:fwd_app/features/hospital/domain/entities/opcion_menu.dart';
import 'package:fwd_app/features/hospital/domain/repositories/hospital_repository.dart';
import 'package:fwd_app/features/hospital/data/dto/hospital_data_dto.dart';

class HospitalRepositoryImpl implements HospitalRepository {
  final HospitalRemoteDataSource _remote;
  final HospitalLocalDataSource _local;

  HospitalRepositoryImpl(this._remote, this._local);

  Future<Either<Failure, HospitalDataDto>> _getData() async {
    try {
      final cacheValid = await _local.isCacheValid();
      if (cacheValid) {
        AppLogger.info('Hospital data: usando caché');
        final cached = await _local.getCachedHospitalData();
        return Right(cached);
      }

      AppLogger.info('Hospital data: obteniendo del servidor');
      final remote = await _remote.getHospitalData();
      await _local.cacheHospitalData(remote);
      return Right(remote);
    } on CacheException catch (_) {
      try {
        final remote = await _remote.getHospitalData();
        await _local.cacheHospitalData(remote);
        return Right(remote);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(ServerFailure('Error inesperado: $e'));
    }
  }

  @override
  Future<Either<Failure, Hospital>> getHospital() async {
    final result = await _getData();
    return result.map((dto) => dto.toHospital());
  }

  @override
  Future<Either<Failure, List<EstadoPublico>>> getEstadosPublicos() async {
    final result = await _getData();
    return result.map((dto) => dto.toEstados());
  }

  @override
  Future<Either<Failure, List<OpcionMenu>>> getOpcionesMenu() async {
    final result = await _getData();
    return result.map((dto) => dto.toOpcionesMenu());
  }

  @override
  Future<Either<Failure, List<Idioma>>> getIdiomas() async {
    final result = await _getData();
    return result.map((dto) => dto.toIdiomas());
  }
}