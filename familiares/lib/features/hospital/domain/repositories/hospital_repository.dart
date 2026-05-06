import 'package:dartz/dartz.dart';
import 'package:fwd_app/core/error/failures.dart';
import 'package:fwd_app/features/hospital/domain/entities/hospital.dart';
import 'package:fwd_app/features/hospital/domain/entities/estado_publico.dart';
import 'package:fwd_app/features/hospital/domain/entities/opcion_menu.dart';
import 'package:fwd_app/features/hospital/domain/entities/idioma.dart';

abstract class HospitalRepository {
  Future<Either<Failure, Hospital>> getHospital();
  Future<Either<Failure, List<EstadoPublico>>> getEstadosPublicos();
  Future<Either<Failure, List<OpcionMenu>>> getOpcionesMenu();
  Future<Either<Failure, List<Idioma>>> getIdiomas();
}