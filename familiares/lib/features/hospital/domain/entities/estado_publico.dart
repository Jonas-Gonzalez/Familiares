// lib/features/hospital/domain/entities/estado_publico.dart
import 'package:equatable/equatable.dart';

class EstadoPublico extends Equatable {
  final int id;
  final int idHospital;
  final String codEstadoPublico;
  final int idTexto;
  final bool esFinal;        // Mapeado: estado_final == 1
  final String codIdioma;
  final String texto;

  const EstadoPublico({
  required this.id,
  required this.idHospital,
  required this.codEstadoPublico,
  required this.idTexto,
  required this.esFinal,
  required this.codIdioma,
  required this.texto,
  });
  @override List<Object?> get props => [
    id,
    idHospital,
    codEstadoPublico,
    idTexto,
    esFinal,
    codIdioma,
    texto,
  ];
  EstadoPublico copyWith({
    int?id,
    int?idHospital,
    String?codEstadoPublico,
    int?idTexto,
    bool?esFinal,
    String?codIdioma,
    String?texto,
  }) {
    return EstadoPublico(
      id: id ?? this.id,
      idHospital: idHospital ?? this.idHospital, 
      codEstadoPublico: codEstadoPublico ?? this.codEstadoPublico,
      idTexto: idTexto ?? this.idTexto, 
      esFinal: esFinal ?? this.esFinal,
      codIdioma: codIdioma ?? this.codIdioma,
      texto: texto ?? this.texto,
      );
  }

}