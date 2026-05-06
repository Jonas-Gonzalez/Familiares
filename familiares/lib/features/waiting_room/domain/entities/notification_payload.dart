import 'package:equatable/equatable.dart';

enum NotificationType { aviso, notificacionPorDefecto }

class NotificationPayload extends Equatable {
  final String codPublico;
  final NotificationType tipo;
  final int idHospital;

  const NotificationPayload({
    required this.codPublico,
    required this.tipo,
    required this.idHospital,
  });

  @override
  List<Object?> get props => [codPublico, tipo, idHospital];
  NotificationPayload copyWith({
    String? codPublico,
    NotificationType? tipo,
    int? idHospital,
  }) {
    return NotificationPayload(
      codPublico: codPublico ?? this.codPublico,
      tipo: tipo ?? this.tipo,
      idHospital: idHospital ?? this.idHospital,
    );
  }
}
