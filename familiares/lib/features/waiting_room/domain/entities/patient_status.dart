// lib/features/waiting_room/domain/entities/patient_status.dart
import 'package:equatable/equatable.dart';


class PatientStatus extends Equatable {
  final String codPublicoPaciente;
  final String codEstadoPublico;
  final DateTime fechaHora;
  final String? texto;
  final String? destino;
  final String? habitacion;

  const PatientStatus({
    required this.codPublicoPaciente,
    required this.codEstadoPublico,
    required this.fechaHora,
    this.texto,
    this.destino,
    this.habitacion,
  });

  @override
  List<Object?> get props => [
        codPublicoPaciente,
        codEstadoPublico,
        fechaHora,
        texto,
        destino,
        habitacion,
      ];

  PatientStatus copyWith({
    String? codPublicoPaciente,
    String? codEstadoPublico,
    DateTime? fechaHora,
    String? texto,
    String? destino,
    String? habitacion,
  }) {
    return PatientStatus(
      codPublicoPaciente: codPublicoPaciente ?? this.codPublicoPaciente,
      codEstadoPublico: codEstadoPublico ?? this.codEstadoPublico,
      fechaHora: fechaHora ?? this.fechaHora,
      texto: texto ?? this.texto,
      destino: destino ?? this.destino,
      habitacion: habitacion ?? this.habitacion,
    );
  }


}