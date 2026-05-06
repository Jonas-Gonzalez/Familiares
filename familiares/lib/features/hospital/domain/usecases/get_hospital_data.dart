import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/hospital.dart';
import '../entities/estado_publico.dart';
import '../entities/opcion_menu.dart';
import '../entities/idioma.dart';
import '../repositories/hospital_repository.dart';

class GetHospitalData {
  final HospitalRepository repository;
  const GetHospitalData(this.repository);

  Future<Either<Failure, Hospital>> getHospital() =>
      repository.getHospital();

  Future<Either<Failure, List<EstadoPublico>>> getEstadosPublicos() =>
      repository.getEstadosPublicos();

  Future<Either<Failure, List<OpcionMenu>>> getOpcionesMenu() =>
      repository.getOpcionesMenu();

  Future<Either<Failure, List<Idioma>>> getIdiomas() =>
      repository.getIdiomas();
}