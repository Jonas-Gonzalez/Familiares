import 'package:equatable/equatable.dart';
import '../../domain/entities/patient_notification.dart';

sealed class NotificationsState extends Equatable {
  const NotificationsState();
}

class NotificationsLoading extends NotificationsState {
  const NotificationsLoading();
  @override List<Object?> get props => [];
}

class NotificationsLoaded extends NotificationsState {
  final List<PatientNotification> notifications;
  const NotificationsLoaded(this.notifications);
  @override List<Object?> get props => [notifications];
}

class NotificationsEmpty extends NotificationsState {
  const NotificationsEmpty();
  @override List<Object?> get props => [];
}

class NotificationsError extends NotificationsState {
  final String message;
  const NotificationsError(this.message);
  @override List<Object?> get props => [message];
}