// lib/features/hospital/domain/entities/hospital.dart
import 'package:equatable/equatable.dart';


class Hospital extends Equatable {
  final int id;
  final String nombre;
  final String direccion;
  final String telefono;
  final String web;
  final String email;
  final int version;
  final String colorPrimario;
  final String? colorSecundario;
  final String? colorTerciario;
  final String? imagen1; // Base64 o URL
  final String? imagen2;

  const Hospital({
    required this.id,
    required this.nombre,
    required this.direccion,
    required this.telefono,
    required this.web,
    required this.email,
    required this.version,
    required this.colorPrimario,
    this.colorSecundario,
    this.colorTerciario,
    this.imagen1,
    this.imagen2,
  });

  @override
  List<Object?> get props => [
        id,
        nombre,
        direccion,
        telefono,
        web,
        email,
        version,
        colorPrimario,
        colorSecundario,
        colorTerciario,
        imagen1,
        imagen2,
      ];

  Hospital copyWith({
    int? id,
    String? nombre,
    String? direccion,
    String? telefono,
    String? web,
    String? email,
    int? version,
    String? colorPrimario,
    String? colorSecundario,
    String? colorTerciario,
    String? imagen1,
    String? imagen2,
  }) {
    return Hospital(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      direccion: direccion ?? this.direccion,
      telefono: telefono ?? this.telefono,
      web: web ?? this.web,
      email: email ?? this.email,
      version: version ?? this.version,
      colorPrimario: colorPrimario ?? this.colorPrimario,
      colorSecundario: colorSecundario ?? this.colorSecundario,
      colorTerciario: colorTerciario ?? this.colorTerciario,
      imagen1: imagen1 ?? this.imagen1,
      imagen2: imagen2 ?? this.imagen2,
    );
  }
}
