// lib/features/hospital/presentation/bloc/hospital_state.dart
import 'package:equatable/equatable.dart';
import 'package:fwd_app/features/hospital/domain/entities/estado_publico.dart';
import 'package:fwd_app/features/hospital/domain/entities/hospital.dart';
import 'package:fwd_app/features/hospital/domain/entities/idioma.dart';
import 'package:fwd_app/features/hospital/domain/entities/opcion_menu.dart';

sealed class HospitalState extends Equatable {
  const HospitalState();
  @override
  List<Object?> get props => [];
}

class HospitalInitial extends HospitalState {}

class HospitalLoading extends HospitalState {}

class HospitalLoaded extends HospitalState {
  final Hospital hospital;
  final List<EstadoPublico> estados;
  final List<OpcionMenu> opcionesMenu;
  final List<Idioma> idiomas;

  const HospitalLoaded({
    required this.hospital,
    required this.estados,
    required this.opcionesMenu,
    required this.idiomas,
  });

  @override
  List<Object?> get props => [hospital, estados, opcionesMenu, idiomas];
}

class HospitalError extends HospitalState {
  final String message;
  const HospitalError(this.message);

  @override
  List<Object?> get props => [message];
}