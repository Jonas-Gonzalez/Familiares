// lib/features/hospital/domain/entities/idioma.dart
import 'package:equatable/equatable.dart';

/// codigo sigue el estándar ISO 639-1: "es", "cat", "en"
/// esPorDefecto indica qué idioma se usa si el usuario no ha elegido uno
class Idioma extends Equatable {
  final int id;
  final String codigo;
  final bool esPorDefecto;

  const Idioma({
    required this.id,
    required this.codigo,
    required this.esPorDefecto,
  });

  @override
  List<Object?> get props => [
        id,
        codigo,
        esPorDefecto,
      ];

  Idioma copyWith({
    int? id,
    String? codigo,
    bool? esPorDefecto,
  }) {
    return Idioma(
      id: id ?? this.id,
      codigo: codigo ?? this.codigo,
      esPorDefecto: esPorDefecto ?? this.esPorDefecto,
    );
  }

  
}