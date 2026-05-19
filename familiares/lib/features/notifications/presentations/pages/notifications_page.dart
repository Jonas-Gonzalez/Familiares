import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/notifications_cubit.dart';
import '../bloc/notifications_state.dart';
import '../widgets/notification_tile.dart';

class NotificationsPage extends StatefulWidget {
  final String publicCode;

  const NotificationsPage({super.key, required this.publicCode});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationsCubit>().load(widget.publicCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notificaciones')),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) => switch (state) {
          NotificationsLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          NotificationsLoaded(:final notifications) => ListView.separated(
              itemCount: notifications.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (_, i) => NotificationTile(
                notification: notifications[i],
                index: i,
              ),
            ),
          NotificationsEmpty() => Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'No existen notificaciones para ${widget.publicCode}',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          NotificationsError(:final message) => Center(
              child: Text(message),
            ),
        },
      ),
    );
  }
}