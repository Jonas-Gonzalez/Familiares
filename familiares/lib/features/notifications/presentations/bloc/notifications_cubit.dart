import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_patient_notifications.dart';
import 'notifications_state.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  final GetPatientNotifications _getPatientNotifications;

  NotificationsCubit(this._getPatientNotifications)
      : super(const NotificationsLoading());

  Future<void> load(String codPublicoPaciente) async {
    emit(const NotificationsLoading());

    final result = await _getPatientNotifications(codPublicoPaciente);

    result.fold(
      (failure) => emit(NotificationsError(failure.message)),
      (list) => emit(
        list.isEmpty ? const NotificationsEmpty() : NotificationsLoaded(list),
      ),
    );
  }
}