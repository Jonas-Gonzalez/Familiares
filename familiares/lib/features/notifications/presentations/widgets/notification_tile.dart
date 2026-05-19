import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/patient_notification.dart';

class NotificationTile extends StatelessWidget {
  final PatientNotification notification;
  final int index;

  const NotificationTile({
    super.key,
    required this.notification,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fecha = DateFormat('dd/MM/yyyy HH:mm:ss').format(notification.fechaHora);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: theme.colorScheme.primary,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fecha, style: theme.textTheme.bodySmall),
                const SizedBox(height: 4),
                Text(notification.texto, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}