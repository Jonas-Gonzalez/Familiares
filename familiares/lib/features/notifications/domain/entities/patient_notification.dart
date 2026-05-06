// lib/features/notifications/domain/entities/patient_notification.dart
import 'package:equatable/equatable.dart';


class PatientNotification extends Equatable {
  final int id;
  final DateTime fechaHora;
  final int idHospital;
  final String codPublicoPaciente;
  final String texto;

  const PatientNotification({
    required this.id,
    required this.fechaHora,
    required this.idHospital,
    required this.codPublicoPaciente,
    required this.texto,
  });

  @override
  List<Object?> get props => [
        id,
        fechaHora,
        idHospital,
        codPublicoPaciente,
        texto,
      ];

  PatientNotification copyWith({
    int? id,
    DateTime? fechaHora,
    int? idHospital,
    String? codPublicoPaciente,
    String? texto,
  }) {
    return PatientNotification(
      id: id ?? this.id,
      fechaHora: fechaHora ?? this.fechaHora,
      idHospital: idHospital ?? this.idHospital,
      codPublicoPaciente: codPublicoPaciente ?? this.codPublicoPaciente,
      texto: texto ?? this.texto,
    );
  }


}