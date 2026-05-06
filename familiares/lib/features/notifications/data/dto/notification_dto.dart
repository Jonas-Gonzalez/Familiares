import 'package:fwd_app/features/notifications/domain/entities/patient_notification.dart';

class PatientNotificationDto {
  final int id;
  final String fechaHora;
  final int idHospital;
  final String codPublicoPaciente;
  final String texto;

  const PatientNotificationDto({
    required this.id,
    required this.fechaHora,
    required this.idHospital,
    required this.codPublicoPaciente,
    required this.texto,
  });

  factory PatientNotificationDto.fromJson(Map<String, dynamic> json) {
    return PatientNotificationDto(
      id: json['id'] as int,
      fechaHora: json['fechahora'] as String,
      idHospital: json['idhospital'] as int,
      codPublicoPaciente: json['cod_publico_paciente'] as String,
      texto: json['texto'] as String,
    );
  }

  PatientNotification toDomain() {
    return PatientNotification(
      id: id,
      fechaHora: DateTime.tryParse(fechaHora) ?? DateTime.now(),
      idHospital: idHospital,
      codPublicoPaciente: codPublicoPaciente,
      texto: texto,
    );
  }
}
