// lib/features/hospital/domain/entities/opcion_menu.dart
import 'package:equatable/equatable.dart';

enum TipoFuncionalidad { web, salaEspera, settings, home }

/// color es un string hexadecimal ej: #00cbcb
/// icon es el nombre del icono
class OpcionMenu extends Equatable {
  final int id;
  final bool visibleHome;
  final bool visibleMenu;
  final bool visibleMenuSalaEspera;
  final String? url;
  final String texto;
  final TipoFuncionalidad tipoFuncionalidad;
  final String codIdioma;
  final String color;
  final String icon;

  const OpcionMenu({
    required this.id,
    required this.visibleHome,
    required this.visibleMenu,
    required this.visibleMenuSalaEspera,
    this.url,
    required this.texto,
    required this.tipoFuncionalidad,
    required this.codIdioma,
    required this.color,
    required this.icon,
  });

  @override
  List<Object?> get props => [
        id,
        visibleHome,
        visibleMenu,
        visibleMenuSalaEspera,
        url,
        texto,
        tipoFuncionalidad,
        codIdioma,
        color,
        icon,
      ];

  OpcionMenu copyWith({
    int? id,
    bool? visibleHome,
    bool? visibleMenu,
    bool? visibleMenuSalaEspera,
    String? url,
    String? texto,
    TipoFuncionalidad? tipoFuncionalidad,
    String? codIdioma,
    String? color,
    String? icon,
  }) {
    return OpcionMenu(
      id: id ?? this.id,
      visibleHome: visibleHome ?? this.visibleHome,
      visibleMenu: visibleMenu ?? this.visibleMenu,
      visibleMenuSalaEspera: visibleMenuSalaEspera ?? this.visibleMenuSalaEspera,
      url: url ?? this.url,
      texto: texto ?? this.texto,
      tipoFuncionalidad: tipoFuncionalidad ?? this.tipoFuncionalidad,
      codIdioma: codIdioma ?? this.codIdioma,
      color: color ?? this.color,
      icon: icon ?? this.icon,
    );
  }


}