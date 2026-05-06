//lib\features/waiting_room/data/dto/patient_status_dto.dart
import 'package:fwd_app/features/waiting_room/domain/entities/patient_status.dart';

class PatientStatusDto {
  final String codPublicoPaciente;
  final String codEstadoPublico;
  final String codEstadoFechaHora;
  final String texto;
  final String? destino;
  final String? habitacion;

  const PatientStatusDto({
    required this.codPublicoPaciente,
    required this.codEstadoPublico,
    required this.codEstadoFechaHora,
    required this.texto,
    this.destino,
    this.habitacion,
  });

  factory PatientStatusDto.fromJson(Map<String, dynamic> json) {
    return PatientStatusDto(
      codPublicoPaciente: json['cod_publico_paciente'] as String,
      codEstadoPublico: json['codestado_publico'] as String,
      codEstadoFechaHora: json['codestado_fechahora'] as String,
      texto: json['texto'] as String,
      destino: json['destino'] as String?,
      habitacion: json['habitacion'] as String?,
    );
  }

  PatientStatus toDomain() {
    return PatientStatus(
      codPublicoPaciente: codPublicoPaciente,
      codEstadoPublico: codEstadoPublico,
      fechaHora: DateTime.tryParse(codEstadoFechaHora) ?? DateTime.now(),
      texto: texto,
      destino: destino,
      habitacion: habitacion,
    );
  }
}
