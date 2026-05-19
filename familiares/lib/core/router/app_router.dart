import 'package:fwd_app/features/notifications/domain/usecases/get_patient_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import '../../features/notifications/presentations/bloc/notifications_cubit.dart';
import '../../features/notifications/presentations/pages/notifications_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final appRouter = GoRouter(
  initialLocation: '/notifications/AB 12',  // temporal para probar
  routes: [
    GoRoute(
  path: '/notifications/:publicCode',
  builder: (context, state) {
    final publicCode = state.pathParameters['publicCode']!;
    return BlocProvider(
      create: (_) => NotificationsCubit(
        GetIt.I<GetPatientNotifications>(),
      ),
      child: NotificationsPage(publicCode: publicCode),
    );
  },
),
  ],
);