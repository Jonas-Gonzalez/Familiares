import 'package:fwd_app/features/hospital/domain/entities/hospital.dart';
import 'package:fwd_app/features/hospital/domain/entities/estado_publico.dart';
import 'package:fwd_app/features/hospital/domain/entities/opcion_menu.dart';
import 'package:fwd_app/features/hospital/domain/entities/idioma.dart';

class HospitalDataDto {
  final Map<String, dynamic> hospitalRaw;
  final List<Map<String, dynamic>> estadosRaw;
  final List<Map<String, dynamic>> opcionesMenuRaw;
  final List<Map<String, dynamic>> idiomasRaw;

  const HospitalDataDto({
    required this.hospitalRaw,
    required this.estadosRaw,
    required this.opcionesMenuRaw,
    required this.idiomasRaw,
  });

  factory HospitalDataDto.fromJson(Map<String, dynamic> json) {
    final data = json['hospitalData'] as List<dynamic>;

    return HospitalDataDto(
      hospitalRaw:     Map<String, dynamic>.from((data[0] as List).first),
      estadosRaw:      (data[1] as List).map((e) => Map<String, dynamic>.from(e)).toList(),
      opcionesMenuRaw: (data[2] as List).map((e) => Map<String, dynamic>.from(e)).toList(),
      idiomasRaw:      (data[3] as List).map((e) => Map<String, dynamic>.from(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'hospitalData': [
      [hospitalRaw],
      estadosRaw,
      opcionesMenuRaw,
      idiomasRaw,
    ],
  };

  // --- Hospital ---
  Hospital toHospital() {
    final h = hospitalRaw;
    return Hospital(
      id:              h['idhospital'] as int,
      nombre:          h['nombre'] as String,
      direccion:       h['direccion'] as String,
      telefono:        h['telefono'] as String,
      web:             h['web'] as String,
      email:           h['email'] as String,
      version:         h['version'] as int,
      colorPrimario:   h['color_primario'] as String,
      colorSecundario: h['color_secundario'] as String?,
      colorTerciario:  h['color_terciario'] as String?,
      imagen1:         h['imagen1'] as String?,
      imagen2:         h['imagen2'] as String?,
    );
  }

  // --- Estados públicos ---
  List<EstadoPublico> toEstados() {
    return estadosRaw.map((e) {
      return EstadoPublico(
        id:               e['idestado_publico'] as int,
        idHospital:       e['idhospital'] as int,
        codEstadoPublico: e['codestado_publico'] as String,
        idTexto:          e['idtexto'] as int,
        esFinal:          e['estado_final'] == 1,
        codIdioma:        e['codidioma'] as String,
        texto:            e['texto'] as String,
      );
    }).toList();
  }

  // --- Opciones de menú ---
  List<OpcionMenu> toOpcionesMenu() {
    return opcionesMenuRaw.map((e) {
      return OpcionMenu(
        id:                    e['idopcion_menu'] as int,
        visibleHome:           e['visible_home'] == 1,
        visibleMenu:           e['visible_menu'] == 1,
        visibleMenuSalaEspera: e['visible_menu_sala_espera'] == 1,
        url:                   e['url'] as String?,
        texto:                 e['texto'] as String,
        tipoFuncionalidad:     _parseTipoFuncionalidad(e['idtipo_funcionalidad'] as int),
        codIdioma:             e['codidioma'] as String,
        color:                 e['color'] as String,
        icon:                  e['icon'] as String,
      );
    }).toList();
  }

  // --- Idiomas ---
  List<Idioma> toIdiomas() {
    return idiomasRaw.map((e) {
      return Idioma(
        id:           e['ididioma'] as int,
        codigo:       e['codidioma'] as String,
        esPorDefecto: e['por_defecto'] == 1,
      );
    }).toList();
  }

  // --- Helper enum ---
  TipoFuncionalidad _parseTipoFuncionalidad(int id) {
    switch (id) {
      case 1:  return TipoFuncionalidad.home;
      case 2:  return TipoFuncionalidad.salaEspera;
      case 3:  return TipoFuncionalidad.web;
      case 4:  return TipoFuncionalidad.settings;
      default: return TipoFuncionalidad.home;
    }
  }
}